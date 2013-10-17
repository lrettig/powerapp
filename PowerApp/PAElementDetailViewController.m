//
//  PAElementDetailViewController.m
//  PowerApp
//
//  Created by Lane Rettig on 10/17/13.
//  Copyright (c) 2013 Wharton. All rights reserved.
//

#import "PAElementDetailViewController.h"

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
    self.labelElementDetails.text = self.elementHeaderText;
    self.labelElementMeans.text = [NSString stringWithFormat:@"What %@ means:", self.elementName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
