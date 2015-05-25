//
//  DayTimeVC.m
//  GoToClass
//
//  Created by Leppard on 5/25/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "DayTimeVC.h"
#import "Course.h"
#import "TeacherDetailVC.h"
#import "TimeSelectionTableViewCell.h"

@interface DayTimeVC ()

@end

@implementation DayTimeVC

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    self.tableView.rowHeight = 66;
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"frontPageBackground"]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.time1 = [[NSMutableArray alloc]init];
    self.time2 = [[NSMutableArray alloc]init];
    self.time3 = [[NSMutableArray alloc]init];
    self.time4 = [[NSMutableArray alloc]init];
    self.time5 = [[NSMutableArray alloc]init];
    
    for (Course *course in self.courseOfThisDay){
        NSInteger i = [course.dayTime integerValue];
        switch (i) {
            case 1:
                [self.time1 addObject:course];
                break;
            case 2:
                [self.time2 addObject:course];
                break;
            case 3:
                [self.time3 addObject:course];
                break;
            case 4:
                [self.time4 addObject:course];
                break;
            case 5:
                [self.time5 addObject:course];
                break;
                
            default:
                break;
        }
        
    }

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TimeSelectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DayTimeSelection"];
    if (cell == nil) {
        cell = [[TimeSelectionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DayTimeSelection"];
    }
    switch (indexPath.row) {
        case 0:
            cell.label.text = @"上午1-2节";
            break;
        case 1:
            cell.label.text = @"上午3-4节";
            break;
        case 2:
            cell.label.text = @"下午1-2节";
            break;
        case 3:
            cell.label.text = @"下午1-2节";
            break;
        case 4:
            cell.label.text = @"晚上1-3节";
            break;
            
        default:
            break;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TeacherDetailVC *vc = [sb instantiateViewControllerWithIdentifier:@"CourseDetailVC"];
    
    switch (indexPath.row) {
        case 0:
            vc.courseListOfTeacher = self.time1;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        case 1:
            vc.courseListOfTeacher = self.time2;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        case 2:
            vc.courseListOfTeacher = self.time3;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        case 3:
            vc.courseListOfTeacher = self.time4;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        case 4:
            vc.courseListOfTeacher = self.time5;
            [self.navigationController pushViewController:vc animated:YES];
            break;
            
        default:
            break;
    }
    [self.tableView cellForRowAtIndexPath:indexPath].selected = NO;
}


@end
