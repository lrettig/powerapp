//
//  PASubElementViewController.h
//  PowerApp
//
//  Created by Lane Rettig on 10/18/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PAElementDetailViewController.h"
#import "PAGoal.h"

@interface PASubElementViewController : UIViewController<UITextViewDelegate> {
    NSString *elementName;
    NSString *subelementName;
}

//@property (strong, nonatomic) NSString *subelementName;
//@property (strong, nonatomic) NSString *elementName;
@property (strong, nonatomic) IBOutlet UISlider *sliderScore;
@property int elementPath;
@property int subelementPath;
@property (strong, nonatomic) IBOutlet UILabel *labelHeader;
@property (strong, nonatomic) IBOutlet UITextView *textviewNotes;
@property (strong, nonatomic) PAGoal *goal;
//@property (strong, nonatomic) PAElementDetailViewController *parentVC;

@end
