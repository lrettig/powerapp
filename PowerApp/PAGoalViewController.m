//
//  PAGoalViewController.m
//  PowerApp
//
//  Created by Lane Rettig on 10/16/13.
//  Copyright (c) 2013 Wharton. All rights reserved.
//

#import "PAGoalViewController.h"
#import "PAElementDetailViewController.h"

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
    
    elements = @[ @"Agency",
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
    int x_start = 0;
    int y_start = 0;
    int bottom_margin = 0;
    int x_spacing = 5;
    int y_spacing = 5;
    int btn_height = (self.elementsView.frame.size.height - y_start - bottom_margin - (y_spacing*(num_rows-1)))/num_rows;
    int btn_width = (self.elementsView.frame.size.width - (x_start*2) - (x_spacing*(num_cols-1)))/num_cols;
    int bottom_btn_width = self.elementsView.frame.size.width - x_start*2;
    
    // Add buttons for each element
    int i = 0;
    NSMutableArray *elementButtonsTemp;
    for (; i<[elements count]; i++) {
        UIButton *button = [self makeElementButton:elements[i] width:btn_width height:btn_height];
        
        // These tags will correspond to the button position in the elementsButtons array.
        button.tag = i;
        [button addTarget:self action:@selector(elementButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        int row = floor(i/num_cols);
        int col = i % num_cols;
        NSLog(@"Adding button for element %d: %@ at row %d col %d", i, elements[i], row, col);
        [button setFrame:CGRectMake(x_start+col*(x_spacing+btn_width),
                                    y_start+row*(y_spacing+btn_height),
                                    btn_width,
                                    btn_height)];
        [self.elementsView addSubview:button];
        [elementButtonsTemp addObject:button];
    }
    
    // Finally, add a "random" button
    int row = floor(i/num_cols);
    int col = i % num_cols;
    UIButton *randomButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    randomButton.tag = i;
    [randomButton setTitle:@"Random" forState:UIControlStateNormal];
    [randomButton.titleLabel setFont:[UIFont systemFontOfSize:30]];
    [randomButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [[randomButton layer] setBorderWidth:1.0f];
    [[randomButton layer] setBorderColor:[UIColor blueColor].CGColor];
    [randomButton setFrame:CGRectMake(x_start+col*(x_spacing+btn_width),
                                      y_start+row*(y_spacing+btn_height),
                                      bottom_btn_width,
                                      btn_height)];
    [self.elementsView addSubview:randomButton];
    [elementButtonsTemp addObject:randomButton];
    
    // Save the list of buttons
    elementButtons = elementButtonsTemp;
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

-(void)elementButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"segueToElementDetail" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PAElementDetailViewController *destination = [segue destinationViewController];
    NSLog(@"prepareForSegue to %@", destination);
    
    // Retrieve the corresponding element
    int tag = ((UIButton*)sender).tag;
    NSString *element = elements[tag];
    NSLog(@"Got element %@ for button id %d", element, tag);
    
    // Pass in relevant data items (this could be done in a cleaner fashion)
    destination.elementName = element;
    destination.elementHeaderText = @"Some cool text here";
    destination.elementSubElements = @[@"Leading others", @"Dancing all night", @"Finding new possibilities", @"Singing in the rain"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
