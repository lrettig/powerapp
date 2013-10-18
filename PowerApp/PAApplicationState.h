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
//@property BOOL loggedIn;
//@property (strong) DIVUser *currentUser;
//@property (strong) DIVServerInfo *serverInfo;
//@property (strong) NSArray *myPatients;
//@property (strong) NSArray *locations;
//@property (copy) NSString *masterEndpoint;
//@property (copy) NSString *instanceName;
//@property (strong) Reachability *reachability;
//@property (assign) DIVConnectivityStatus connectivityStatus;
//@property (assign) DIVConnectivityStatus haveShownNoNetworkConnectionForTables;
//@property (assign) DIVIntegrationMode integrationMode;

+(PAApplicationState *)instance;

@end
