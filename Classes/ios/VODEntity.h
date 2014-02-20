//
//  VODEntity.h
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

/**
 VODEntity
 */
@interface VODEntity : NSObject

@property NSString *title;
@property CLLocationCoordinate2D coordinates;
@property NSUInteger distance;
@property (readonly) NSString *object;

/**
 @name Entity creation
 */

+ (instancetype)entityFromResponse:(NSDictionary *)object;

/**
 @name Environtment
 */

+ (NSString *)relativePath;

@end
