//
//  listViewController.h
//  WalterJakobMobile
//
//  Created by Jakob Hans Renpening on 22/8/12.
//  Copyright (c) 2012 WalterJakob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "UIPlaceHolderTextView.h"

@interface listViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *communityTable;
    
    NSMutableArray *items;
    
    BOOL proposalBtn;
    
    UIButton *moodBtn;
}

@property UITableView *communityTable;
@property NSMutableArray *items;
@property UIButton *moodBtn;

@end
