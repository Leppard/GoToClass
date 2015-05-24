//
//  TeacherInfoVC.h
//  GoToClass
//
//  Created by Leppard on 5/24/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Teacher.h"

@interface TeacherInfoVC : UIViewController
@property (nonatomic, strong) Teacher *teacher;

@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *college;
@property (weak, nonatomic) IBOutlet UILabel *school;
@property (weak, nonatomic) IBOutlet UITextView *comment;

@end
