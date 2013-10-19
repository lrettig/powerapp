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
    NSMutableArray *scoresArray = [NSMutableArray array];
    
    // Iterate through the elements and subelements to initialize the array
    for (NSArray *element in [PAApplicationState instance].elements) {
        NSArray *subElements = element[2];
        NSMutableArray *scoreRow = [NSMutableArray arrayWithCapacity:[subElements count]];
        
        // Is there an easier way to do this in Obj C?
        for (int i=0; i<[subElements count];i++)
            // For each subelement we store a pair, consisting of
            // score (float) and comment (text).
            scoreRow[i] = @[
                            [NSNumber numberWithFloat:-1.0],
                            @""];

        [scoresArray addObject:scoreRow];
    }
    NSLog(@"Initialize new PAGoal object with scores: %@", scoresArray);
    goal.scores = scoresArray;

    return goal;
}

-(NSString *) statusText {
    if (![self finishedScoring])
        return @"Finish entering scores.";

    // Should probably hardcode max and min scores somewhere
    // We use 0.0-1.0 for each element
    float totalScore = [self sumAllScores];
    if (totalScore < 3.33)
        return @"Needs some love!";
    if (totalScore < 6.66)
        return @"Getting there!";
    return @"Looking good!";
}

-(BOOL) finishedScoring {
    for (int i=0; i<[self.scores count]; i++)
        if (![self finishedScoringElement:i])
            return FALSE;
    return TRUE;
}

-(BOOL) finishedScoringElement:(int)elementNo {
    for (NSArray *scorePair in self.scores[elementNo])
        if ([scorePair[0] integerValue]<0)
            return FALSE;
    return TRUE;
}

// Return the average score for this element's subelements,
// nil if not all scores entered.
-(float) averageForElement:(int)elementNo {
    if (![self finishedScoringElement:elementNo])
        return -1;
    float sum = 0;
    int numElements = [self.scores[elementNo] count];
    for (NSArray *scorePair in self.scores[elementNo]) {
        NSNumber *score = scorePair[0];
        NSAssert(score>=0, @"Score unset");
        sum += [score floatValue];
    }
    NSAssert(numElements>0, @"No elements");
    return sum/numElements;
}

-(float) sumAllScores {
    float sum = 0;
    for (int i=0; i<[self.scores count]; i++)
        sum += [self averageForElement:i];
    return sum;
}

// Return a random task for this goal.
-(NSArray *) getRandomTask {
    // Start by looking for unset scores.
    int i = arc4random() % [self.scores count];
    while (i<[self.scores count]) {
        int j = i % [self.scores count];
        if (![self finishedScoringElement:j]) {
            NSString *elemName = [PAApplicationState instance].elements[j][0];
            NSString *taskDescription = [NSString stringWithFormat:@"Enter score for %@ for %@",
                                         elemName,
                                         self.name];
            return @[taskDescription, [NSNumber numberWithInt:j]];
        }
        i++;
    }

    // If all scores are set, find a low score.
    i = arc4random() % [self.scores count];
    while (i<[self.scores count]) {
        int j = i % [self.scores count];
        if ([self averageForElement:j]<0.33) {
            NSString *elemName = [PAApplicationState instance].elements[j][0];
            NSString *taskDescription = [NSString stringWithFormat:@"%@ for %@",
                                         elemName,
                                         self.name];
            return @[taskDescription, [NSNumber numberWithInt:j]];
        }
        i++;
    }
    
    // Nothing to do for this task!
    return @[[NSString stringWithFormat:@"%@ looks good, nothing to do!", self.name], [NSNumber numberWithInt:-1]];
}

@end
