//
//  DIVApplicationState.m
//  ChatteriApp
//
//  Created by Lane Rettig on 5/25/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PAApplicationState.h"

@implementation PAApplicationState

static PAApplicationState *instance;

+ (void)initialize
{
}

+(PAApplicationState *)instance{
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
                              @[@"Show initiative", @"Be a man! Stand up and show that you care about what you're doing."],
                              ]],
                          @[@"Allocentrism", @"Allocentrism is the ability to be in control of the situation.",
                            @[@[@"Care about others", @"Caring about others is cool"],
                              @[@"Something else", @"Some other detailed string goes here"],
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

//
// this code is called before tha appDelegate is called
//
+(void)load{
    instance = [[PAApplicationState alloc] init];
}


@end
