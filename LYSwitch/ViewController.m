//
//  ViewController.m
//  LYSwitch
//
//  Created by LI Yi on 7/9/13.
//  Copyright (c) 2013 LI Yi. All rights reserved.
//

#import "ViewController.h"

#import "LYSwitch.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
       
    LYSwitch *switchOn = [[LYSwitch alloc]initWithFrame:CGRectMake(50, 50, 120, 68)];
    switchOn.on = YES;
    [self.view addSubview:switchOn];
    
    LYSwitch *switchOff = [[LYSwitch alloc]initWithFrame:CGRectMake(50, 150, 120, 68)];
    switchOff.on = NO;
    [self.view addSubview:switchOff];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
