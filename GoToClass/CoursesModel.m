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
            
            Course *course2 = [[Course alloc]init];
            course2.name = @"Math";
            course2.teacher = @"Zhang";
            
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
