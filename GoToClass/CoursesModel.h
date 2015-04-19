//
//  CoursesModel.h
//  GoToClass
//
//  Created by Leppard on 4/19/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoursesModel : NSObject


@property(nonatomic, strong)NSMutableArray *coursesList;

- (void)initCoursesModel;
- (void)saveCourseData;

@end
