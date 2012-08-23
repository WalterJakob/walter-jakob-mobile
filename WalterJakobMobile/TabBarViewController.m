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
    [item_2 setTitle:@"Settings"];
    [item_2 setFinishedSelectedImage:[UIImage imageNamed:@"tab_icon_2_hl.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab_icon_2.png"]];
    [item_2 setImageInsets:UIEdgeInsetsMake(7, 0, -7, 0)];
    
    UIImageView *statusBarShadow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 320, 10)];
    [statusBarShadow setImage:[UIImage imageNamed:@"top_shadow.png"]];
    
    [self.view addSubview:statusBarShadow];
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
