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

@synthesize mapContainer;
@synthesize map;
@synthesize locationController;
@synthesize layersTable;


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
    
    gov_progress = YES;
    gov_finished = YES;
    com_comp = YES;
    com_propo = YES;
    
    UIView *layersTableHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 30)];
    [layersTableHeader setBackgroundColor:[UIColor colorWithWhite:0.75 alpha:1]];
    UILabel *tableHeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 120, 20)];
    [tableHeaderLabel setText:@"CITY PROJECTS"];
    [tableHeaderLabel setBackgroundColor:[UIColor colorWithWhite:1 alpha:0]];
    [tableHeaderLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:14]];
    [layersTableHeader addSubview:tableHeaderLabel];
    
    layersTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 130, 430)];
    [layersTable setTableHeaderView:layersTableHeader];
    [layersTable setDelegate:self];
    [layersTable setDataSource:self];
    [layersTable setRowHeight:30];
    [layersTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [layersTable setBackgroundColor:[UIColor colorWithWhite:0.25 alpha:1]];
    [layersTable setScrollEnabled:NO];
    [layersTable setBounces:NO];
    [self.view addSubview:layersTable];
    
    [self.navigationController.navigationBar.topItem setTitle:@"Map"];
    UIButton *lftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 39, 29)];
    [lftBtn setImage:[UIImage imageNamed:@"top_button.png"] forState:UIControlStateNormal];
    [lftBtn addTarget:self action:@selector(moveMapAside) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:lftBtn];
    [self.navigationItem setLeftBarButtonItem:leftButton];
    [self.navigationItem.leftBarButtonItem setEnabled:YES];
    
    mapGotLocation = NO;
    
    [self.view addSubview:layersTable];
    
    mapContainer = [[UIView alloc] initWithFrame:CGRectMake(-5, 0, 325, 411)];
    
    UIImageView *mapShadow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 5, 411)];
    [mapShadow setImage:[UIImage imageNamed:@"map_shadow.png"]];
    [mapContainer addSubview:mapShadow];
    
    map = [[MKMapView alloc] initWithFrame:CGRectMake(5, 0, 320, 411)];
    [map setShowsUserLocation:YES];
    [map setDelegate:self];
    
    locationController = [[CLLocationController alloc] init];
    [locationController setDelegate:self];
    
    [mapContainer addSubview:map];
    [self.view addSubview:mapContainer];
    [self performSelectorOnMainThread:@selector(reloadMapAnnotations) withObject:nil waitUntilDone:YES];
    
    mapGotLocation = NO;
    movedMap = NO;
}

-(void)moveMapAside
{
    if (!movedMap) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        [mapContainer setFrame:CGRectMake(125, mapContainer.frame.origin.y, mapContainer.frame.size.width, mapContainer.frame.size.height)];
        [UIView commitAnimations];
        
        movedMap = YES;
    } else {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        [mapContainer setFrame:CGRectMake(-5, mapContainer.frame.origin.y, mapContainer.frame.size.width, mapContainer.frame.size.height)];
        [UIView commitAnimations];
        
        movedMap = NO;
    }
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(annotationsController*)annotation
{
    if ([annotation isMemberOfClass:[MKUserLocation class]]) {
        return nil;
    } else {
        MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"locationPin"];
        
        UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
        [infoButton addTarget:nil action:@selector(showAnnotationDetail:) forControlEvents:UIControlEventTouchUpInside];
        [infoButton setTag:[annotation.annotationID intValue]];
        
        if ([annotation.subtitle isEqualToString:@"In Progress"]) {
            [annotationView setImage:[UIImage imageNamed:@"map_marker_yellow.png"]];
        } else if ([annotation.subtitle isEqualToString:@"Finished"]) {
            [annotationView setImage:[UIImage imageNamed:@"map_marker_green.png"]];
        } else if ([annotation.subtitle isEqualToString:@"Proposal"]) {
            [annotationView setImage:[UIImage imageNamed:@"map_marker_purple.png"]];
        } else if ([annotation.subtitle isEqualToString:@"Complaint"]) {
            [annotationView setImage:[UIImage imageNamed:@"map_marker_red.png"]];
        } else {
            return nil;
        }
        
        annotationView.rightCalloutAccessoryView = infoButton;
        [annotationView setFrame:CGRectMake(0, 0, 30, 36)];
        [annotationView setCenterOffset:CGPointMake(3, -2)];
        [annotationView setCalloutOffset:CGPointMake(-6, -5)];
        [annotationView setCanShowCallout:YES];
        
        return annotationView;
    }
}

-(void)showAnnotationDetail:(id)sender
{
    AppDelegate* appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    
    UIButton *sendingButton = (UIButton *)sender;
    NSArray *selectedItem = [[NSArray alloc] initWithArray:[appDelegate.mapPoints objectAtIndex:sendingButton.tag]];
    
    [appDelegate.detailsItem setArray:selectedItem];
    
    [self performSegueWithIdentifier:@"MAP_TO_DETAILS" sender:self];
}



-(void)locationUpdate:(CLLocation *)location
{
    if (location.horizontalAccuracy >= 0 && !mapGotLocation) {
        MKCoordinateRegion mapRegion;
        mapRegion.center.latitude = location.coordinate.latitude;
        mapRegion.center.longitude = location.coordinate.longitude;
        mapRegion.span.latitudeDelta = 0.03;
        mapRegion.span.longitudeDelta = 0.03;
        
        [map setRegion:mapRegion];
        
        mapGotLocation = YES;
    }
}

-(void)locationError:(NSError *)error
{
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 130, 30)];
    UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 28)];
    [cellView setBackgroundColor:[UIColor colorWithWhite:0.25 alpha:1]];
    [cell addSubview:cellView];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    UIImageView *separator = [[UIImageView alloc] initWithFrame:CGRectMake(0, 28, 130, 2)];
    [separator setImage:[UIImage imageNamed:@"div_line_table.png"]];
    [cell addSubview:separator];
    
    UILabel *cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 110, 18)];
    [cellLabel setBackgroundColor:[UIColor colorWithWhite:1 alpha:0]];
    [cellLabel setTextColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [cellLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:12]];
    
    UIImageView *cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 8, 10, 10)];
    
    switch (indexPath.row) {
        case 0:
            [cellLabel setText:@"IN PROGRESS"];
            if (gov_progress) {
                [cellImage setImage:[UIImage imageNamed:@"circle_yellow.png"]];
            } else {
                [cellImage setImage:[UIImage imageNamed:@"circle_grey.png"]];
            }
            break;
            
        case 1:
            [cellLabel setText:@"FINISHED"];
            if (gov_finished) {
                [cellImage setImage:[UIImage imageNamed:@"circle_green.png"]];
            } else {
                [cellImage setImage:[UIImage imageNamed:@"circle_grey.png"]];
            }
            break;

        case 2:
            [cellLabel setText:@"PROPOSALS"];
            if (com_propo) {
                [cellImage setImage:[UIImage imageNamed:@"circle_purple.png"]];
            } else {
                [cellImage setImage:[UIImage imageNamed:@"circle_grey.png"]];
            }
            break;
            
        case 3:
            [cellLabel setText:@"COMPLAINTS"];
            if (com_comp) {
                [cellImage setImage:[UIImage imageNamed:@"circle_red.png"]];
            } else {
                [cellImage setImage:[UIImage imageNamed:@"circle_grey.png"]];
            }
            break;
                
        default:
            break;
    }
    
    [cellView addSubview:cellLabel];
    [cellView addSubview:cellImage];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
    
    switch (indexPath.row) {
        case 0:
            gov_progress = !gov_progress;
            break;
                
        case 1:
            gov_finished = !gov_finished;
            break;
                
        case 2:
            com_propo = !com_propo;
            break;
                
        case 3:
            com_comp = !com_comp;
            break;
                
        default:
            break;
    }
    
    [tableView reloadData];
    [self performSelectorOnMainThread:@selector(reloadMapAnnotations) withObject:nil waitUntilDone:YES];
}

-(void)reloadMapAnnotations
{
    
    [map performSelectorOnMainThread:@selector(removeAnnotations:) withObject:[map annotations] waitUntilDone:YES];
    
    AppDelegate* appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    
    for (NSArray *mapItem in appDelegate.mapPoints) {
        NSArray *coordinates = [[mapItem objectAtIndex:2] componentsSeparatedByString:@","];
        BOOL annotationOK;
        if ([[mapItem objectAtIndex:1] isEqualToString:@"In Progress"] && gov_progress == YES) {
            annotationOK = YES;
        } else if ([[mapItem objectAtIndex:1] isEqualToString:@"Finished"] && gov_finished == YES) {
            annotationOK = YES;
        } else if ([[mapItem objectAtIndex:1] isEqualToString:@"Proposal"] && com_propo == YES) {
            annotationOK = YES;
        } else if ([[mapItem objectAtIndex:1] isEqualToString:@"Complaint"] && com_comp == YES) {
            annotationOK = YES;
        } else {
            annotationOK = NO;
        }
        
        if (annotationOK) {
            CLLocationCoordinate2D coord;
            
            coord.latitude = [[coordinates objectAtIndex:0] floatValue];
            coord.longitude = [[coordinates objectAtIndex:1] floatValue];
            
            annotationsController *markPin = [[annotationsController alloc] initWithTitle:[mapItem objectAtIndex:0] subtitle:[mapItem objectAtIndex:1] coordinate:coord annotationType:[mapItem objectAtIndex:3] andAnnotationID:[mapItem objectAtIndex:4]];
            
            [map performSelectorOnMainThread:@selector(addAnnotation:) withObject:markPin waitUntilDone:YES];
        }
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

@end