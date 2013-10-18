//
//  PAFirstViewController.m
//  PowerApp
//
//  Created by Lane Rettig on 10/16/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PAFirstViewController.h"
#import "PAGoalViewController.h"

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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segueToGoal"]) {
        PAGoalViewController *destination = [segue destinationViewController];
        NSLog(@"prepareForSegue to %@", destination);

        // Retrieve the corresponding element
        int tag = ((UIButton*)sender).tag;
        NSString *element = elements[tag];
        NSLog(@"Got element %@ for button id %d", element, tag);
        
        // Pass in relevant data items (this could be done in a cleaner fashion)
        destination.elementName = element;
        destination.elementHeaderText = [PAApplicationState instance].elements[tag][1];
        destination.elementSubElements = [PAApplicationState instance].elements[tag][2];
    }
}

- (IBAction)back:(UIStoryboardSegue *)segue {
    NSLog(@"Popping back to this view controller!");
    // reset UI elements etc here
}

@end
