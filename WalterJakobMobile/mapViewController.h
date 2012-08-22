//
//  mapViewController.h
//  WalterJakobMobile
//
//  Created by Jakob Hans Renpening on 22/8/12.
//  Copyright (c) 2012 WalterJakob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "annotationsController.h"
#import "CLLocationController.h"
#import "ConnectedClass.h"

@interface mapViewController : UIViewController <MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate, CoreLocationControllerDelegate>
{
    MKMapView *map;
    CLLocationController *locationController;
    
    UITableView *layersTable;
    
    BOOL mapGotLocation;
}

@property MKMapView *map;
@property CLLocationController *locationController;

@property UITableView *layersTable;

@property BOOL mapGotLocation;

@end
