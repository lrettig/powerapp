//
//  PANewGoalViewController.m
//  PowerApp
//
//  Created by Lane Rettig on 10/18/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PANewGoalViewController.h"
#import "PAApplicationState.h"
#import "PAGoal.h"

@interface PANewGoalViewController ()

@end

@implementation PANewGoalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    // Add the new goal to the master state
    // NOTE: There are DEFINITELY better, cleaner ways of doing this than
    // mucking with globals.
    // This message should be passed up to the parent VC via some sort of
    // delegate method or something.
    // This is quick and dirty but it works.
    if (self.textfieldNewGoal.text.length) {
        NSLog(@"Adding new goal %@", self.textfieldNewGoal.text);
        PAGoal *newGoal = [PAGoal createWithName:self.textfieldNewGoal.text];
        [[PAApplicationState instance].goals addObject:newGoal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
