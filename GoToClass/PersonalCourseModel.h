//
//  PersonalCourseModel.h
//  GoToClass
//
//  Created by Leppard on 5/18/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"

@interface PersonalCourseModel : NSObject

@property(nonatomic, strong) NSMutableArray *personalCourseList;

-(void)initPersonalCourseModel;
-(NSMutableArray *)getCourseList;
-(void)addTheCourse:(Course *) course;
-(void)deleteTheCourse:(Course *)course;
@end
