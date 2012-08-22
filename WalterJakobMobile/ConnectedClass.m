//
//  ConnectedClass.m
//  geoJoy
//
//  Created by Jakob Hans Renpening on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ConnectedClass.h"

@implementation ConnectedClass

-(BOOL)connected
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    if (reach.isReachable) {
        return YES;
    } else {
        return NO;
    }
}

@end
