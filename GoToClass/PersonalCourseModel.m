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
