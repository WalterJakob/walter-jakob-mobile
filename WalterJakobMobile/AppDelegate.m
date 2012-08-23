//
//  AppDelegate.m
//  WalterJakobMobile
//
//  Created by Jakob Hans Renpening on 22/8/12.
//  Copyright (c) 2012 WalterJakob. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize detailsItem, mapPoints;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [application setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    
    detailsItem = [[NSMutableArray alloc] initWithCapacity:1];
    
    mapPoints = [[NSMutableArray alloc] initWithCapacity:1];
    
    [mapPoints addObject:[NSArray arrayWithObjects:@"Tempelhof Flughafen", @"In Progress", @"52.482414,13.389317", @"0", @"0", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Victoriapark", @"Finished", @"52.488059,13.379796", @"0", @"1", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"St. Joseph-Krankenhaus Berlin Medizinische Abteilung II - Nephrologie", @"Proposal", @"52.478128,13.373144", @"0", @"2", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Landeskriminalamt Berlin", @"Complaint", @"52.482813,13.385659", @"0", @"3", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Berlin ExpoCenter Airport", @"Finished", @"51.395176,12.407638", @"0", @"4", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Gedächtniskirche", @"In Progress", @"52.50448,13.334846", @"0", @"5", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Hakescher Markt", @"Proposal", @"52.523495,13.402172", @"0", @"6", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"36 Rooms Hostel", @"Complaint", @"52.49857,13.430989", @"0", @"7", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Kaffehaus Kuchenrausch", @"Proposal", @"52.512839,13.457414", @"0", @"8", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Cafe Fleischmöbel", @"Proposal ", @"52.538335,13.41145", @"0", @"9", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Buchkantine", @"Proposal ", @"52.521705,13.338215", @"0", @"10", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Bad Streets", @"Complaint", @"52.515973,13.446447", @"0", @"11", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Bad Streets", @"Complaint", @"52.510893,13.390096", @"0", @"12", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Bad Streets", @"Complaint", @"52.51703,13.390378", @"0", @"13", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Il Barista", @"Proposal", @"52.510501,13.458163", @"0", @"14", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Bundesnachrichtendienst", @"In Progress", @"52.53442,13.378278", @"0", @"15", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Bundesministerium für Bildung und Forschung", @"In Progress", @"52.523141,13.376409", @"0", @"16", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Zentral- und Landesbibliothek Berlin", @"Proposal", @"52.475645,13.391126", @"0", @"17", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"e-THF – Kompetenzzentrum Elektromobilität Tempelhof", @"Proposal", @"52.481473,13.399623", @"0", @"18", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Parkplannung", @"Proposal", @"52.475096,13.400911", @"0", @"19", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Bundesministerium des Innern", @"In Progress", @"52.521529,13.362388", @"0", @"20", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Hauptbahnhof", @"Finished", @"52.524982,13.368985", @"0", @"21", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Reichstag", @"Finished ", @"52.519041,13.375916", @"0", @"22", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Sony Center", @"Finished", @"52.510204,13.3733", @"0", @"23", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Park", @"Finished", @"52.512395,13.19462", @"0", @"24", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"School", @"In Progress", @"52.541285,13.125008", @"0", @"25", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Bad Streets", @"Complaint", @"52.604507,13.437554", @"0", @"26", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Insecure Area", @"Complaint", @"52.604507,13.437554", @"0", @"27", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Restaurant", @"Finished", @"52.505166,13.378996", @"0", @"28", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Gym", @"Finished", @"52.519616,13.134657", @"0", @"29", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Theater", @"Proposal", @"52.596687,13.291642", @"0", @"30", nil]];
    [mapPoints addObject:[NSArray arrayWithObjects:@"Vivantes-Humboldt Klinikum", @"Finished", @"52.58944,13.308557", @"0", @"31", nil]];
    
    [mapPoints addObject:[NSArray arrayWithObjects:@"Insecure Area", @"Complaint", @"52.47771,13.448203", @"0", @"32", nil]];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
