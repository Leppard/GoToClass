//
//  ViewController.m
//  GoToClass
//
//  Created by Leppard on 4/19/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "ViewController.h"
#import "TeacherListVC.h"
#import "TeacherDetailVC.h"
#import "PersonalCourseModel.h"
#import <pop/POP.h>
#import "PresentingAnimator.h"
#import "DismissingAnimator.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

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


#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return [PresentingAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [DismissingAnimator new];
}



- (IBAction)btnSearchTeacher:(id)sender {
    
    UINavigationController *vc =  [self.storyboard instantiateViewControllerWithIdentifier:@"TeachersListNC"];

    vc.transitioningDelegate = self;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)btnSearchSchool:(id)sender {
}

- (IBAction)btnSearchTime:(id)sender {
}
- (IBAction)btnAbout:(id)sender {
}

- (IBAction)btnMySelection:(id)sender {
    
    TeacherDetailVC *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CourseDetailVC"];
    
    PersonalCourseModel *personalList = [[PersonalCourseModel alloc]init];
    detailVC.courseListOfTeacher = [personalList getCourseList];
    
    UINavigationController *nVC = [[UINavigationController alloc]initWithRootViewController:detailVC];
    
    [self presentViewController:nVC animated:YES completion:nil];
    
}
@end
