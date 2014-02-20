//
//  VODParking.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODParking.h"

@implementation VODParking

#pragma mark -
#pragma mark Class methods

+ (instancetype)entityFromResponse:(NSDictionary *)object
{
//    "latDestino":39471796,
//    "lonDestino":-368153,
//    "distancia":2186,
//    "titulo":"APARCAMIENTOS",
//    "mensaje":"PORTA DE LA MAR - COLON\nPlazas libres: 94"
    
    double latitude = (double)([object[@"latDestino"] integerValue] / 1000000);
    double longitude = (double)([object[@"lonDestino"] integerValue] / 1000000);
    NSUInteger distance = [object[@"distancia"] unsignedIntegerValue];
    NSString *title = object[@"titulo"];
    NSString *message = object[@"mensaje"];
    //
    NSArray *parkingData = [message componentsSeparatedByString:@"\n"];
    NSString *name = parkingData[0];
    NSString *placesText = parkingData[1];
    NSArray *placesData = [placesText componentsSeparatedByString:@":"];
    NSUInteger places = [placesData[1] integerValue];
    CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(
        latitude,
        longitude
    );
    
    VODParking *parking = VODParking.new;
    parking.title       = title;
    parking.coordinates = coordinates;
    parking.distance    = distance;
    parking.name        = name;
    parking.places      = places;

    return parking;
}

+ (NSString *)relativePath
{
    return @"gps/aparcamientos/{lat}/{lon}";
}

@end
