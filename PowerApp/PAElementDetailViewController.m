//
//  PAElementDetailViewController.m
//  PowerApp
//
//  Created by Lane Rettig on 10/17/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PAElementDetailViewController.h"
#import "PASubElementViewController.h"

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
    
    UINib *customCellNib = [UINib nibWithNibName:@"SubElementCell" bundle:nil];
    [self.tableElementBreakdown registerNib:customCellNib forCellReuseIdentifier:@"SubElementCell"];
    self.tableElementBreakdown.delegate = self;
    self.tableElementBreakdown.dataSource = self;
    self.labelElementDetails.text = self.elementHeaderText;
    self.labelElementMeans.text = [NSString stringWithFormat:@"What %@ means:", self.elementName];
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
    return [self.elementSubElements count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SubElementCell";

    // Basic set up of the cell
    NSArray *elementSubArray = self.elementSubElements[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [((UILabel *)[cell viewWithTag:1]) setText:elementSubArray[0]];
    [((UILabel *)[cell viewWithTag:2]) setText:elementSubArray[1]];
    
    cell.clipsToBounds = YES;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    subelementToSend = self.elementSubElements[indexPath.row];
    [self performSegueWithIdentifier:@"segueToSubelement" sender:self];
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PASubElementViewController *destination = [segue destinationViewController];
    NSLog(@"prepareForSegue to %@", destination);

    // Pass in relevant data items (this could be done in a cleaner fashion)
    destination.elementName = self.elementName;
    destination.subelementName = subelementToSend;
}

@end
