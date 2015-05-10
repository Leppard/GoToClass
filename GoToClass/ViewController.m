//
//  ViewController.m
//  GoToClass
//
//  Created by Leppard on 4/19/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "ViewController.h"
#import "TeacherListVC.h"
#import <pop/POP.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSearchTeacher:(id)sender {
    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    springAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.view.bounds.size.width/2, -self.view.bounds.size.height/2)];

    springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2)];
    
    
    //弹性值
    springAnimation.springBounciness = 20.0;
    //弹性速度
    springAnimation.springSpeed = 10.0;
    
    UINavigationController *vc =  [self.storyboard instantiateViewControllerWithIdentifier:@"TeachersListNC"];
    
    [vc.view pop_addAnimation:springAnimation forKey:@"WhatEverNameYouWant"];
    
    [self presentViewController:vc animated:NO completion:nil];
}
@end
