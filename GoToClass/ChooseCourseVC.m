//
//  ChooseCourseVC.m
//  GoToClass
//
//  Created by Leppard on 4/20/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "ChooseCourseVC.h"
#import "PersonalCourseModel.h"
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@interface ChooseCourseVC ()

@end

@implementation ChooseCourseVC


- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.courseName.text = self.course.name;
    self.teacher.text = self.course.teacher;
    self.address.text = self.course.address;
    self.room.text = self.course.room;
    self.week.text = [self.course setWeekDayFormat:self.course.weekDate];
    self.time.text = [self.course setDayTimeFormat:self.course.dayTime];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Button Action

- (IBAction)confirmToChooseClass:(id)sender {
    
    UIActionSheet *confirm = [[UIActionSheet alloc] init];
    
    confirm.title = @"已添加到蹭课表!";
    
    [confirm addButtonWithTitle:@"加入日程"];
    [confirm addButtonWithTitle:@"查看地图"];
    
    [confirm addButtonWithTitle:@"确定"];
    
    confirm.cancelButtonIndex = 2;
    confirm.delegate = self;
    
    [confirm showInView:self.view];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        [self addToCalendar];
    }
    
    else if(buttonIndex == 1){
        [self lookUpMap];
    }
    
    PersonalCourseModel *model = [[PersonalCourseModel alloc]init];
    [model addTheCourse:self.course];
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"选课成功！"
                          message:@"课程已添加到课表"
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil];
    [alert show];
}

- (void)addToCalendar{
    
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

- (void)lookUpMap{
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

- (IBAction)btnPopChooseCourseVC:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Set Event Time

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

