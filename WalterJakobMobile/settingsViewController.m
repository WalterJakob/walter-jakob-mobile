//
//  settingsViewController.m
//  WalterJakobMobile
//
//  Created by Jakob Hans Renpening on 22/8/12.
//  Copyright (c) 2012 WalterJakob. All rights reserved.
//

#import "settingsViewController.h"

@interface settingsViewController ()

@end

@implementation settingsViewController

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
    
    [self.navigationController.navigationBar.topItem setTitle:@"About"];
    
    UIImageView *appLogo = [[UIImageView alloc] initWithFrame:CGRectMake(35, 10, 250, 72)];
    [appLogo setImage: [UIImage imageNamed:@"app_name.png"]];
    [self.view addSubview:appLogo];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, 300, 100)];
    [textView setText:@"livingCity is an effort to bring the common citizen information about what is happening in the city that surrounds her/him. Besides showing ongoing building and renovation projects it helps the citizens express in a more direct and democratic way the things that need to be fixed."];
    [self.view addSubview:textView];
    
    UITextView *secondTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 210, 300, 110)];
    [secondTextView setText:@"livingCity is an open source project freely available in Github at (https://github.com/WalterJakob/walter-jakob-mobile). All the images where taken from the internet and its only purpose was to illustrate the concept of the application. If any harm has been made we will take them out of the app as soon as we receive a notice. Thank you."];
    [self.view addSubview:secondTextView];
    
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
