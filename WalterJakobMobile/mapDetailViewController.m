//
//  mapDetailViewController.m
//  WalterJakobMobile
//
//  Created by Jakob Hans Renpening on 23/8/12.
//  Copyright (c) 2012 WalterJakob. All rights reserved.
//

#import "mapDetailViewController.h"

@interface mapDetailViewController ()

@end

@implementation mapDetailViewController

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
    
    AppDelegate* appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    
    NSLog(@"%@", [appDelegate.detailsItem objectAtIndex:0]);
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
