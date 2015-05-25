//
//  TimeSelectionTableViewCell.m
//  GoToClass
//
//  Created by Leppard on 5/25/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "TimeSelectionTableViewCell.h"

@implementation TimeSelectionTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"row"]];
        
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(100, 18, 100, 30)];
        
        self.label.font = [UIFont fontWithName:@"YuppySC-Regular" size:22];
        
        self.label.textColor = [UIColor colorWithRed:84.0/255 green:167.0/255 blue:178.0/255 alpha:1];
        
        
        [self.contentView addSubview:self.label];
    }
    return self;
    
}


@end
