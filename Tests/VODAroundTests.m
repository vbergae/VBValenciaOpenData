//
//  VODAroundTests.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 21/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "VODAround.h"
#import "VODConnectionManager.h"
#import "VODParking.h"
#import "VODValenbisiParking.h"
#import "VODValenbisiBike.h"
#import "VODTaxi.h"

@interface VODAroundTests : XCTestCase

@end

@implementation VODAroundTests

#pragma mark -
#pragma mark Class methods

#pragma mark findParkings:

- (void)test_findParkings_with_nil_handler
{
    XCTAssertThrows([VODAround findParkings:nil],
                    @"should throw NSInternalInconsistencyException");
}

- (void)test_findParkings
{
    id manager = [OCMockObject mockForClass:VODConnectionManager.class];
    [[[manager stub] andReturn:manager] defaultManager];
    [[manager expect] GET:VODParking.relativePath completion:OCMOCK_ANY];
    
    [VODAround findParkings:^(NSArray *elements, NSError *error) {}];
    
    XCTAssertNoThrow([manager verify], @"should use GET:completion:");
}

#pragma mark findValenbisiParkings:

- (void)test_findValenbisiParkings_with_nil_handler
{
    XCTAssertThrows([VODAround findValenbisiParkings:nil],
                    @"should throw NSInternalInconsistencyException");
}

- (void)test_findValenbisiParkings
{
    id manager = [OCMockObject mockForClass:VODConnectionManager.class];
    [[[manager stub] andReturn:manager] defaultManager];
    [[manager expect] GET:VODValenbisiParking.relativePath completion:OCMOCK_ANY];
    
    [VODAround findValenbisiParkings:^(NSArray *elements, NSError *error) {}];
    
    XCTAssertNoThrow([manager verify], @"should use GET:completion:");
}

- (void)test_findValenbisiBikes
{
    id manager = [OCMockObject mockForClass:VODConnectionManager.class];
    [[[manager stub] andReturn:manager] defaultManager];
    [[manager expect] GET:VODValenbisiBike.relativePath completion:OCMOCK_ANY];
    
    [VODAround findValenbisiBikes:^(NSArray *elements, NSError *error) {}];
    
    XCTAssertNoThrow([manager verify], @"should use GET:completion:");
}

- (void)test_findTaxis
{
    id manager = [OCMockObject mockForClass:VODConnectionManager.class];
    [[[manager stub] andReturn:manager] defaultManager];
    [[manager expect] GET:VODTaxi.relativePath completion:OCMOCK_ANY];
    
    [VODAround findTaxis:^(NSArray *elements, NSError *error) {}];
    
    XCTAssertNoThrow([manager verify], @"should use GET:completion:");
}

@end
