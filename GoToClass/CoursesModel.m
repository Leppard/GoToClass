//
//  CoursesModel.m
//  GoToClass
//
//  Created by Leppard on 4/19/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "CoursesModel.h"
#import "Course.h"

@implementation CoursesModel

- (void)initCoursesModel{
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"CoursesList"];
        
        if (data == nil) {
            
            self.coursesList = [[NSMutableArray alloc]init];
            
            Course *course1 = [[Course alloc]init];
            course1.name = @"English";
            course1.teacher = @"Li";
            course1.weekDate = [NSNumber numberWithInt:3];
            course1.dayTime = [NSNumber numberWithInt:1];
            
            Course *course2 = [[Course alloc]init];
            course2.name = @"Math";
            course2.teacher = @"Zhang";
            course2.weekDate = [NSNumber numberWithInt:4];
            course2.dayTime = [NSNumber numberWithInt:3];
            
            [self.coursesList addObject:course1];
            [self.coursesList addObject:course2];
            [self saveCourseData];
        }
}

- (void)saveCourseData{
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.coursesList];
   
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"CoursesList"];
}



@end
