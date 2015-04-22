//
//  ChooseCourseVC.m
//  GoToClass
//
//  Created by Leppard on 4/20/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "ChooseCourseVC.h"
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@interface ChooseCourseVC ()

@end

@implementation ChooseCourseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.courseName.text = self.course.name;
    self.week.text = [self.course setWeekDayFormat:self.course.weekDate];
    self.time.text = [self.course setDayTimeFormat:self.course.dayTime];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addToCalendar:(id)sender {
    
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
             
             [compt setDay:compt.day+1];
             
             compt = [self setEventTime:self.course.dayTime usingDateComponent:compt];
             
             NSDate *aimDay = [cal dateFromComponents:compt];
             
//             NSTimeZone *zone = [NSTimeZone systemTimeZone];
//             NSInteger interval = [zone secondsFromGMTForDate:aimDay];
//             NSDate *aimTime = [aimDay dateByAddingTimeInterval:interval];

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
                                   initWithTitle:@"Event Created"
                                   message:@"Yay!?"
                                   delegate:self
                                   cancelButtonTitle:@"Okay"
                                   otherButtonTitles:nil];
             [alert show];
         }
         
     }];
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

