//
//  Course.h
//  GoToClass
//
//  Created by Leppard on 4/19/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Teacher.h"

@interface Course : NSObject<NSCoding>

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) Teacher *teacher;
@property(nonatomic,strong) NSString *school;
@property(nonatomic,strong) NSString *address;
@property(nonatomic,strong) NSString *room;
@property(nonatomic,strong) NSNumber *weekDate;
@property(nonatomic,strong) NSNumber *dayTime;

- (NSString*)setWeekDayFormat:(NSNumber*) weekDay;
- (NSString*)setDayTimeFormat:(NSNumber*) dayTime;


@end
