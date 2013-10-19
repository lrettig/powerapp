//
//  PAFirstViewController.m
//  PowerApp
//
//  Created by Lane Rettig on 10/16/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PAFirstViewController.h"
#import "PAApplicationState.h"
#import "PAGoal.h"
#import "PAElementDetailViewController.h"

@interface PAFirstViewController ()

@end

@implementation PAFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self addTasks];
}

//- (void)viewWillAppear:(BOOL)animated {
//    // Display the current list of goals
//    // Do this here rather than in viewDidLoad so we can refresh the list of
//    // goals after a modal sub VC goes away.
//
//}

- (void)addTasks {
    // Clear all existing goals
    [[self.viewTasks subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    taskPaths = [NSMutableArray array];

    // Get the list of current goals
    NSArray *goals = [PAApplicationState instance].goals;
    int numGoals = [goals count];
    
    // This math requires at least one goal
    NSAssert(numGoals>0, @"require at least one goal");
    
    // Calculate dimensions
    int goalSpacing = 5;
    
    // Use MIN to set max height to 30.
    // If we have e.g. only two goals we don't want to space them too far apart.
    int goalHeight = MIN(floor((self.viewTasks.frame.size.height - (goalSpacing * (numGoals-1)))/numGoals), 90);

    NSMutableArray *taskButtonsTemp = [NSMutableArray array];
    
    for (int i=0; i<numGoals; i++) {
        // Get the data
        PAGoal *goal = goals[i];
        NSArray *randomTask = [goal getRandomTask];
        NSString *randomTaskString = randomTask[0];
        // Pack up the path and store it
        [taskPaths addObject:@[[NSNumber numberWithInt:i], randomTask[1]]];
        
        // Geometry
        int goalY = i * (goalHeight + goalSpacing);

        // Create the goal button
        UIButton *goalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [goalButton setTitle:randomTaskString forState:UIControlStateNormal];
        [goalButton.titleLabel setFont:[UIFont systemFontOfSize:21]];
        [goalButton.titleLabel setNumberOfLines:0];
        [goalButton.titleLabel setTextAlignment:NSTextAlignmentLeft];
        [goalButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [goalButton setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
        
        goalButton.tag = i;
        [goalButton addTarget:self action:@selector(taskButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
//        NSLog(@"Adding goal button number %d for %@ at %d, %d", i, goal.name, 0, goalY);
        [goalButton setFrame:CGRectMake(0, goalY, self.viewTasks.frame.size.width, goalHeight)];
        [self.viewTasks addSubview:goalButton];
        [taskButtonsTemp addObject:goalButton];
    }
    taskButtons = taskButtonsTemp;
}

-(void)taskButtonPressed:(id)sender {
    NSLog(@"taskButtonPressed from %@", sender);
    [self performSegueWithIdentifier:@"segueToTask" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segueToTask"]) {
        NSLog(@"Segue to task from %@", sender);
        UINavigationController *nav = [segue destinationViewController];
        PAElementDetailViewController *destination = (PAElementDetailViewController *)nav.topViewController;
        destination.goal = [PAApplicationState instance].goals[[taskPaths[((UIButton *)sender).tag][0] integerValue]];
        destination.elementPath = [taskPaths[((UIButton *)sender).tag][1] integerValue];
    }
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
