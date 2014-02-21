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
#pragma mark Class methods

#pragma mark relativePath

- (void)test_relativePath
{
    NSString *expected = @"valenbisi/libres/{lat}/{lon}";
    NSString *result = VODValenbisiParking.relativePath;
    
    XCTAssertEqualObjects(expected, result, @"shoult return his relative path");
}

@end
