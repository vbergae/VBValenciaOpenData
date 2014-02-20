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
    [VODConnectionManager.defaultManager
     GET:VODParking.relativePath
     completion:^(id response, NSError *error)
    {
        NSMutableArray *parkings = nil;
        
        if (!error) {
            NSAssert([response isKindOfClass:NSArray.class],
                     @"Response object expected as NSArray");
            parkings = [NSMutableArray arrayWithCapacity:
                        [(NSArray *)response count]];
            
            for (NSDictionary *object in response) {
                VODParking *parking = [VODParking entityFromResponse:
                                       object];
                [parkings addObject:parking];
            }
        }
        
        handler(parkings, error);
    }];
}

@end
