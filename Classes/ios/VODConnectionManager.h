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
 Default URL (http://mapas.valencia.es/lanzadera )
 */
extern NSString * const kVODBaseURLString;
/**
 String used as the username's key (username)
 */
extern NSString * const kVODUsernameKey;
/**
 String used as the password's key (password)
 */
extern NSString * const kVODPasswordKey;

/**
 @name Helper functions
 */

/**
 Generates a NSString instance from the latitude value
 
 Transforms value to an integer number using the multiplier 10^6 and
 generates a valid NSString instance from the resultant NSInteger.
 
 @param value Reprensents a latitude or longitude value from 
 CLLocationCoordinate2D struc
 
 @return String without floting point values
 */
NSString * NSStringFromCoordinateComponent(double value);

/**
 VODConnectionManager
 
 Represents the connectio to a host and the interface to his actions.
 */
@interface VODConnectionManager : AFHTTPRequestOperationManager

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
 
 @param url The base URL for the HTTP client.
 @param options The options dictionary with credentials
 
 @return Initialized and configured connection manager
 */
- (id)initWithBaseURL:(NSURL *)url options:(NSDictionary *)options;

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

/**
 @name Make request
 */

/*+
 Makes a request to URLFormat replacing coordinate's components templates
 with the coordinates given.
 
 Replaces ocurrences of strings {lat} coordinate's latitude and {lon} with 
 longitude's coordinate.
 
 @see GET:completion:
 @param URLFormat End point with coordinate's template
 @param coordinate Coordinates values
 @param handler Completion handler
 */
- (void)GET:(NSString *)URLFormat
coordinates:(CLLocationCoordinate2D)coordinate
 completion:(void(^)(id response, NSError *error))handler;

/*+
 Makes a request to URLString.
 
 Performs a GET request to URLString and callas handler block as callback.
 
 @param URLFormat End point with coordinate's template
 @param coordinate Coordinates values
 @param handler Completion handler
 */
- (void)GET:(NSString *)URLString
completion:(void(^)(id, NSError *))handler;

@end
