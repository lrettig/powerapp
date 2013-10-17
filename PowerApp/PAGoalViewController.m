//
//  PAGoalViewController.m
//  PowerApp
//
//  Created by Lane Rettig on 10/16/13.
//  Copyright (c) 2013 Wharton. All rights reserved.
//

#import "PAGoalViewController.h"

@interface PAGoalViewController ()

@end

@implementation PAGoalViewController

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
    
    // Create element buttons
//    NSArray *elements = @[@"Ag", @"Al", @"Co"];
    NSArray *elements = @[ @"Agency",
                           @"Allocentrism",
                           @"Coalitions",
                           @"Ethos",
                           @"Exchange",
                           @"Intentionality",
                           @"Logos",
                           @"Might",
                           @"Networks",
                           @"Pathos",
                           @"Situational Awareness",
                           @"Teambuilding",
                           ];
    
    int num_rows = 5;
    int num_cols = 3;
    int x_start = 20;
    int y_start = 200;
    int bottom_margin = 20;
    int x_spacing = 5;
    int y_spacing = 5;
    int btn_height = (self.view.frame.size.height - y_start - bottom_margin - (y_spacing*(num_rows-1)))/num_rows;
    int btn_width = (self.view.frame.size.width - (x_start*2) - (x_spacing*(num_cols-1)))/num_cols;
    int bottom_btn_width = self.view.frame.size.width - x_start*2;
    
    // Add buttons for each element
    int i = 0;
    for (; i<[elements count]; i++) {
        UIButton *button = [self makeElementButton:elements[i] width:btn_width height:btn_height];
        int row = floor(i/num_cols);
        int col = i % num_cols;
        NSLog(@"Adding button for element %d: %@ at row %d col %d", i, elements[i], row, col);
        [button setFrame:CGRectMake(x_start+col*(x_spacing+btn_width),
                                    y_start+row*(y_spacing+btn_height),
                                    btn_width,
                                    btn_height)];
        [self.view addSubview:button];
    }
    
    // Finally, add a "random" button
    int row = floor(i/num_cols);
    int col = i % num_cols;
    UIButton *randomButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [randomButton setTitle:@"Random" forState:UIControlStateNormal];
    [randomButton.titleLabel setFont:[UIFont systemFontOfSize:30]];
    [randomButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [[randomButton layer] setBorderWidth:1.0f];
    [[randomButton layer] setBorderColor:[UIColor blueColor].CGColor];
    [randomButton setFrame:CGRectMake(x_start+col*(x_spacing+btn_width),
                                      y_start+row*(y_spacing+btn_height),
                                      bottom_btn_width,
                                      btn_height)];
    [self.view addSubview:randomButton];
}

- (UIButton*)makeElementButton:(NSString *)title width:(int)btn_width height:(int)btn_height {
    NSString *titleText = [title substringToIndex:2];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:titleText forState:UIControlStateNormal];
//    [button setBackgroundColor:[UIColor redColor]];
    [button.titleLabel setFont:[UIFont systemFontOfSize:30]];
    [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [[button layer] setBorderWidth:1.0f];
    [[button layer] setBorderColor:[UIColor blueColor].CGColor];

    UILabel *subtitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, btn_height-17, btn_width, 12)];
    [subtitleLabel setBackgroundColor:[UIColor clearColor]];
    [subtitleLabel setFont:[UIFont systemFontOfSize:12]];
    subtitleLabel.text = title;
    [subtitleLabel setTextColor:[UIColor blackColor]];
    [subtitleLabel setTextAlignment:NSTextAlignmentCenter];
    [subtitleLabel setNumberOfLines:0];
    [subtitleLabel setAdjustsFontSizeToFitWidth:TRUE];
    [button addSubview:subtitleLabel];
//    [self.buttonAg addSubview:subtitleLabel];
    
    return button;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didPressBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
