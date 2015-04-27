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


@interface TeacherListVC ()

@end

@implementation TeacherListVC

- (void)viewDidLoad {
    NSData *data = [[NSUserDefaults standardUserDefaults]objectForKey:@"NoRepeatTeachersList"];
    self.noRepeatTeachersList = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [super viewDidLoad];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [self.noRepeatTeachersList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    NSString *teacherName = self.noRepeatTeachersList[indexPath.row];
    cell.textLabel.text = teacherName;
    return cell;
}

#pragma mark - Control viewing info

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TeacherInfo"];
    
    NSString *teacherName = self.noRepeatTeachersList[indexPath.row];
    
    vc.navigationItem.title = teacherName;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *teacherName = self.noRepeatTeachersList[indexPath.row];
    
    [self performSegueWithIdentifier:@"pushToTeacherDetail" sender:(teacherName)];

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

-(IBAction)backToRootSelect:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
