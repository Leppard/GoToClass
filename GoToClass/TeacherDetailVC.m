//
//  TeacherDetailVC.m
//  GoToClass
//
//  Created by Leppard on 4/20/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "TeacherDetailVC.h"
#import "ChooseCourseVC.h"

@interface TeacherDetailVC ()

@end

@implementation TeacherDetailVC

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {

//    self.navigationController.navigationBar.alpha = 0.3;
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
    return [self.courseListOfTeacher count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TeacherDetailCell" owner:self options:nil];
        
    UITableViewCell *cell = [nib objectAtIndex:0];
    
    UIImageView *view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CourseDetail"]];
    cell.backgroundView = view;
    UIColor *textColor = [UIColor colorWithRed:84.0/255 green:167.0/255 blue:178.0/255 alpha:1];

    
    Course *course = self.courseListOfTeacher[indexPath.row];
    self.courseName.text = course.name;
    self.week.text = [course setWeekDayFormat:course.weekDate];
    self.time.text = [course setDayTimeFormat:course.dayTime];
    
    UIFont *nameFont = [UIFont fontWithName:@"YuppySC-Regular" size:22];
    [self.courseName setFont:nameFont];
    self.courseName.textColor = textColor;
    
    UIFont *font = [UIFont fontWithName:@"YuppySC-Regular" size:17];
    [self.week setFont:font];
    self.week.textColor = textColor;
    
    [self.time setFont:font];
    self.time.textColor = textColor;
    
    return cell;
}


#pragma mark - Selection Control

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"pushToSelection" sender:self.courseListOfTeacher[indexPath.row]];
    
    [self.tableView cellForRowAtIndexPath:indexPath].selected = NO;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"pushToSelection"]) {
        ChooseCourseVC *vc = segue.destinationViewController;
        vc.course = sender;
    }

    
}

@end
