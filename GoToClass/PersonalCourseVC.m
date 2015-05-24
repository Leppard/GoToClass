//
//  PersonalCourseVC.m
//  GoToClass
//
//  Created by Leppard on 5/19/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "PersonalCourseVC.h"
#import "PersonalCourseInfoVC.h"
#import "Course.h"

@interface PersonalCourseVC ()

@end

@implementation PersonalCourseVC

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];    
    self.tableView.rowHeight = 200;
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"frontPageBackground"]];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.personalCourseList count];
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.selected = NO;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PersonalCourseCell" owner:self options:nil];
    
    UITableViewCell *cell = [nib objectAtIndex:0];
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"personalCourse"]];
    
    Course *course = self.personalCourseList[indexPath.row];
    self.courseName.text = course.name;
    self.week.text = [course setWeekDayFormat:course.weekDate];
    self.time.text = [course setDayTimeFormat:course.dayTime];
    self.teacher.text = course.teacher.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PersonalCourseInfoVC *vc = [sb instantiateViewControllerWithIdentifier:@"PersonalCourseVC"];
    vc.course = self.personalCourseList[indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];

    [self.tableView cellForRowAtIndexPath:indexPath].selected = NO;

}

@end
