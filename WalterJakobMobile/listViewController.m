//
//  listViewController.m
//  WalterJakobMobile
//
//  Created by Jakob Hans Renpening on 22/8/12.
//  Copyright (c) 2012 WalterJakob. All rights reserved.
//

#import "listViewController.h"

@interface listViewController ()

@end

@implementation listViewController

@synthesize communityTable;
@synthesize moodBtn;
@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)textFieldShouldReturn:(UIPlaceHolderTextView *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar.topItem setTitle:@"Community"];
    
    UIView *submitContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    [submitContainer setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
    textView = [[UIPlaceHolderTextView alloc] initWithFrame:CGRectMake(0, 0, 270, 80)];
    [textView setPlaceholder:@"Contribute with your own Complaint or Proposal to improve the city."];
    [textView setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [textView setReturnKeyType:UIReturnKeyDone];
    
    moodBtn = [[UIButton alloc] initWithFrame:CGRectMake(270, 0, 50, 40)];
    [moodBtn setImage:[UIImage imageNamed:@"proposal_btn.png"] forState:UIControlStateNormal];
    proposalBtn = YES;
    [moodBtn addTarget:nil action:@selector(toggleBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(270, 40, 50, 40)];
    [sendBtn setImage:[UIImage imageNamed:@"send_btn.png"] forState:UIControlStateNormal];
    [sendBtn addTarget:nil action:@selector(sendAlert) forControlEvents:UIControlEventTouchUpInside];
    
    [submitContainer addSubview:textView];
    [submitContainer addSubview:moodBtn];
    [submitContainer addSubview:sendBtn];
    
    [self.view addSubview:submitContainer];
    
    communityTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 320, 285)];
    [communityTable setRowHeight:42];
    [communityTable setDelegate:self];
    [communityTable setDataSource:self];
    [communityTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:communityTable];
    
    items = [[NSMutableArray alloc] initWithCapacity:1];
    
    AppDelegate* appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    for (NSArray *itemArray in appDelegate.mapPoints) {
        if ([[itemArray objectAtIndex:1] isEqualToString:@"Complaint"] || [[itemArray objectAtIndex:1] isEqualToString:@"Proposal"]) {
            [items addObject:itemArray];
        }
    }
}

-(void)sendAlert
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Contributing" message:@"We really appreciate your trying to collaborate. Unfortunately this is just a prototype and has no services on the outside." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    
    [textView resignFirstResponder];
}

-(void)textViewResignKeyboard
{
    [textView resignFirstResponder];
}

-(void)toggleBtn
{
    if (proposalBtn) {
        [moodBtn setImage:[UIImage imageNamed:@"complaint_btn.png"] forState:UIControlStateNormal];
        proposalBtn = NO;
    } else {
        [moodBtn setImage:[UIImage imageNamed:@"proposal_btn.png"] forState:UIControlStateNormal];
        proposalBtn = YES;
    }
    
    [self textViewResignKeyboard];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 320, 42)];
    
    UIButton *upvoteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 1, 20, 20)];
    [upvoteButton setImage:[UIImage imageNamed:@"upvote.png"] forState:UIControlStateNormal];
    
    UIButton *downvoteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 21, 20, 20)];
    [downvoteButton setImage:[UIImage imageNamed:@"downvote.png"] forState:UIControlStateNormal];
    
    [cell addSubview:upvoteButton];
    [cell addSubview:downvoteButton];
    
    UIImageView *cellBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 42)];
    [cellBg setImage:[UIImage imageNamed:@"cell_bg.png"]];
    [cell setBackgroundView:cellBg];
    
    UILabel *itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, 290, 32)];
    [itemTitle setText:[[items objectAtIndex:indexPath.row] objectAtIndex:0]];
    if ([[[items objectAtIndex:indexPath.row] objectAtIndex:1] isEqualToString:@"Complaint"]) {
        [itemTitle setTextColor:[UIColor colorWithRed:0.8 green:0.3 blue:0.3 alpha:1]];
    }
    [cell addSubview:itemTitle];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate* appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    
    [appDelegate.detailsItem setArray:[items objectAtIndex:indexPath.row]];
    
    [self performSegueWithIdentifier:@"LIST_TO_DETAILS" sender:self];
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
