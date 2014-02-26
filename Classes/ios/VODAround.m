//
//  VODArondMe.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODAround.h"

#import "VODConnectionManager.h"
#import "VODParking.h"
#import "VODValenbisiParking.h"
#import "VODValenbisiBike.h"
#import "VODTaxi.h"
#import "VODWifi.h"
#import "VODTraffic.h"

@implementation VODAround

+ (void)findParkings:(void (^)(NSArray *, NSError *))handler
{
    NSParameterAssert(handler);
    
    [VODConnectionManager.defaultManager
     GET:VODParking.relativePath
     completion:^(id response, NSError *error)
    {
        NSArray *elements = [VODParking entitiesFromResponse:response];
        handler(elements, error);
    }];
}

+ (void)findValenbisiParkings:(void (^)(NSArray *, NSError *))handler
{
    NSParameterAssert(handler);
    
    [VODConnectionManager.defaultManager
     GET:VODValenbisiParking.relativePath
     completion:^(id response, NSError *error)
    {
        NSArray *elements = [VODValenbisiParking entitiesFromResponse:response];
        handler(elements, error);
    }];
}

+ (void)findValenbisiBikes:(void (^)(NSArray *, NSError *))handler
{
    NSParameterAssert(handler);
    
    [VODConnectionManager.defaultManager
     GET:VODValenbisiBike.relativePath
     completion:^(id response, NSError *error) {
         NSArray *elements = [VODValenbisiBike entitiesFromResponse:response];
         handler(elements, error);
     }];
}

+ (void)findTaxis:(void (^)(NSArray *, NSError *))handler
{
    NSParameterAssert(handler);
    
    [VODConnectionManager.defaultManager
     GET:VODTaxi.relativePath
     completion:^(id response, NSError *error) {
         NSArray *elements = [VODTaxi entitiesFromResponse:response];
         handler(elements, error);
     }];
}

+ (void)findWifis:(void (^)(NSArray *, NSError *))handler
{
    NSParameterAssert(handler);
    
    [VODConnectionManager.defaultManager
     GET:VODWifi.relativePath
     completion:^(id response, NSError *error) {
         NSArray *elements = [VODWifi entitiesFromResponse:response];
         handler(elements, error);
     }];
}

+ (void)findTrafficMessages:(void (^)(NSArray *, NSError *))handler
{
    NSParameterAssert(handler);
    
    [VODConnectionManager.defaultManager
     GET:VODTraffic.relativePath
     completion:^(id response, NSError *error) {
         NSArray *elements = [VODTraffic entitiesFromResponse:response];
         handler(elements, error);
     }];
}

@end
