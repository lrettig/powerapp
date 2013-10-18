//
//  PAElementDetailViewController.h
//  PowerApp
//
//  Created by Lane Rettig on 10/17/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAElementDetailViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *labelElementDetails;
@property (strong, nonatomic) IBOutlet UILabel *labelElementMeans;
@property (strong, nonatomic) IBOutlet UITableView *tableElementBreakdown;
@property (strong, nonatomic) NSString *elementHeaderText;
@property (strong, nonatomic) NSString *elementName;
@property (strong, nonatomic) NSArray *elementSubElements;

@end
