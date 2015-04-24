//
//  ViewController.m
//  GoToClass
//
//  Created by Leppard on 4/19/15.
//  Copyright (c) 2015 Leppard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jumpTest:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"hahah" message:@"haha" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil , nil];
    [alert show];
}
@end
