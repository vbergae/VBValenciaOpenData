//
//  VODWifi.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 24/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODWifi.h"

@implementation VODWifi

#pragma mark -
#pragma mark Class methods

+ (instancetype)entityFromResponse:(NSDictionary *)object
{
    VODWifi *wifi = [super entityFromResponse:object];
    wifi.description = object[@"mensaje"];
    
    return wifi;
}

+ (NSString *)relativePath
{
    return @"wifi/{lat}/{lon}";
}

@end
