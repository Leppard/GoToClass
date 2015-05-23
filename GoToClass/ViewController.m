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
#import "PersonalCourseVC.h"
#import "ListOfSchoolVC.h"

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
    TeacherListVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TeacherListVC"];
    NSData *data = [[NSUserDefaults standardUserDefaults]objectForKey:@"NoRepeatTeachersList"];
    vc.noRepeatTeachersList = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    UINavigationController *nVC =  [[UINavigationController alloc]initWithRootViewController:vc];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(backToRootForNVCBarItemSelector:)];
    leftButton.tintColor = [UIColor blackColor];
    vc.navigationItem.leftBarButtonItem = leftButton;
    
    nVC.transitioningDelegate = self;
    nVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:nVC animated:YES completion:nil];
}

- (IBAction)btnSearchSchool:(id)sender {
    
    ListOfSchoolVC *vc = [[ListOfSchoolVC alloc]init];
    UINavigationController *nVC = [[UINavigationController alloc]initWithRootViewController:vc];

    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(backToRootForNVCBarItemSelector:)];
    leftButton.tintColor = [UIColor blackColor];
    vc.navigationItem.leftBarButtonItem = leftButton;

    nVC.transitioningDelegate = self;
    nVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:nVC animated:YES completion:nil];
    
}

- (IBAction)btnSearchTime:(id)sender {
}
- (IBAction)btnAbout:(id)sender {
}

- (IBAction)btnMySelection:(id)sender {
    
    PersonalCourseVC *vc = [[PersonalCourseVC alloc]init];
    vc.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    PersonalCourseModel *personalList = [[PersonalCourseModel alloc]init];
    vc.personalCourseList = [personalList getCourseList];
    
    UINavigationController *nVC = [[UINavigationController alloc]initWithRootViewController:vc];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(backToRootForNVCBarItemSelector:)];
    leftButton.tintColor = [UIColor blackColor];
    vc.navigationItem.leftBarButtonItem = leftButton;
    
    [self presentViewController:nVC animated:YES completion:nil];
    
    
}

- (void)backToRootForNVCBarItemSelector:(UIBarButtonItem *)thisItem {
    
    UINavigationController *nVC = thisItem.target;
    [nVC dismissViewControllerAnimated:YES completion:nil];

}
@end
