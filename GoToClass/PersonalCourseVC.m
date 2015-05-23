//
//  PersonalCourseVC.m
//  GoToClass
//
//  Created by Leppard on 5/19/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "PersonalCourseVC.h"
#import "Course.h"

@interface PersonalCourseVC ()

@end

@implementation PersonalCourseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 200;
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PersonalCourseCell" owner:self options:nil];
    
    UITableViewCell *cell = [nib objectAtIndex:0];
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"personalCourse"]];
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"frontPageBackground"]];
    
    Course *course = self.personalCourseList[indexPath.row];
    self.courseName.text = course.name;
    self.week.text = [course setWeekDayFormat:course.weekDate];
    self.time.text = [course setDayTimeFormat:course.dayTime];
    self.teacher.text = course.teacher.name;
    
    return cell;
}

@end
