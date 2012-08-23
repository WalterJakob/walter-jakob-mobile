//
//  TabBarViewController.h
//  WalterJakobMobile
//
//  Created by Jakob Hans Renpening on 22/8/12.
//  Copyright (c) 2012 WalterJakob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarViewController : UITabBarController
{
    IBOutlet UITabBar *customTabBar;
    UIView *animationBg;
    UIView *tutorialScreenHover;
}

@property UITabBar *customTabBar;
@property UIView *animationBg;
@property UIView *tutorialScreenHover;

@end
