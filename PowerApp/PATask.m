//
//  PATask.m
//  PowerApp
//
//  Created by Lane Rettig on 10/17/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PATask.h"

@implementation PATask

+(PATask *) createWithName:(NSString *)name {
    PATask *task = [[PATask alloc] init];
    task.name = name;
    
    // Initialize the scores
    
    
    return task;
}

@end
