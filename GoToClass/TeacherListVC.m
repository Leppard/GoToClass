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

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}


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
//    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    UIFont *font = [UIFont fontWithName:@"YuppySC-Regular" size:20];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
       
        UIImageView *view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"row"]];
        cell.backgroundView = view;
    
    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(80, 18, 100, 30)];
//    
//    label.font = font;
//    
//    label.textColor = [UIColor colorWithRed:84.0/255 green:167.0/255 blue:178.0/255 alpha:1];
    if ([cell.contentView viewWithTag:indexPath.row+1] == nil) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(80, 18, 100, 30)];
        
        label.font = font;
        
        label.textColor = [UIColor colorWithRed:84.0/255 green:167.0/255 blue:178.0/255 alpha:1];
        label.tag = indexPath.row+1;
        
        NSString *teacherName = self.noRepeatTeachersList[indexPath.row];
        label.text = teacherName;
        
        [cell.contentView addSubview:label];
    }
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(312, 12, 22, 20)];
    
    btn.tag = indexPath.row;
 
    UIImage *image = [UIImage imageNamed:@"info"];
    
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(btnShowTeacherInfo:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.contentView addSubview:btn];
    
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




- (void)btnShowTeacherInfo:(UIButton *)btn{
    
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TeacherInfo"];
    
    NSString *teacherName = self.noRepeatTeachersList[btn.tag];
    
    vc.navigationItem.title = teacherName;
    [self.navigationController pushViewController:vc animated:YES];

}

#pragma mark - btn Dismiss NC
- (IBAction)btnDismissTList:(id)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
