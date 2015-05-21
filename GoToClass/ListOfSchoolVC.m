//
//  ListOfSchoolVC.m
//  GoToClass
//
//  Created by Leppard on 5/21/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "ListOfSchoolVC.h"

@interface ListOfSchoolVC ()

@end

@implementation ListOfSchoolVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 200;
    self.tableView.backgroundColor = [UIColor clearColor];
    
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
            break;
        case 1:
            self.schoolName.text = @"复旦大学";
            break;
        case 2:
            self.schoolName.text = @"上海财经大学";
            break;
        default:
            break;
    }
    
    
    
    return cell;
}


@end
