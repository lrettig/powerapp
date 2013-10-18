//
//  PAGoalStatusViewController.m
//  PowerApp
//
//  Created by Lane Rettig on 10/18/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PAGoalStatusViewController.h"

@interface PATriangle : UIView

@end

@implementation PATriangle

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // white background
    CGContextSetRGBFillColor(ctx, 1, 1, 1, 1);
    CGContextFillRect(ctx, self.bounds);
    
    // draw the triangle
    CGContextBeginPath(ctx);
    CGContextMoveToPoint   (ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));  // bottom left
    CGContextAddLineToPoint(ctx, CGRectGetMidX(rect), CGRectGetMinY(rect));  // top mid
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMaxY(rect));  // bottom right
    CGContextClosePath(ctx);
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 0.7);
    CGContextFillPath(ctx);
}

@end

@interface PAGoalStatusViewController ()

@end

@implementation PAGoalStatusViewController

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
    
    // Draw the rectangle
    PATriangle *tri = [[PATriangle alloc] initWithFrame:CGRectMake(0, 20, self.viewDrawTriangle.frame.size.width, self.viewDrawTriangle.frame.size.height-40)];
    [self.viewDrawTriangle addSubview:tri];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
