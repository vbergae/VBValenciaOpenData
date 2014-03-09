//
//  VBAppDelegate.m
//  VBValenciaOpenDataExample
//
//  Created by Víctor on 02/03/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VBAppDelegate.h"

@interface VBAppDelegate()<CLLocationManagerDelegate> {
@private
    CLLocationManager *_locationManager;
}

@property (readwrite, getter = isLocationAvailable) BOOL locationAvailable;
@property (readonly) CLLocationManager *locationManager;

@end

@implementation VBAppDelegate

#pragma mark -
#pragma mark Properties

- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    
    return _locationManager;
}

#pragma mark -
#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.locationAvailable = NO;
    [self.locationManager startUpdatingLocation];
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self.locationManager stopUpdatingLocation];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    self.locationAvailable = NO;
    [self.locationManager startUpdatingLocation];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self.locationManager stopUpdatingLocation];
}

#pragma mark -
#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    CLLocation *location    = locations[0];
    self.userCoordinates    = location.coordinate;
    self.locationAvailable  = YES;
    
    [self.locationManager stopUpdatingLocation];
}

@end
