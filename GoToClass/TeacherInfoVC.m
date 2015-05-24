//
//  TeacherInfoVC.m
//  GoToClass
//
//  Created by Leppard on 5/24/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "TeacherInfoVC.h"

@interface TeacherInfoVC ()

@end

@implementation TeacherInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.picture.image = [UIImage imageNamed:self.teacher.picture];
    self.picture.layer.masksToBounds = YES;
    self.picture.layer.cornerRadius = 50;
    
    self.name.text = self.teacher.name;
    self.college.text = self.teacher.college;
    self.school.text = self.teacher.school;
    self.comment.text = self.teacher.comment;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
