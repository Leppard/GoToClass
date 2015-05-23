//
//  Teacher.h
//  GoToClass
//
//  Created by Leppard on 5/23/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject <NSCoding>

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *college;
@property(nonatomic,strong) NSString *school;
@property(nonatomic,strong) NSString *picture;
@property(nonatomic,strong) NSString *comment;

@end
