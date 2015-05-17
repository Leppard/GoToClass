//
//  TeacherListTableViewCell.h
//  GoToClass
//
//  Created by Leppard on 5/17/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeacherListTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *teacherName;
@property (nonatomic, copy)void(^blockForCell)(void);

@end
