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
@synthesize tutorialScreenHover;

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
    
    tutorialScreenHover = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2880, 480)];
    [tutorialScreenHover setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.8]];
    [tutorialScreenHover setAlpha:0];
    [self.view addSubview:tutorialScreenHover];
    
    UITextView *firstMessage = [[UITextView alloc] initWithFrame:CGRectMake(10, 30, 300, 440)];
    [firstMessage setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
    [firstMessage setTextColor:[UIColor colorWithWhite:1 alpha:1]];
    [firstMessage setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];
    [firstMessage setContentInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    [firstMessage setText:@"Welcome to livingCity. Since this is a prototype that will be used in a Simulator we have taken the following liberties to make the experience with the app as real as possible: One. We have disabled the automatic map pan to the current location of the user since usually the Simulator sets this values in the USA and not in Europe. Two. The first-time tutorial will be activated every time the application is compiled. That is it. We hope you enjoy the experience."];
    [tutorialScreenHover addSubview:firstMessage];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:2];
    [tutorialScreenHover setAlpha:1];
    [UIView commitAnimations];
    
    UIButton *removeFirstMessageBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [removeFirstMessageBtn addTarget:nil action:@selector(removeFirstMessage) forControlEvents:UIControlEventTouchUpInside];
    [tutorialScreenHover addSubview:removeFirstMessageBtn];
    
}

-(void)removeFirstMessage
{
    UIImageView *secondMessageImage = [[UIImageView alloc] initWithFrame:CGRectMake(340, 20, 150, 225)];
    [secondMessageImage setImage:[UIImage imageNamed:@"0.png"]];
    [tutorialScreenHover addSubview:secondMessageImage];
    
    UITextView *secondMessageText = [[UITextView alloc] initWithFrame:CGRectMake(340, 265, 280, 200)];
    [secondMessageText setText:@"The first screen is the map where you see all the ongoing or just finished projects of renovation in the city. Along with that you will get to see the location for some of the citizens suggestions and complaints. This can be filtered from the controls behind the map. Also, every mark directs to a detailed view of the item and an image. All this is seen in the next images"];
    [secondMessageText setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
    [secondMessageText setTextColor:[UIColor colorWithWhite:1 alpha:1]];
    [tutorialScreenHover addSubview:secondMessageText];
    
    UIButton *removeSecondMessage = [[UIButton alloc] initWithFrame:CGRectMake(320, 0, 320, 480)];
    [removeSecondMessage addTarget:nil action:@selector(removeSecondMessage) forControlEvents:UIControlEventTouchUpInside];
    [tutorialScreenHover addSubview:removeSecondMessage];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [tutorialScreenHover setFrame:CGRectMake(-320, tutorialScreenHover.frame.origin.y, tutorialScreenHover.frame.size.width, tutorialScreenHover.frame.size.height)];
    [UIView commitAnimations];
}

-(void)removeSecondMessage
{
    
    UIImageView *thirdMessageImage = [[UIImageView alloc] initWithFrame:CGRectMake(700, 45, 200, 300)];
    [thirdMessageImage setImage:[UIImage imageNamed:@"1.png"]];
    [tutorialScreenHover addSubview:thirdMessageImage];
    
    UIButton *removeThirdMessage = [[UIButton alloc] initWithFrame:CGRectMake(640, 0, 320, 480)];
    [removeThirdMessage addTarget:nil action:@selector(removeThirdMessage) forControlEvents:UIControlEventTouchUpInside];
    [tutorialScreenHover addSubview:removeThirdMessage];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [tutorialScreenHover setFrame:CGRectMake(-640, tutorialScreenHover.frame.origin.y, tutorialScreenHover.frame.size.width, tutorialScreenHover.frame.size.height)];
    [UIView commitAnimations];
}

-(void)removeThirdMessage
{
    UIImageView *fourthMessageImage = [[UIImageView alloc] initWithFrame:CGRectMake(1020, 45, 200, 300)];
    [fourthMessageImage setImage:[UIImage imageNamed:@"2.png"]];
    [tutorialScreenHover addSubview:fourthMessageImage];
    
    UIButton *removeFourthMessage = [[UIButton alloc] initWithFrame:CGRectMake(960, 0, 320, 480)];
    [removeFourthMessage addTarget:nil action:@selector(removeFourthMessage) forControlEvents:UIControlEventTouchUpInside];
    [tutorialScreenHover addSubview:removeFourthMessage];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [tutorialScreenHover setFrame:CGRectMake(-960, tutorialScreenHover.frame.origin.y, tutorialScreenHover.frame.size.width, tutorialScreenHover.frame.size.height)];
    [UIView commitAnimations];
}

-(void)removeFourthMessage
{
    UIImageView *fifthMessageImage = [[UIImageView alloc] initWithFrame:CGRectMake(1340, 45, 200, 300)];
    [fifthMessageImage setImage:[UIImage imageNamed:@"4.png"]];
    [tutorialScreenHover addSubview:fifthMessageImage];
    
    UIButton *removeFifthMessage = [[UIButton alloc] initWithFrame:CGRectMake(1280, 0, 320, 480)];
    [removeFifthMessage addTarget:nil action:@selector(removeFifthMessage) forControlEvents:UIControlEventTouchUpInside];
    [tutorialScreenHover addSubview:removeFifthMessage];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [tutorialScreenHover setFrame:CGRectMake(-1280, tutorialScreenHover.frame.origin.y, tutorialScreenHover.frame.size.width, tutorialScreenHover.frame.size.height)];
    [UIView commitAnimations];
}

-(void)removeFifthMessage
{
    UIImageView *sixthMessageImage = [[UIImageView alloc] initWithFrame:CGRectMake(1620, 20, 150, 225)];
    [sixthMessageImage setImage:[UIImage imageNamed:@"5.png"]];
    [tutorialScreenHover addSubview:sixthMessageImage];
    
    UITextView *sixthMessageText = [[UITextView alloc] initWithFrame:CGRectMake(1620, 265, 280, 200)];
    [sixthMessageText setText:@"The second section is the democratic stage of the app. It's all about the suggestions and the complaints citizens express. Everybody can vote either red or green and the rows go up or down in a Karma-style evaluation. People also have the chance to participate and express themselves. The geographical location is automatically added to the message for the viewing in the map."];
    [sixthMessageText setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
    [sixthMessageText setTextColor:[UIColor colorWithWhite:1 alpha:1]];
    [tutorialScreenHover addSubview:sixthMessageText];
    
    UIButton *removeSixthMessage = [[UIButton alloc] initWithFrame:CGRectMake(1600, 0, 320, 480)];
    [removeSixthMessage addTarget:nil action:@selector(removeSixthMessage) forControlEvents:UIControlEventTouchUpInside];
    [tutorialScreenHover addSubview:removeSixthMessage];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [tutorialScreenHover setFrame:CGRectMake(-1600, tutorialScreenHover.frame.origin.y, tutorialScreenHover.frame.size.width, tutorialScreenHover.frame.size.height)];
    [UIView commitAnimations];
}

-(void)removeSixthMessage
{
    UIImageView *seventhMessageImage = [[UIImageView alloc] initWithFrame:CGRectMake(1980, 45, 200, 300)];
    [seventhMessageImage setImage:[UIImage imageNamed:@"7.png"]];
    [tutorialScreenHover addSubview:seventhMessageImage];
    
    UILabel *enjoyLabel = [[UILabel alloc] initWithFrame:CGRectMake(1980, 355, 200, 30)];
    [enjoyLabel setText:@"Enjoy!"];
    [enjoyLabel setTextAlignment:UITextAlignmentCenter];
    [enjoyLabel setBackgroundColor:[UIColor colorWithWhite:1 alpha:0]];
    [enjoyLabel setTextColor:[UIColor colorWithWhite:1 alpha:1]];
    [enjoyLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:24]];
    [tutorialScreenHover addSubview:enjoyLabel];
    
    UIButton *removeSeventhMessage = [[UIButton alloc] initWithFrame:CGRectMake(1920, 0, 320, 480)];
    [removeSeventhMessage addTarget:nil action:@selector(removeSeventhMessage) forControlEvents:UIControlEventTouchUpInside];
    [tutorialScreenHover addSubview:removeSeventhMessage];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [tutorialScreenHover setFrame:CGRectMake(-1920, tutorialScreenHover.frame.origin.y, tutorialScreenHover.frame.size.width, tutorialScreenHover.frame.size.height)];
    [UIView commitAnimations];
}

-(void)removeSeventhMessage {
    
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [tutorialScreenHover setAlpha:0];
    [UIView setAnimationDidStopSelector:@selector(removeAllHovers)];
    [UIView commitAnimations];
}

-(void)removeAllHovers
{
    [animationBg removeFromSuperview];
    [tutorialScreenHover removeFromSuperview];
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
