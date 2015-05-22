//
//  ListOfSchoolVC.m
//  GoToClass
//
//  Created by Leppard on 5/21/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "ListOfSchoolVC.h"
#import "TeacherListVC.h"
#import "Course.h"

@interface ListOfSchoolVC ()

@end

@implementation ListOfSchoolVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 200;
    self.tableView.backgroundColor = [UIColor clearColor];
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"NoRepeatTeachersList"];
    NSMutableArray *coursesList = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    for (Course *course in coursesList){
        NSInteger i = [self convertSwitchForSchoolString:course.school];
        switch (i) {
            case 1:
                [self.schoolA addObject:course];
                break;
            case 2:
                [self.schoolB addObject:course];
                break;
            case 3:
                [self.schoolC addObject:course];
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
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SchoolListCell" owner:self options:nil];
    
    UITableViewCell *cell = [nib objectAtIndex:0];
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"school"]];
    
    switch (indexPath.row) {
        case 0:
            self.schoolName.text = @"同济大学";
            self.imageOfSchool.image = [UIImage imageNamed:@"TONGJI"];
            break;
        case 1:
            self.schoolName.text = @"复旦大学";
            self.imageOfSchool.image = [UIImage imageNamed:@"FUDAN"];
            break;
        case 2:
            self.schoolName.text = @"上海财经大学";
            self.imageOfSchool.image = [UIImage imageNamed:@"SHANGHAICAIJING"];
            break;
        default:
            break;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TeacherListVC *vc = [[TeacherListVC alloc]init];
    
    switch (indexPath.row) {
        case 0:
            vc.noRepeatTeachersList = self.schoolA;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        case 1:
            vc.noRepeatTeachersList = self.schoolB;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        case 2:
            vc.noRepeatTeachersList = self.schoolC;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        default:
            break;
    }

    

}

#pragma mark - Switch using NSString as input
-(NSInteger)convertSwitchForSchoolString:(NSString *)str {
    
    if([str isEqualToString:@"TONGJI"])
        return 1;
    else if([str isEqualToString:@"SHANGHAICAIJING"])
        return 2;
    else if([str isEqualToString:@"FUDAN"])
        return 3;
    return 0;
}

@end
