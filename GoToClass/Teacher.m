//
//  Teacher.m
//  GoToClass
//
//  Created by Leppard on 5/23/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher


-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.college forKey:@"college"];
    [aCoder encodeObject:self.school forKey:@"school"];
    [aCoder encodeObject:self.picture forKey:@"picture"];
    [aCoder encodeObject:self.comment forKey:@"comment"];

}


-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.college = [aDecoder decodeObjectForKey:@"college"];
        self.school = [aDecoder decodeObjectForKey:@"school"];
        self.picture = [aDecoder decodeObjectForKey:@"picture"];
        self.comment = [aDecoder decodeObjectForKey:@"comment"];
    }
    return self;
}

@end
