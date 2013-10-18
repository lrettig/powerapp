//
//  PATask.m
//  PowerApp
//
//  Created by Lane Rettig on 10/17/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PAGoal.h"
#import "PAApplicationState.h"

@implementation PAGoal

+(PAGoal *) createWithName:(NSString *)name {
    PAGoal *goal = [[PAGoal alloc] init];
    goal.name = name;
    
    // Initialize the scores
    NSMutableArray *scores = [NSMutableArray array];
    
    // Iterate through the elements and subelements to initialize the array
    for (NSArray *element in [PAApplicationState instance].elements) {
        NSArray *subElements = element[2];
        NSMutableArray *scoreRow = [NSMutableArray arrayWithCapacity:[subElements count]];
        
        // Is there an easier way to do this in Obj C?
        for (int i=0; i<[scoreRow count];i++)
            scoreRow[i] = [NSNumber numberWithFloat:-1.0];
        
        [scores addObject:scoreRow];
    }
    NSLog(@"Initialize new PAGoal object with scores: %@", scores);
    
    return goal;
}

-(NSString *) statusText {
    return @"Looking good!";
}

@end
