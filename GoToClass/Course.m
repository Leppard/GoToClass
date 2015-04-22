//
//  Course.m
//  GoToClass
//
//  Created by Leppard on 4/19/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "Course.h"

@implementation Course

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.teacher forKey:@"teacher"];
    [aCoder encodeObject:self.school forKey:@"school"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.weekDate forKey:@"weekDate"];
    [aCoder encodeObject:self.dayTime forKey:@"dayTime"];

}


-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.teacher = [aDecoder decodeObjectForKey:@"teacher"];
        self.school = [aDecoder decodeObjectForKey:@"school"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
        self.weekDate = [aDecoder decodeObjectForKey:@"weekDate"];
        self.dayTime = [aDecoder decodeObjectForKey:@"dayTime"];
    }
    return self;
}

#pragma mark - Set Week And Day Format

- (NSString*)setWeekDayFormat:(NSNumber*) weekDay{
    NSInteger weekInt = [weekDay intValue];
    NSString *weekStr;
    switch (weekInt) {
        case 1:
            weekStr = [NSString stringWithFormat:@"周日"];
            break;
        case 2:
            weekStr = [NSString stringWithFormat:@"周一"];
            break;
        case 3:
            weekStr = [NSString stringWithFormat:@"周二"];
            break;
        case 4:
            weekStr = [NSString stringWithFormat:@"周三"];
            break;
        case 5:
            weekStr = [NSString stringWithFormat:@"周四"];
            break;
        case 6:
            weekStr = [NSString stringWithFormat:@"周五"];
            break;
        case 7:
            weekStr = [NSString stringWithFormat:@"周六"];
            break;
        default:
            break;
    }
    
    return weekStr;
}

- (NSString*)setDayTimeFormat:(NSNumber*) dayTime{
    NSInteger dayInt = [dayTime intValue];
    NSString *dayStr;
    switch (dayInt) {
        case 1:
            dayStr = [NSString stringWithFormat:@"上午1-2节"];
            break;
        case 2:
            dayStr = [NSString stringWithFormat:@"上午3-4节"];
            break;
        case 3:
            dayStr = [NSString stringWithFormat:@"下午1-2节"];
            break;
        case 4:
            dayStr = [NSString stringWithFormat:@"下午3-4节"];
            break;
        case 5:
            dayStr = [NSString stringWithFormat:@"晚上1-3节"];
            break;
        default:
            break;
    }
    
    return dayStr;
}


@end
