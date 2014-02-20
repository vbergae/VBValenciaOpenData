//
//  VODParkingTests.m
//  VBValenciaOpenData
//
//  Created by Víctor on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "VODParking.h"

@interface VODParkingTests : XCTestCase

@property VODParking *parking;

@end

@implementation VODParkingTests

- (void)setUp
{
    [super setUp];
    
    self.parking = VODParking.new;
}

- (void)tearDown
{
    self.parking = nil;
    [super tearDown];
}

#pragma mark -
#pragma mark Properties

- (void)test_name
{
    self.parking.name = @"parking_name";
    XCTAssertNotNil(self.parking.name, @"should set a valid string");
}

- (void)test_places
{
    self.parking.places = NSUIntegerMax;
    XCTAssertTrue(self.parking.places == NSUIntegerMax,
                  @"should set NSUIntegerMax places");
}

#pragma mark -
#pragma mark Environment

- (void)test_realtive_path
{
    NSString *expected = @"gps/aparcamientos/{lat}/{lon}";
    NSString *returned = VODParking.relativePath;
    
    XCTAssertEqualObjects(
        expected, returned,
        @"should return the path listed on the documentation"
    );
}

@end
