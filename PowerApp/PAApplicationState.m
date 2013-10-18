//
//  DIVApplicationState.m
//  ChatteriApp
//
//  Created by Lane Rettig on 5/25/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PAApplicationState.h"
#import "PAGoal.h"

@implementation PAApplicationState

static PAApplicationState *instance;

+ (void)initialize
{
}

+(PAApplicationState *)instance {
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code

        // Is there a way to move this into a true constant?
        // I can't figure out how to declare a const array.
        // Or should it be moved into a plist?
        self.elements = @[
                           // Name     Short description
                          @[@"Agency", @"Agency is the ability to be in control of the situation.",
                            // Array of sub elements
                                 // Name of sub-element       // Description
                            @[@[@"Create new alternatives", @"Agency allows you to discover alternatives where none existed before!"],
                                 // Name of sub-element       // Description
                              @[@"Show initiative in taking on work", @"Be a man! Stand up and show that you care about what you're doing."],
                              @[@"Act before being asked to", @"Be a man! Stand up and show that you care about what you're doing."],
                              @[@"Consider how a situation can be improved", @"Be a man! Stand up and show that you care about what you're doing."],
                              @[@"Work beyond explicit job expectations", @"Be a man! Stand up and show that you care about what you're doing."],
                          ]],
                          @[@"Allocentrism", @"Allocentrism is the ability to be in control of the situation.",
                            @[@[@"Cultivate the support of others by involving them in the decision-making process", @"Caring about others is cool"],
                              @[@"Try to understand what issues are really motivating the other person", @"Some other detailed string goes here"],
                              @[@"Adapt own ideas by accepting suggestions from others", @"Some other detailed string goes here"],
                              @[@"Listen attentively when others talk", @"Some other detailed string goes here"],
                              @[@"Ask questions in order to better understand the other person", @"Some other detailed string goes here"],
                              @[@"Look for solutions that will benefit all parties involved", @"Some other detailed string goes here"],
                              ]],
                          @[@"Coalitions", @"Coalitions is the ability to be in control of the situation.",
                            @[@[@"Care about others", @"Caring about others is cool"],
                              @[@"Something else", @"Some other detailed string goes here"],
                              ]],
                          @[@"Ethos", @"Ethos is the ability to be in control of the situation.",
                            @[@[@"Care about others", @"Caring about others is cool"],
                              @[@"Something else", @"Some other detailed string goes here"],
                              ]],
                          @[@"Exchange", @"Exchange is the ability to be in control of the situation.",
                            @[@[@"Care about others", @"Caring about others is cool"],
                              @[@"Something else", @"Some other detailed string goes here"],
                              ]],
                          @[@"Intentionality", @"Intentionality is the ability to be in control of the situation.",
                            @[@[@"Care about others", @"Caring about others is cool"],
                              @[@"Something else", @"Some other detailed string goes here"],
                              ]],
                          @[@"Logos", @"Logos is the ability to be in control of the situation.",
                            @[@[@"Care about others", @"Caring about others is cool"],
                              @[@"Something else", @"Some other detailed string goes here"],
                              ]],
                          @[@"Might", @"Might is the ability to be in control of the situation.",
                            @[@[@"Care about others", @"Caring about others is cool"],
                              @[@"Something else", @"Some other detailed string goes here"],
                              ]],
                          @[@"Networks", @"Networks is the ability to be in control of the situation.",
                            @[@[@"Care about others", @"Caring about others is cool"],
                              @[@"Something else", @"Some other detailed string goes here"],
                              ]],
                          @[@"Pathos", @"Pathos is the ability to be in control of the situation.",
                            @[@[@"Care about others", @"Caring about others is cool"],
                              @[@"Something else", @"Some other detailed string goes here"],
                              ]],
                          @[@"Situational Awareness", @"SA is the ability to be in control of the situation.",
                            @[@[@"Care about others", @"Caring about others is cool"],
                              @[@"Something else", @"Some other detailed string goes here"],
                              ]],
                          @[@"Teambuilding", @"Teambuilding is the ability to be in control of the situation.",
                            @[@[@"Care about others", @"Caring about others is cool"],
                              @[@"Something else", @"Some other detailed string goes here"],
                              ]],
                          ];
    }
    return self;
}


// Prime the data model with a few example goals
// Note that this MUST be done apart from the init method above since the goal
// data model depends upon the elements array which is constructed above.
// So we initialize these separately, after the state instance has been
// instantiated.
-(void)primeGoals {
    PAGoal *goal1 = [PAGoal createWithName:@"Build an incredible company"];
    PAGoal *goal2 = [PAGoal createWithName:@"Be an incredible MBA student"];
    PAGoal *goal3 = [PAGoal createWithName:@"Help my sister be a better student"];
    self.goals = [NSMutableArray arrayWithObjects:goal1, goal2, goal3, nil];
}

//
// this code is called before tha appDelegate is called
//
+(void)load {
    instance = [[PAApplicationState alloc] init];
}


@end
