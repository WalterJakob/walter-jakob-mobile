//
//  AppDelegate.h
//  WalterJakobMobile
//
//  Created by Jakob Hans Renpening on 22/8/12.
//  Copyright (c) 2012 WalterJakob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSMutableArray *detailsItem;
    NSMutableArray *mapPoints;
}

@property (strong, nonatomic) UIWindow *window;
@property NSMutableArray *detailsItem;
@property NSMutableArray *mapPoints;

@end
