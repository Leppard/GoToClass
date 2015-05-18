//
//  TeacherListTableViewCell.m
//  GoToClass
//
//  Created by Leppard on 5/17/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "TeacherListTableViewCell.h"

@implementation TeacherListTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"row"]];
        
        self.teacherName = [[UILabel alloc]initWithFrame:CGRectMake(80, 18, 100, 30)];
        
        self.teacherName.font = [UIFont fontWithName:@"YuppySC-Regular" size:20];
        
        self.teacherName.textColor = [UIColor colorWithRed:84.0/255 green:167.0/255 blue:178.0/255 alpha:1];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(265, 21, 22, 20)];
        
        
        UIImage *image = [UIImage imageNamed:@"info"];
        
        [btn setBackgroundImage:image forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(btnShowTeacherInfo:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:self.teacherName];
        [self.contentView addSubview:btn];
        
    }
    return self;
    
}

- (void)btnShowTeacherInfo:(UIButton *)btn{
    
    self.blockForCell();
    
}


@end
