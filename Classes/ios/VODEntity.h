//
//  VODEntity.h
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#import "VODConnectionManager.h"

/**
 VODEntity
 
 Base class for all entities.
 
 Represents common data between all objects and exposes common interface
 for his creation from a server's response (@see entityFromResponse:)
 
 @warning Please, not use this class directly, instead use one the concrete
 entities
 */
@interface VODEntity : NSObject

/**
 @name Properties
 */

/**
 Entity's location
 */
@property CLLocationCoordinate2D coordinates;

/**
 Distance between the user and the receiver (in meters)
 */
@property NSUInteger distance;

/**
 @name Making requests
 */

/**
 Finds elements near the given coordinates
 
 @param coordinates Coordinates used as reference
 @param handler Completion handler
 */
+ (void)findAllByCoordinates:(CLLocationCoordinate2D)coordinates
                  completion:(void(^)(NSArray *elements,
                                      NSError *error))handler;

/**
 @name Entity creation
 */

/**
 Parses the raw response from the service and creates a collection of
 concrete objects.
 
 @warning Throws NSInternalInconsistencyException if response objects is nil.
 
 @param response The response object expected as an array of NSDictionary elements.
 @return An array of concrete elements.
 */
+ (NSArray *)entitiesFromResponse:(id)response;

/**
 Creates a new concrete instance based on the values of object. 
 
 Expected structure from Valencia' open data API is:
 
    NSDictionary *object = @{
        @"latDestino"   : @(39471796),
        @"lonDestino"   : @(-36815300),
        @"distancia"    : @(2186),
        @"titulo"       : @"APARCAMIENTOS",
        @"mensaje"      : @"PORTA DE LA MAR - COLON\nPlazas libres: 94"
    };
 
 Values on latDestino and lonDestino would be multiplied by 10^6 in order to
 get valid CLLocationCoordinate2D components.
 
 Value on "titulo" would be ignored because only identifies the concrete type
 
 @warning Raises NSInternalInconsistencyException if object is nil.
 */
+ (instancetype)entityFromResponse:(NSDictionary *)object;

/**
 @name Environment
 */

/**
 Relative path to the resource
 
 Returns an sring with the format "object/{lat}/{lon}". The request would replace 
 the strings {lat} and {long} with user's coordinates.
 
 @warning Concrete classes *must* override this class method with the documented
 endpoint.
 */
+ (NSString *)relativePath;

@end
