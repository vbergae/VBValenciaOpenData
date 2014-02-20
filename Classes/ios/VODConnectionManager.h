//
//  VODConnectionManager.h
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "AFHTTPRequestOperationManager.h"

/**
 @name Constants
 */

/**
 String used as the username's key
 */
extern NSString * const kVODUsernameKey;
extern NSString * const kVODPasswordKey;

/**
 VODConnectionManager
 */
@interface VODConnectionManager : AFHTTPRequestOperationManager
<CLLocationManagerDelegate>

/**
 @name Properties
 */

@property (nonatomic, readonly) CLLocation *userLocation;

/**
 @name Creating a Connection Manager
 */

/**
 Default initializer
 
 Creates a new instance of VBConnectionManager and sets his properties
 using the option's dictionary.
 
 Options format:
 
    @{
        kVODUsernameKey : @"your_api_username",
        kVODPasswordKey : @"password"
    }
 
 @warning Throws NSInternalInconsistencyException if options is nil or
    username/password keys don't exists.
 
 @param options
 */
- (id)initWithOptions:(NSDictionary *)options;

/**
 The default VODConnectionManager object for the host 
 http://http://mapas.valencia.es
 
 This method always returns the same connection manager object. On his creation
 looks for the file Athorization.plist on all bundles (property list
 representing options' structure @see initWithOptions) and configures
 authorization headers.
 
 @warning If the Authorization.plist file is not found the method will raise
 NSInternalInconsistencyException.
 */
+ (instancetype)defaultManager;

@end
