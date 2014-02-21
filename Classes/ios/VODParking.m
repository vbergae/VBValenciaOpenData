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
    VODParking *parking = [super entityFromResponse:object];
    NSAssert([parking isKindOfClass:VODParking.class],
             @"should create an instance of VODParking not %@",
             NSStringFromClass(parking.class));
    
    NSString *message       = object[@"mensaje"];
    //
    NSArray *parkingData    = [message componentsSeparatedByString:@"\n"];
    NSString *name          = parkingData[0];
    NSString *placesText    = parkingData[1];
    NSArray *placesData     = [placesText componentsSeparatedByString:@":"];
    NSUInteger places       = [placesData[1] integerValue];
 
    parking.name        = name;
    parking.availables      = places;

    return parking;
}

+ (NSString *)relativePath
{
    return @"gps/aparcamientos/{lat}/{lon}";
}

@end
