//
//  VODArondMe.h
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 VODAround
 
 Provides access to commond elements near the user. 
 
 You use this class as the interface between the service and your app. His
 purpose is to provide a simple API to manage the connection and data structures.
 
 On all methods 'response' will be nil if an error occurs. Resonse element's
 concrete class would be described in every method.
 
 An example of usage which requests parkings near the user:
 
    [VODAroung findParkings:^(NSArray *response, NSError *error) {
        if (error) {
            // Handler the error
        }
 
        // In this example, reponse contains VODParking instances
        for (VODParking *parking in response) {
            NSLog(@"Parking: %@", parking);
        }
    }];
 
 @warning Default service (http://mapas.valencia.es/lanzadera) returns always 
 three elements.
 */
@interface VODAround : NSObject

/**
 @name Performing requests
 */

/**
 Requests three parkings near the user with available places.
 
 @param handler Completion handler. The 'elements' param will contain instances
 of VODParking (@see VODParking).
 */
+ (void)findParkings:(void(^)(NSArray *elements, NSError *error))handler;

/**
 Request three Valenbisi's stations with available places.
 
 @param handler Completion handler. The 'elements' param will contain instances
 of VODValenbisiParking (@see VODValenbisiParking).
 */
+ (void)findValenbisiParkings:(void(^)(NSArray *elements, NSError *error))handler;

/**
 Requests the number of available bikes on the three most near stations.
 
 @param handler Completion handler. The 'elements' param will contain instances
 of VODValenbisiBike (@see VODValenbisiBike).
 */
+ (void)findValenbisiBikes:(void(^)(NSArray *elements, NSError *error))handler;

/**
 Requests the most near taxi stops.
 
 @param handler Completion handler. The 'elements' param will contain instances
 of VODValenbisiBike (@see VODValenbisiBike).
 */
+ (void)findTaxis:(void(^)(NSArray *elements, NSError *error))handler;


/**
 Requests WiFi hotspots.
 
 @param handler Completion handler. The 'elements' param will contain instances
 of VODWifi (@see VODWifi).
 */
+ (void)findWifis:(void(^)(NSArray *elements, NSError *error))handler;

@end
