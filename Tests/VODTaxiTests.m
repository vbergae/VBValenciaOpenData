//
//  VODTaxiTests.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 24/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VODTaxi.h"

@interface VODTaxiTests : XCTestCase

@end

@implementation VODTaxiTests

#pragma mark -
#pragma mark Class methods

- (void)test_entityFromResponse
{
    NSDictionary *object = @{
                             @"latDestino"   : @(39471796),
                             @"lonDestino"   : @(-36815300),
                             @"distancia"    : @(2186),
                             @"titulo"       : @"APARCAMIENTOS",
                             @"mensaje"      : @"APROX ADDRESS"
                             };
    
    VODTaxi *entity = [VODTaxi entityFromResponse:object];
    XCTAssertEqualObjects(entity.address, @"APROX ADDRESS",
                          @"should set the addres from options");
}

- (void)test_relativePath
{
    NSString *expected = @"taxis/{lat}/{lon}";
    NSString *result = VODTaxi.relativePath;
    
    XCTAssertEqualObjects(expected, result, @"should valid relative path");
}

@end
