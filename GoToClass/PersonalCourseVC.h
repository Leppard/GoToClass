//
//  PersonalCourseVC.h
//  GoToClass
//
//  Created by Leppard on 5/19/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalCourseVC : UITableViewController

@property (nonatomic, strong) NSMutableArray *personalCourseList;
@property (weak, nonatomic) IBOutlet UILabel *courseName;
@property (weak, nonatomic) IBOutlet UILabel *week;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *teacher;
@end
