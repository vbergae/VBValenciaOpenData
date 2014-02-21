//
//  VODValenbisiParkingTests.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 21/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "VODValenbisiParking.h"

@interface VODValenbisiParkingTests : XCTestCase

@property VODValenbisiParking *valenbisi;

@end

@implementation VODValenbisiParkingTests

- (void)setUp
{
    [super setUp];

    self.valenbisi = VODValenbisiParking.new;
}

- (void)tearDown
{
    self.valenbisi = nil;
    
    [super tearDown];
}

#pragma mark -
#pragma mark Properties

- (void)test_name
{
    self.valenbisi.name = @"name";
    XCTAssertNotNil(self.valenbisi.name, @"should set a valid string");
}

- (void)test_places
{
    self.valenbisi.places = NSUIntegerMax;
    XCTAssertTrue(self.valenbisi.places == NSUIntegerMax,
                  "should set NSUInteger places");
}

#pragma mark -
#pragma mark Class methods

#pragma mark entityFromResponse:

- (void)test_entityFromResponse
{
    NSDictionary *object = @{
        @"latDestino"   : @(39471796),
        @"lonDestino"   : @(-36815300),
        @"distancia"    : @(2186),
        @"titulo"       : @"APARCAMIENTOS",
        @"mensaje"      : @"Autopista del Saler - Antonio Ferrandis (C.C. El Saler)\nPlazas libres: 3"
    };
    
    VODValenbisiParking *entity = [VODValenbisiParking entityFromResponse:object];
    XCTAssertEqualObjects(entity.name,
                          @"Autopista del Saler - Antonio Ferrandis (C.C. El Saler)",
                          @"should set name from options");
    XCTAssertTrue(entity.places == 3, @"should set places from options");
}

#pragma mark relativePath

- (void)test_relativePath
{
    NSString *expected = @"valenbisi/libres/{lat}/{lon}";
    NSString *result = VODValenbisiParking.relativePath;
    
    XCTAssertEqualObjects(expected, result, @"shoult return his relative path");
}

@end
