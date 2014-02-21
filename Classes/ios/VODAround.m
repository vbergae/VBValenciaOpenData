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

@end
