//
//  mapViewController.m
//  WalterJakobMobile
//
//  Created by Jakob Hans Renpening on 22/8/12.
//  Copyright (c) 2012 WalterJakob. All rights reserved.
//

#import "mapViewController.h"

@interface mapViewController ()

@end

@implementation mapViewController

@synthesize map;
@synthesize locationController;
@synthesize layersTable;
@synthesize mapGotLocation;


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
    
    /*layersTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 120, 460)];
    [layersTable setDelegate:self];
    [layersTable setDataSource:self];*/
    
    mapGotLocation = NO;
    
    [self.view addSubview:layersTable];
    
    map = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 411)];
    [map setShowsUserLocation:YES];
    
    locationController = [[CLLocationController alloc] init];
    [locationController setDelegate:self];
    
    [self.view addSubview:map];
    
    mapGotLocation = NO;
}

-(void)locationUpdate:(CLLocation *)location
{
    if (location.horizontalAccuracy >= 0 && !mapGotLocation) {
        MKCoordinateRegion mapRegion;
        mapRegion.center.latitude = location.coordinate.latitude;
        mapRegion.center.longitude = location.coordinate.longitude;
        mapRegion.span.latitudeDelta = 0.01;
        mapRegion.span.longitudeDelta = 0.01;
        
        [map setRegion:mapRegion];
        
        mapGotLocation = YES;
    }
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
