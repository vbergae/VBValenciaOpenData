//
//  VBAppDelegate.h
//  VBValenciaOpenDataExample
//
//  Created by Víctor on 02/03/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

@import UIKit;
@import MapKit;

@interface VBAppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, getter = isLocationAvailable) BOOL locationAvailable;
@property CLLocationCoordinate2D userCoordinates;
@property (strong, nonatomic) UIWindow *window;

@end
