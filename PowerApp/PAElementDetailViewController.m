//
//  PAElementDetailViewController.m
//  PowerApp
//
//  Created by Lane Rettig on 10/17/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PAElementDetailViewController.h"
#import "PASubElementViewController.h"
#import "PAApplicationState.h"

@interface PAElementDetailViewController ()

@end

@implementation PAElementDetailViewController

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
    
    // Get the element data
    //        NSString *element = elements[tag];
    //        NSLog(@"Got element %@ for button id %d", element, tag);
    
    // Pass in relevant data items (this could be done in a cleaner fashion)
    //        destination.elementName = element;
    //        destination.elementHeaderText = [PAApplicationState instance].elements[tag][1];
    //        destination.elementSubElements = [PAApplicationState instance].elements[tag][2];
    elementName = [PAApplicationState instance].elements[self.elementPath][0];
    self.title = elementName;

    UINib *customCellNib = [UINib nibWithNibName:@"SubElementCell" bundle:nil];
    [self.tableElementBreakdown registerNib:customCellNib forCellReuseIdentifier:@"SubElementCell"];
    self.tableElementBreakdown.delegate = self;
    self.tableElementBreakdown.dataSource = self;
    self.labelElementDetails.text = [PAApplicationState instance].elements[self.elementPath][1];
    self.labelElementMeans.text = [NSString stringWithFormat:@"What %@ means:", elementName];
}

- (void)viewWillAppear:(BOOL)animated {
    // Reload data when coming back from modal child
    [self.tableElementBreakdown reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[PAApplicationState instance].elements[self.elementPath][2] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SubElementCell";

    // Basic set up of the cell
    NSArray *elementSubArray = [PAApplicationState instance].elements[self.elementPath][2][indexPath.row];
    NSLog(@"Creating cell for %@", elementSubArray[0]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [((UILabel *)[cell viewWithTag:1]) setText:elementSubArray[0]];
    [((UILabel *)[cell viewWithTag:2]) setText:elementSubArray[1]];

    NSLog(@"Score data for subelement: %@", self.goal.scores[self.elementPath][indexPath.row]);

    NSNumber *subelementScore = self.goal.scores[self.elementPath][indexPath.row][0];
    if ([subelementScore integerValue]>=0) {
        [((UILabel *)[cell viewWithTag:4]) setText:[NSString stringWithFormat:@"%.1f", [subelementScore floatValue]*10]];
        [((UILabel *)[cell viewWithTag:4]) setNumberOfLines:0];
        [((UILabel *)[cell viewWithTag:4]) setAdjustsFontSizeToFitWidth:TRUE];
        [((UILabel *)[cell viewWithTag:4]) setHidden:FALSE];
    }
    else
        [((UILabel *)[cell viewWithTag:4]) setHidden:TRUE];

    cell.clipsToBounds = YES;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    subelementToSend = [PAApplicationState instance].elements[self.elementPath][2][indexPath.row][0];
    subelementPathToSend = indexPath.row;
    [self performSegueWithIdentifier:@"segueToSubelement" sender:self];
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PASubElementViewController *destination = [segue destinationViewController];
    NSLog(@"prepareForSegue to %@", destination);

    // Pass in relevant data items (this could be done in a cleaner fashion)
//    destination.elementName = elementName;
//    destination.subelementName = subelementToSend;
    destination.elementPath = self.elementPath;
    destination.subelementPath = subelementPathToSend;
    destination.goal = self.goal;
}

@end
