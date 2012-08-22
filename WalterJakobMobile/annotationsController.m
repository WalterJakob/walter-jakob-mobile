//
//  annotationsController.m
//  geoJoy
//
//  Created by Jakob Hans Renpening on 24/09/11.
//  Copyright 2011 Claim Soluciones, S.C.P. All rights reserved.
//

#import "annotationsController.h"

@implementation annotationsController

@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize coordinate = _coordinate;
@synthesize annotationType;

-(id)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle coordinate:(CLLocationCoordinate2D)coordinate andAnnotationType:(NSString *)annotationType{
    if ((self = [super init])) {
        _title = [title copy];
        _subtitle = [subtitle copy];
        _coordinate = coordinate;
        self.annotationType = annotationType;
    }
    return self;
}

@end
