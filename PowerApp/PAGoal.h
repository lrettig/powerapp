//
//  PATask.h
//  PowerApp
//
//  Created by Lane Rettig on 10/17/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAGoal : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *scores;

+(PAGoal *) createWithName:(NSString *)name;
-(NSString *) statusText;
-(BOOL) finishedScoringElement:(int)elementNo;
-(NSArray *) getRandomTask;

@end
