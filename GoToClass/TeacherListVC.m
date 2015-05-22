//
//  TeacherListVC.m
//  GoToClass
//
//  Created by Leppard on 4/19/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "TeacherListVC.h"
#import "Course.h"
#import "TeacherDetailVC.h"
#import "TeacherListTableViewCell.h"


@interface TeacherListVC ()

@end

@implementation TeacherListVC

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    self.tableView.rowHeight = 66;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.noRepeatTeachersList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TeacherListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherList"];
    
    if (cell == nil) {
        cell = [[TeacherListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TeacherList"];
    }
    
    Course *course = self.noRepeatTeachersList[indexPath.row];
    cell.teacherName.text = course.teacher;
    
    cell.blockForCell  = ^(void){
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TeacherInfo"];
        
        vc.navigationItem.title = course.teacher;
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    return cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    cell.selected = NO;
}


#pragma mark - Control viewing info


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Course *course = self.noRepeatTeachersList[indexPath.row];
    
    [self performSegueWithIdentifier:@"pushToTeacherDetail" sender:(course.teacher)];
    
    [self.tableView cellForRowAtIndexPath:indexPath].selected = NO;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if([segue.identifier isEqualToString:@"pushToTeacherDetail"]){

        TeacherDetailVC *vc = segue.destinationViewController;
        NSData *data = [[NSUserDefaults standardUserDefaults]objectForKey:@"CoursesList"];
        NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        NSMutableArray *courseOfTeacher = [[NSMutableArray alloc]init];
        for(Course *course in array){
            if([course.teacher isEqualToString:sender]){
                [courseOfTeacher addObject:course];
            }
        }
        vc.courseListOfTeacher = courseOfTeacher;
    }
}


#pragma mark - btn Dismiss NC
- (IBAction)btnDismissTList:(id)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
