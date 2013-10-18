//
//  PATask.h
//  PowerApp
//
//  Created by Lane Rettig on 10/17/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAGoal : NSObject

@property NSString *name;
@property NSMutableArray *score;

+(PAGoal *) createWithName:(NSString *)name;

@end
