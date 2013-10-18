//
//  PASubElementViewController.h
//  PowerApp
//
//  Created by Lane Rettig on 10/18/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PASubElementViewController : UIViewController

@property (strong, nonatomic) NSString *subelementName;
@property (strong, nonatomic) NSString *elementName;
@property (strong, nonatomic) IBOutlet UILabel *labelHeader;
@property (strong, nonatomic) IBOutlet UITextView *textviewNotes;

@end
