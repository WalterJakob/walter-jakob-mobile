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
#import "AppDelegate.h"

@interface mapViewController : UIViewController <MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate, CoreLocationControllerDelegate>
{
    UIView *mapContainer;
    MKMapView *map;
    CLLocationController *locationController;
    
    UITableView *layersTable;
    
    BOOL mapGotLocation;
    BOOL movedMap;
    BOOL mapFirstLoad;
    
    BOOL gov_progress;
    BOOL gov_finished;
    BOOL com_propo;
    BOOL com_comp;
}

@property UIView *mapContainer;
@property MKMapView *map;
@property CLLocationController *locationController;

@property UITableView *layersTable;

@end
