//
//  PAFirstViewController.h
//  PowerApp
//
//  Created by Lane Rettig on 10/16/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAFirstViewController : UIViewController {
    NSMutableArray *taskButtons;
    NSMutableArray *taskPaths;
}
@property (strong, nonatomic) IBOutlet UIView *viewTasks;

@end
