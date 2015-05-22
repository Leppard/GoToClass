//
//  ListOfSchoolVC.h
//  GoToClass
//
//  Created by Leppard on 5/21/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListOfSchoolVC : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *schoolName;
@property (weak, nonatomic) IBOutlet UIImageView *imageOfSchool;

@property (nonatomic, strong) NSMutableArray *schoolA;
@property (nonatomic, strong) NSMutableArray *schoolB;
@property (nonatomic, strong) NSMutableArray *schoolC;

@end
