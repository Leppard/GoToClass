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

@end
