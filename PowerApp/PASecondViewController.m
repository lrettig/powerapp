//
//  PASecondViewController.m
//  PowerApp
//
//  Created by Lane Rettig on 10/16/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PASecondViewController.h"
#import "PAGoalViewController.h"
#import "PAApplicationState.h"
#import "PAGoal.h"

@interface PASecondViewController ()

@end

@implementation PASecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    // Display the current list of goals
    // Do this here rather than in viewDidLoad so we can refresh the list of
    // goals after a modal sub VC goes away.
    [self addGoals];
}

- (void)addGoals {
    // Clear all existing goals
    [[self.viewCurrentGoals subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];

    // Get the list of current goals
    NSArray *goals = [PAApplicationState instance].goals;
    int numGoals = [goals count];
    
    // This math requires at least one goal
    NSAssert(numGoals>0, @"require at least one goal");
    
    // Calculate dimensions
    int goalSpacing = 5;
    
    // Min height = 30, max = 60.

    // Use MIN to set max height to 30.
    // If we have e.g. only two goals we don't want to space them too far apart.
    int goalHeight = MIN(floor((self.viewCurrentGoals.frame.size.height - (goalSpacing * (numGoals-1)))/numGoals), 90);

    NSMutableArray *goalButtonsTemp = [NSMutableArray array];
    
    for (int i=0; i<numGoals; i++) {
        // Get the data
        PAGoal *goal = goals[i];
        int goalY = i * (goalHeight + goalSpacing);
        
        // Create the goal button
        UIButton *goalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [goalButton setTitle:goal.name forState:UIControlStateNormal];
        [goalButton.titleLabel setFont:[UIFont systemFontOfSize:21]];
        [goalButton.titleLabel setNumberOfLines:0];
        [goalButton.titleLabel setTextAlignment:NSTextAlignmentLeft];
        [goalButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [goalButton setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
        
        goalButton.tag = i;
        [goalButton addTarget:self action:@selector(goalButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        NSLog(@"Adding goal button number %d for %@ at %d, %d", i, goal.name, 0, goalY);
        [goalButton setFrame:CGRectMake(0, goalY, self.viewCurrentGoals.frame.size.width, goalHeight)];
        [self.viewCurrentGoals addSubview:goalButton];
        [goalButtonsTemp addObject:goalButton];
        
        // Figure out the size of the thing we just made
        CGSize buttonSize = [goalButton.titleLabel.text sizeWithFont:goalButton.titleLabel.font constrainedToSize:CGSizeMake(self.viewCurrentGoals.frame.size.width, goalHeight) lineBreakMode:goalButton.titleLabel.lineBreakMode];
        NSLog(@"Button size is %f, %f", buttonSize.height, buttonSize.width);

        // Create the status line
        UILabel *goalStatus = [[UILabel alloc] init];
        [goalStatus setText:[NSString stringWithFormat:@"Status: %@", [goal statusText]]];
        [goalStatus setFrame:CGRectMake(0, goalY+buttonSize.height, self.viewCurrentGoals.frame.size.width, 20)];
        [self.viewCurrentGoals addSubview:goalStatus];
    }
    goalButtons = [NSArray arrayWithArray:goalButtonsTemp];
}

-(void)goalButtonPressed:(id)sender {
    NSLog(@"goalButtonPressed from %@", sender);
    [self performSegueWithIdentifier:@"segueToGoal" sender:sender];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segueToGoal"]) {
        UINavigationController *nav = [segue destinationViewController];
        PAGoalViewController *destination = (PAGoalViewController *)nav.topViewController;
        NSLog(@"prepareForSegue to %@ via %@", destination, nav);

        // Retrieve the corresponding element
        int tag = ((UIButton*)sender).tag;
        NSArray *goals = [PAApplicationState instance].goals;
        PAGoal *goal = goals[tag];
        NSLog(@"Got element %@ for button id %d", goal, tag);
        
        // Pass in relevant data items (this could be done in a cleaner fashion)
        destination.goal = goal;
    }
}


@end
