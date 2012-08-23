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
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 365)];
    [scrollView setScrollEnabled:YES];
    [scrollView setUserInteractionEnabled:YES];
    [scrollView setContentSize:CGSizeMake(320, 1230)];
    
    [self.view addSubview:scrollView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
    [title setText:[appDelegate.detailsItem objectAtIndex:0]];
    [title setBackgroundColor:[UIColor colorWithWhite:1 alpha:0]];
    [title setTextColor:[UIColor colorWithWhite:0.85 alpha:1]];
    [scrollView addSubview:title];
    
    UIImageView *itemImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 300, 300)];
    [itemImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [appDelegate.detailsItem objectAtIndex:4]]]];
    
    
    UITextView *firstTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 360, 320, 400)];
    [firstTextView setUserInteractionEnabled:NO];
    [firstTextView setText:[appDelegate.detailsItem objectAtIndex:5]];
    CGRect firstFrame;
    firstFrame = firstTextView.frame;
    [scrollView addSubview:firstTextView];
    firstFrame.size.height = [firstTextView contentSize].height;
    firstTextView.frame = firstFrame;
    
    UITextView *secondTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, (firstTextView.frame.size.height + firstTextView.frame.origin.y + 10), 320, 400)];
    [secondTextView setUserInteractionEnabled:NO];
    [secondTextView setText:[appDelegate.detailsItem objectAtIndex:5]];
    CGRect secondFrame;
    secondFrame = secondTextView.frame;
    [scrollView addSubview:secondTextView];
    secondFrame.size.height = [secondTextView contentSize].height;
    secondTextView.frame = secondFrame;
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, (310 + firstTextView.frame.size.height + secondTextView.frame.size.height + 65))];
    
    [firstTextView setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.6]];
    [secondTextView setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.6]];
    
    [scrollView addSubview:itemImage];
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
