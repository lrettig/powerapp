//
//  PAFirstViewController.m
//  PowerApp
//
//  Created by Lane Rettig on 10/16/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PAFirstViewController.h"

@interface PAFirstViewController ()

@end

@implementation PAFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(UIStoryboardSegue *)segue {
    NSLog(@"Popping back to this view controller!");
    // reset UI elements etc here
}

@end
