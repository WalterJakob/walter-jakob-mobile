//
//  TabBarViewController.m
//  WalterJakobMobile
//
//  Created by Jakob Hans Renpening on 22/8/12.
//  Copyright (c) 2012 WalterJakob. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

@synthesize customTabBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bar_bg.png"]];
    
    UITabBarItem *item_0 = [[self->customTabBar items] objectAtIndex:0];
    [item_0 setTitle:@"Map"];
    [item_0 setFinishedSelectedImage:[UIImage imageNamed:@"tab_icon_0_hl.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab_icon_0.png"]];
    [item_0 setImageInsets:UIEdgeInsetsMake(7, 0, -7, 0)];
    UITabBarItem *item_1 = [[self->customTabBar items] objectAtIndex:1];
    [item_1 setTitle:@"Community"];
    [item_1 setFinishedSelectedImage:[UIImage imageNamed:@"tab_icon_1_hl.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab_icon_1.png"]];
    [item_1 setImageInsets:UIEdgeInsetsMake(7, 0, -7, 0)];
    UITabBarItem *item_2 = [[self->customTabBar items] objectAtIndex:2];
    [item_2 setTitle:@"About"];
    [item_2 setFinishedSelectedImage:[UIImage imageNamed:@"tab_icon_2_hl.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab_icon_2.png"]];
    [item_2 setImageInsets:UIEdgeInsetsMake(7, 0, -7, 0)];
    
    UIImageView *statusBarShadow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 320, 10)];
    [statusBarShadow setImage:[UIImage imageNamed:@"top_shadow.png"]];
    
    [self.view addSubview:statusBarShadow];
    
    animationBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [animationBg setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
    
    [self.view addSubview:animationBg];
    
    UIImageView *cloud_2 = [[UIImageView alloc] initWithFrame:CGRectMake(-30, 290, 320, 207)];
    [cloud_2 setImage:[UIImage imageNamed:@"cloud_2.png"]];
    [animationBg addSubview:cloud_2];
    
    UIImageView *cloud_1 = [[UIImageView alloc] initWithFrame:CGRectMake(65, 150, 270, 262)];
    [cloud_1 setImage:[UIImage imageNamed:@"cloud_1.png"]];
    [animationBg addSubview:cloud_1];
    
    UIImageView *cloud_3 = [[UIImageView alloc] initWithFrame:CGRectMake(-20, -10, 310, 244)];
    [cloud_3 setImage:[UIImage imageNamed:@"cloud_3.png"]];
    [animationBg addSubview:cloud_3];
    
    
    
    UIImageView *splashScreen = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [splashScreen setImage:[UIImage imageNamed:@"splash.png"]];
    [animationBg addSubview:splashScreen];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [splashScreen setAlpha:0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3];
    [cloud_1 setFrame:CGRectMake(320, cloud_1.frame.origin.y, cloud_1.frame.size.width, cloud_1.frame.size.height)];
    [cloud_2 setFrame:CGRectMake(-320, cloud_2.frame.origin.y, cloud_2.frame.size.width, cloud_2.frame.size.height)];
    [cloud_3 setFrame:CGRectMake(-310, cloud_3.frame.origin.y, cloud_3.frame.size.width, cloud_3.frame.size.height)];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:1];
    [animationBg setAlpha:0];
    [UIView commitAnimations];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
