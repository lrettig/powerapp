//
//  PATask.m
//  PowerApp
//
//  Created by Lane Rettig on 10/17/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PAGoal.h"

@implementation PAGoal

+(PAGoal *) createWithName:(NSString *)name {
    PAGoal *goal = [[PAGoal alloc] init];
    goal.name = name;
    
    // Initialize the scores
    
    
    return goal;
}

@end
