//
//  VODValenbisiParking.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 21/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODValenbisiParking.h"

@implementation VODValenbisiParking

+ (instancetype)entityFromResponse:(NSDictionary *)object
{
    VODValenbisiParking *parking = [super entityFromResponse:object];
    NSAssert([parking isKindOfClass:VODValenbisiParking.class],
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
    parking.places      = places;
    
    return parking;
}

+ (NSString *)relativePath
{
    return @"valenbisi/libres/{lat}/{lon}";
}

@end
