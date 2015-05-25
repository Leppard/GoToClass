//
//  WeekDayVC.m
//  GoToClass
//
//  Created by Leppard on 5/25/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "WeekDayVC.h"
#import "DayTimeVC.h"
#import "Course.h"
#import "TimeSelectionTableViewCell.h"

@interface WeekDayVC ()

@end

@implementation WeekDayVC

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    self.tableView.rowHeight = 66;
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"frontPageBackground"]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"CoursesList"];
    
    NSMutableArray *coursesList = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    self.week7 = [[NSMutableArray alloc]init];
    self.week1 = [[NSMutableArray alloc]init];
    self.week2 = [[NSMutableArray alloc]init];
    self.week3 = [[NSMutableArray alloc]init];
    self.week4 = [[NSMutableArray alloc]init];
    self.week5 = [[NSMutableArray alloc]init];
    self.week6 = [[NSMutableArray alloc]init];
    
    for (Course *course in coursesList){
        NSInteger i = [course.weekDate integerValue];
        switch (i) {
            case 1:
                [self.week7 addObject:course];
                break;
            case 2:
                [self.week1 addObject:course];
                break;
            case 3:
                [self.week2 addObject:course];
                break;
            case 4:
                [self.week3 addObject:course];
                break;
            case 5:
                [self.week4 addObject:course];
                break;
            case 6:
                [self.week5 addObject:course];
                break;
            case 7:
                [self.week6 addObject:course];
                break;

            default:
                break;
        }
        
    }

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 7;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TimeSelectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeekDaySelection"];
    if (cell == nil) {
        cell = [[TimeSelectionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WeekDaySelection"];
    }
    switch (indexPath.row) {
        case 0:
            cell.label.text = @"周日";
            break;
        case 1:
            cell.label.text = @"周一";
            break;
        case 2:
            cell.label.text = @"周二";
            break;
        case 3:
            cell.label.text = @"周三";
            break;
        case 4:
            cell.label.text = @"周四";
            break;
        case 5:
            cell.label.text = @"周五";
            break;
        case 6:
            cell.label.text = @"周六";
            break;

        default:
            break;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DayTimeVC *vc = [[DayTimeVC alloc]init];
    
    switch (indexPath.row) {
        case 0:
            vc.courseOfThisDay = self.week7;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        case 1:
            vc.courseOfThisDay = self.week1;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        case 2:
            vc.courseOfThisDay = self.week2;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        case 3:
            vc.courseOfThisDay = self.week3;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        case 4:
            vc.courseOfThisDay = self.week4;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        case 5:
            vc.courseOfThisDay = self.week5;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        case 6:
            vc.courseOfThisDay = self.week6;
            [self.navigationController pushViewController:vc animated:YES];
            break;
            
        default:
            break;
    }
    
    [self.tableView cellForRowAtIndexPath:indexPath].selected = NO;
    
}

@end
