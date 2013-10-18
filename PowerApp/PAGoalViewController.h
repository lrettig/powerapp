//
//  PAGoalViewController.h
//  PowerApp
//
//  Created by Lane Rettig on 10/16/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAGoal.h"

@interface PAGoalViewController : UIViewController {
    NSArray *elements;
    NSArray *elementButtons;
}
@property (strong, nonatomic) IBOutlet UIView *elementsView;
@property (strong, nonatomic) IBOutlet UILabel *labelGoalName;
@property (strong, nonatomic) IBOutlet UIButton *btnGoalStatus;
@property (strong, nonatomic) PAGoal *goal;

@end
