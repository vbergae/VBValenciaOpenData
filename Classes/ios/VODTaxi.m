//
//  VODTaxi.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 24/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODTaxi.h"

@implementation VODTaxi

+ (instancetype)entityFromResponse:(NSDictionary *)object
{
    VODTaxi *taxi   = [super entityFromResponse:object];
    NSAssert([taxi isKindOfClass:VODTaxi.class],
             @"Taxi type expected as VODTaxi not %@",
             NSStringFromClass(VODTaxi.class));
    
    taxi.address    = object[@"mensaje"];
    
    return taxi;
}

+ (NSString *)relativePath
{
    return @"taxis/{lat}/{lon}";
}

@end
