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

//    self.tableView.layer.cornerRadius = 10.f;
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
    return [self.noRepeatTeachersList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    if(indexPath.row%2 == 0){
        
        UIImageView *view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"blueLabel"]];
        cell.backgroundView = view;
    }
    
    else{
       
        UIImageView *view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"whiteLabel"]];
        cell.backgroundView = view;
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



#pragma mark - btn Dismiss NC

- (IBAction)btnDismissTList:(id)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
