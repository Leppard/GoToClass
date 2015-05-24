//
//  PersonalCourseInfoVC.m
//  GoToClass
//
//  Created by Leppard on 5/24/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "PersonalCourseInfoVC.h"
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "PersonalCourseModel.h"
#import "PersonalCourseVC.h"
#import "Course.h"

@interface PersonalCourseInfoVC ()

@end

@implementation PersonalCourseInfoVC

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.courseName.text = self.course.name;
    self.teacher.text = self.course.teacher.name;
    self.address.text = self.course.address;
    self.room.text = self.course.room;
    self.week.text = [self.course setWeekDayFormat:self.course.weekDate];
    self.time.text = [self.course setDayTimeFormat:self.course.dayTime];
    
    // Do any additional setup after loading the view.
}


#pragma mark - Btn Action

- (void)btnAlarm:(id)sender {
    EKEventStore *eventDB = [[EKEventStore alloc] init];
    
    [eventDB requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error)
     {
         
         if (granted) {
             
             EKEvent *myEvent  = [EKEvent eventWithEventStore:eventDB];
             
             myEvent.title = [NSString stringWithFormat:@"去蹭课：%@",self.course.name];
             
             NSDate *now = [NSDate date];
             NSCalendar *cal = [NSCalendar currentCalendar];
             NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
             NSDateComponents *compt = [[NSDateComponents alloc]init];
             
             compt = [cal components:unitFlags fromDate:now];
             NSInteger daysToAdd = self.course.weekDate.intValue - compt.weekday;
             if (daysToAdd>=0) {
                 [compt setDay:compt.day+daysToAdd];
             }
             else{
                 [compt setDay:compt.day+7+daysToAdd];
             }
             
             compt = [self setEventTime:self.course.dayTime usingDateComponent:compt];
             
             NSDate *aimDay = [cal dateFromComponents:compt];
             
             //系统Calendar在格林尼治时间上自动会＋8个小时调整到东八区时间，所以直接输入格林尼治时间
             myEvent.startDate = aimDay;
             
             if(self.course.dayTime.intValue != 5){
                 myEvent.endDate  = [aimDay dateByAddingTimeInterval:6000];
             }
             else{
                 myEvent.endDate  = [aimDay dateByAddingTimeInterval:9300];
             }
             
             myEvent.allDay = NO;
             
             
             [myEvent setCalendar:[eventDB defaultCalendarForNewEvents]];
             
             NSError *err;
             
             [eventDB saveEvent:myEvent span:EKSpanThisEvent error:&err];
             
             
             UIAlertView *alert = [[UIAlertView alloc]
                                   initWithTitle:@"创建提醒成功！"
                                   message:@"已添加到日历"
                                   delegate:self
                                   cancelButtonTitle:@"确定"
                                   otherButtonTitles:nil];
             [alert show];
         }
         
     }];
}


-(void)btnLocation:(id)sender {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://map/"]]){
        NSString *urlString = [NSString stringWithFormat:@"baidumap://map/geocoder?address=%@&src=edu.tac|GoToClass",self.course.address];
        urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication]openURL:url];
        
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"打开失败！"
                              message:@"没有找到百度地图"
                              delegate:self
                              cancelButtonTitle:@"确定"
                              otherButtonTitles:nil, nil];
        [alert show];
        
    }

}

-(void)btnPopPersonalCourseInfoVC:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (IBAction)deleteCourse:(id)sender {
    UIActionSheet *confirm = [[UIActionSheet alloc] init];
    
    confirm.title = @"确定要删除选课？";
    
    [confirm addButtonWithTitle:@"确定"];
    [confirm addButtonWithTitle:@"取消"];
    
    confirm.cancelButtonIndex = 1;
    confirm.delegate = self;
    
    [confirm showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
        PersonalCourseModel *model = [[PersonalCourseModel alloc]init];
        NSMutableArray *courseList = [model getCourseList];
        for(Course *course in courseList){
            if([course.name isEqualToString:self.course.name] && [course.weekDate isEqualToNumber:self.course.weekDate] && [course.dayTime isEqualToNumber:self.course.dayTime]){
                [courseList removeObject:course];
                break;
            }
        }
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:courseList];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"PersonalCourseList"];
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"删除成功！"
                          message:@"选课已成功删除"
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil];
    [alert show];
    PersonalCourseVC *vc = [self.navigationController viewControllers][0];
    vc.personalCourseList = courseList;
    [vc.tableView reloadData];
}

#pragma mark - setEventTime

- (NSDateComponents *)setEventTime:(NSNumber *)dayTime usingDateComponent:(NSDateComponents *)compt{
    
    NSInteger i = dayTime.intValue;
    
    switch (i) {
        case 1:
            [compt setHour:8];
            [compt setMinute:0];
            break;
        case 2:
            [compt setHour:10];
            [compt setMinute:0];
            break;
        case 3:
            [compt setHour:13];
            [compt setMinute:30];
            break;
        case 4:
            [compt setHour:15];
            [compt setMinute:25];
            break;
        case 5:
            [compt setHour:18];
            [compt setMinute:30];
            break;
        default:
            break;
    }
    
    return compt;
}

@end
