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
    
    UIImageView *view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CourseD"]];
    cell.backgroundView = view;
    
    Course *course = self.courseListOfTeacher[indexPath.row];
    self.courseName.text = course.name;
    self.week.text = [course setWeekDayFormat:course.weekDate];
    self.time.text = [course setDayTimeFormat:course.dayTime];
    
    UIFont *nameFont = [UIFont fontWithName:@"YuppySC-Regular" size:22];
    [self.courseName setFont:nameFont];
    
    UIFont *font = [UIFont fontWithName:@"YuppySC-Regular" size:17];
    [self.week setFont:font];
    [self.time setFont:font];
    
    return cell;
}


#pragma mark - Selection Control

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"pushToSelection" sender:self.courseListOfTeacher[indexPath.row]];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"pushToSelection"]) {
        ChooseCourseVC *vc = segue.destinationViewController;
        vc.course = sender;
    }


}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
