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
    
    UITabBarItem *item_0 = [[self->customTabBar items] objectAtIndex:0];
    [item_0 setTitle:@"Map"];
    UITabBarItem *item_1 = [[self->customTabBar items] objectAtIndex:1];
    [item_1 setTitle:@"List"];
    UITabBarItem *item_2 = [[self->customTabBar items] objectAtIndex:2];
    [item_2 setTitle:@"Settings"];
    
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
