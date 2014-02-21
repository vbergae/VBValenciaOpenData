//
//  VODEntity.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODEntity.h"

@implementation VODEntity

#pragma mark -
#pragma mark Class methods

+ (instancetype)entityFromResponse:(NSDictionary *)object
{
    NSParameterAssert(object);
    
    double latitude     = (double)([object[@"latDestino"] doubleValue] / 1000000.);
    double longitude    = (double)([object[@"lonDestino"] doubleValue] / 1000000.);
    NSUInteger distance = [object[@"distancia"] unsignedIntegerValue];
    
    CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(
        latitude,
        longitude
    );
    
    VODEntity *entity   = [[self alloc] init];
    entity.coordinates  = coordinates;
    entity.distance     = distance;
    
    return entity;
}

+ (NSString *)relativePath
{
    return nil;
}

@end
