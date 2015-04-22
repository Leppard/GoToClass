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
             
             NSDate *aimDay = [cal dateFromComponents:compt];
             
             NSTimeZone *zone = [NSTimeZone systemTimeZone];
             NSInteger interval = [zone secondsFromGMTForDate:aimDay];
             NSDate *aimTime = [aimDay dateByAddingTimeInterval:interval];
             
             
             //    NSTimeInterval secondsPerDay = 24*60*60;
             //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
             //    NSDate *date = [NSDate date];
             //    NSInteger i = [zone secondsFromGMTForDate:date];
             //
             //    NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
             //    NSDate *local = [tomorrow dateByAddingTimeInterval:i];
             //    NSLog(@"myDate = %@",local);
             
             myEvent.startDate = aimTime;
             
             myEvent.endDate   = aimTime;
             myEvent.allDay = YES;
             
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
@end

