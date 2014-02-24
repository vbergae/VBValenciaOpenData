//
//  VODWifiTests.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 24/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VODWifi.h"

@interface VODWifiTests : XCTestCase

@property VODWifi *wifi;

@end

@implementation VODWifiTests

- (void)setUp
{
    [super setUp];
    
    self.wifi = VODWifi.new;
}

- (void)tearDown
{
    self.wifi = nil;
    
    [super tearDown];
}

#pragma mark -
#pragma mark Properties

- (void)test_description
{
    self.wifi.description = @"SOME DESCRIPTION";
    XCTAssertNotNil(self.wifi.description, @"should set his description");
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
                             @"titulo"       : @"WIFI",
                             @"mensaje"      : @"WIFI DESCRIPTION"
                             };
    
    VODWifi *entity = [VODWifi entityFromResponse:object];
    XCTAssertEqualObjects(entity.description, @"WIFI DESCRIPTION",
                          @"should set the description from options");
}

#pragma mark relativePath

- (void)test_relativePath
{
    NSString *expected = @"wifi/{lat}/{lon}";
    NSString *result = VODWifi.relativePath;
    
    XCTAssertEqualObjects(expected, result, @"should return wifi/{lat}/{lon}");
}

@end
