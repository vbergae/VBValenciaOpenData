//
//  VODTraffic.m
//  VBValenciaOpenData
//
//  Created by Víctor on 26/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODTraffic.h"

@implementation VODTraffic

+ (NSArray *)entitiesFromResponse:(id)response
{
    NSParameterAssert(response);
    NSAssert([response isKindOfClass:NSDictionary.class],
             @"Respnse expected as NSDictionary instane");
    
    static NSString * const NoDataString = @"SIN_RESULTADOS";
    
    NSMutableArray *entities;
    if (![response[@"titulo"] isEqualToString:NoDataString]) {
        NSString *entitiesStr = response[@"mensaje"];
        NSArray *entitiesRaw = [entitiesStr componentsSeparatedByString:@"\n"];
        entities = [NSMutableArray arrayWithCapacity:entitiesRaw.count];
        
        for (NSString *entityStr in entitiesRaw) {
            NSDictionary *keyedValues = @{ @"message" : entitiesStr };
            
            VODTraffic *traffic = [self entityFromResponse:keyedValues];
            [entities addObject:traffic];
        }
    }
    
    return entities;
}

+ (instancetype)entityFromResponse:(NSDictionary *)object
{
    VODTraffic *traffic = VODTraffic.new;
    [traffic setValuesForKeysWithDictionary:object];
    
    return traffic;
}

+ (NSString *)relativePath
{
    return @"trafico/{lat}/{lon}";
}

@end
