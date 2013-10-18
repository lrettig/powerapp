//
//  DIVApplicationState.h
//  ChatteriApp
//
//  Created by Lane Rettig on 5/25/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAApplicationState : NSObject

@property (strong) NSArray *elements;
@property (strong) NSMutableArray *goals;

+(PAApplicationState *)instance;
-(void)primeGoals;

@end
