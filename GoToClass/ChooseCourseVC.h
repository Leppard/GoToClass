//
//  ChooseCourseVC.h
//  GoToClass
//
//  Created by Leppard on 4/20/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@interface ChooseCourseVC : UIViewController<UIAlertViewDelegate,UIActionSheetDelegate>

@property(nonatomic, strong) Course *course;
@property (weak, nonatomic) IBOutlet UILabel *courseName;
@property (weak, nonatomic) IBOutlet UILabel *week;
@property (weak, nonatomic) IBOutlet UILabel *time;
- (IBAction)confirmToChooseClass:(id)sender;

@end
