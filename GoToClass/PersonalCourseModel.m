//
//  PersonalCourseModel.m
//  GoToClass
//
//  Created by Leppard on 5/18/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "PersonalCourseModel.h"

@implementation PersonalCourseModel

-(void)initPersonalCourseModel {

    NSData *courseData = [[NSUserDefaults standardUserDefaults]objectForKey:@"PersonalCourseList"];
    if (courseData == nil) {
        self.personalCourseList = [[NSMutableArray alloc]init];
//            
//        Course *course1 = [[Course alloc]init];
//        course1.name = @"软件测试技术";
//        course1.teacher = @"刘琴";
//        course1.weekDate = [NSNumber numberWithInt:3];
//        course1.dayTime = [NSNumber numberWithInt:2];
//        course1.room = @"济事楼430";
//        course1.address = @"上海市嘉定区同济大学济事楼";
//        [self.personalCourseList addObject:course1];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.personalCourseList];
        
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"PersonalCourseList"];
    }
}

-(NSMutableArray *)getCourseList {
    NSData *courseData = [[NSUserDefaults standardUserDefaults]objectForKey:@"PersonalCourseList"];

    return [NSKeyedUnarchiver unarchiveObjectWithData:courseData];
}

-(void)addTheCourse:(Course *)course {
    NSData *courseData = [[NSUserDefaults standardUserDefaults]objectForKey:@"PersonalCourseList"];
    self.personalCourseList = [NSKeyedUnarchiver unarchiveObjectWithData:courseData];
    
    [self.personalCourseList addObject:course];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.personalCourseList];
    
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"PersonalCourseList"];

}


-(void)deleteTheCourse:(Course *)course {

}


@end
