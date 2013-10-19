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
                          @[@"Agency", @"Janette Sadik-Kahn. Don't accept circumstances as given.",
                            // Array of sub elements
                                 // Name of sub-element       // Description
                            @[@[@"Create alternatives", @"Create new alternatives."],
                                 // Name of sub-element       // Description
                              @[@"Show initiative", @"Show initiative in taking on work."],
                              @[@"Act early", @"Act before being asked to."],
                              @[@"Improve things", @"Consider how a situation can be improved."],
                              @[@"Be diligent", @"Work beyond explicit job expectations."],
                          ]],
                          @[@"Allocentrism", @"Robert Moses. Keep others' interests in mind.",
                            @[@[@"Involve others", @"Cultivate the support of others by involving them in the decision-making process."],
                              @[@"Understand others", @"Try to understand what issues are really motivating the other person."],
                              @[@"Be adaptable", @"Adapt own ideas by accepting suggestions from others."],
                              @[@"Listen well", @"Listen attentively when others talk."],
                              @[@"Ask questions", @"Ask questions in order to better understand the other person."],
                              @[@"Look for solutions", @"Look for solutions that will benefit all parties involved."],
                              ]],
                          @[@"Coalitions", @"Union Square. Work with and through others to accomplish your goals.",
                            @[@[@"Gather support", @"Gather support from different parts of the organization."],
                              @[@"Address tensions", @"Work to address potential tensions with key people prior to the decision point."],
                              @[@"Demonstrate support", @"Find ways to communicate who else is supporting your approach."],
                              @[@"Enlist others.", @"Enlist the support of individuals, one by one, in order to build support for an idea."],
                              @[@"Find influencers.", @"Seek to understand which people are likely to influence a decision."],
                              @[@"Work through coalitions.", @"Identify existing coalitions and work through them."],
                              ]],
                          @[@"Ethos", @"Convey credentials to garner respect and support.",
                            @[@[@"Be confident.", @"Present ideas with confidence."],
                              @[@"Convey credentials", @"Find ways to convey your credentials and expertise."],
                              @[@"Make efforts known", @"Make your efforts and accomplishments known."],
                              @[@"Communicate background", @"Communicate how your background is relevant to the topic at hand."],
                              ]],
                          @[@"Exchange", @"Give and take. Offer rewards and concessions and be willing to compromise.",
                            @[@[@"Offer rewards", @"Offer rewards to people for compliance."],
                              @[@"Make concessions", @"Find ways to make concessions in order to encourage others to do the same."],
                              @[@"Obtain support", @"Think of rewards to offer others to obtain their support."],
                              @[@"Compromise", @"Support mutual compromise when facing strong resistance."],
                              @[@"Do things for others", @"Offer to do things for others in return for their support."],
                              @[@"Golden rule", @"Understand the need to help others in order to get help from them."],
                              ]],
                          @[@"Intentionality", @"Sergio Vieira de Mello. Be fixed on goals but flexible on method.",
                            @[@[@"Time and resources", @"Be intentional in the way you allocate time and resources."],
                              @[@"Trade minor for major", @"Be willing to trade minor goals to achieve major goals."],
                              @[@"Understand the steps", @"Be careful to understand the steps necessary to achieve goals."],
                              @[@"Specific purpose", @"Work with a specific purpose in mind."],
                              @[@"Stay on track", @"Stay on track despite potential distractions."],
                              @[@"Be resilient", @"Be resilient in the pursuit of goals."],
                              ]],
                          @[@"Logos", @"MBA style. Use logic to support your position.",
                            @[@[@"Make points simply", @"Find ways to make points as simply as possible."],
                              @[@"Use reason", @"Use arguments that are well reasoned."],
                              @[@"Rely on facts", @"Rely on facts and data to convince others."],
                              @[@"Gather data", @"Gather data to support your position."],
                              @[@"Appeal to logic", @"Appeal to logic to convince others of ideas."],
                              ]],
                          @[@"Might", @"Do not be afraid of conflict. Stand up for yourself.",
                            @[@[@"Tolerate conflict.", @"Be able to tolerate conflict."],
                              @[@"Be vocal", @"Let people know when they perform below expectations."],
                              @[@"Be confrontational", @"Be willing to confront difficult people-related issues."],
                              @[@"Stand up", @"Stand up for your opinion."],
                              @[@"Use authority", @"Be willing to use the authority of your position to get others to do what you want."],
                              @[@"Enforce consequences", @"Be comfortable enforcing negative consequences when appropriate."],
                              ]],
                          @[@"Networks", @"Heidi Roizen. Cultivate relationships before they're needed.",
                            @[@[@"Cultivate relationships", @"Cultivate relationships before they are needed for a particular purpose."],
                              @[@"Multiple levels", @"Maintain professional contacts at multiple levels in the organization."],
                              @[@"Former organizations", @"Maintain relationships with those in organizations you are no longer part of."],
                              @[@"Disparate groups", @"Maintain relationships that span disparate groups."],
                              @[@"Be proactive", @"Actively seek new people to incorporate into your professional network."],
                              @[@"Make friends", @"Make an effort to become friends with colleagues at work."],
                              ]],
                          @[@"Pathos", @"Tell stories and tailor your rhetoric to the audience.",
                            @[@[@"Tailor content and style", @"Tailor communication content and style to the specific audience."],
                              @[@"Concrete examples", @"Find and use concrete examples in order to present your case."],
                              @[@"Arouse emotion", @"Find ways of communicating that arouse emotion."],
                              @[@"Be interesting", @"Find interesting ways to present information or ideas."],
                              @[@"Use stories", @"Use stories to help make your points."],
                              @[@"Think about how", @"When presenting ideas to others, think about how to say things, not just what to say."],
                              ]],
                          @[@"Situational Awareness", @"JFK. Pick your spots. Work to understand the situation from multiple perspectives.",
                            @[@[@"Be sensitive", @"Be sensitive to how situations vary in their importance."],
                              @[@"Recognize change", @"Recognize when circumstances change."],
                              @[@"See opportunities", @"See opportunities that others miss."],
                              @[@"Recognize uncertainty", @"Recognize when uncertainty is high."],
                              @[@"Multiple perspectives", @"Analyze situations from multiple perspectives."],
                              @[@"Be broad", @"Maintain a broad perspective, considering many factors and constituencies."],
                              ]],
                          @[@"Teambuilding", @"Build and support strong teams. You can achieve more together.",
                            @[@[@"Group cohesion", @"Prioritize group cohesion."],
                              @[@"Build excitement", @"Build excitement around the essence of the group."],
                              @[@"Appeal to values", @"Make appeals to values or principles shared by those in your group."],
                              @[@"Connect others", @"Work to connect those who seem distant or separate to the group."],
                              @[@"Inspirational vision", @"Help articulate an inspirational vision for the group."],
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
    PAGoal *goal1 = [PAGoal createWithName:@"Start an influential nonprofit"];
    PAGoal *goal2 = [PAGoal createWithName:@"Be an outstanding MBA student"];
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
