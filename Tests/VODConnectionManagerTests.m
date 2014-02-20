//
//  VODConnectionManagerTests.m
//  VBValenciaOpenData
//
//  Created by Víctor on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "VODConnectionManager.h"

@interface VODConnectionManagerTests : XCTestCase

@property VODConnectionManager *manager;

@end

@implementation VODConnectionManagerTests

- (void)setUp
{
    [super setUp];

    NSDictionary *options = @{kVODUsernameKey: @"username",
                              kVODPasswordKey : @"password"};
    self.manager = [[VODConnectionManager alloc] initWithOptions:options];
}

- (void)tearDown
{
    self.manager = nil;
    [super tearDown];
}

#pragma mark -
#pragma mark Properties

- (void)test_baseURL
{
    XCTAssertNotNil(self.manager.baseURL, @"should set the baseURL property");
}

- (void)test_request_serializer
{
    XCTAssertTrue([self.manager.requestSerializer
                   isKindOfClass:AFJSONRequestSerializer.class],
                  @"should be AFJSONRequestSerializer");
}

#pragma mark -
#pragma mark Initialization

- (void)test_initWithOptions_with_nil_options
{
    XCTAssertThrows(
        [[VODConnectionManager alloc] initWithOptions:nil],
        @"should raise NSInternalInconsistencyException exception"
    );
}

#pragma mark -
#pragma mark Instance methods

#pragma mark locationManager:didUpdateLocations:

- (void)test_locationManager_didUpdaLocations
{
    NSArray *locations = @[CLLocation.new];
    id manager = [OCMockObject mockForClass:CLLocationManager.class];
    [[manager expect] stopUpdatingLocation];
    
    [self.manager locationManager:manager
               didUpdateLocations:locations];
    
    XCTAssertNotNil(self.manager.userLocation,
                    @"should set current user location");
    XCTAssertNoThrow([manager verify],
                     @"should stop user location");
}

#pragma mark -
#pragma mark Class methods

- (void)test_defaultManager
{
    XCTAssertNoThrow(
        VODConnectionManager.defaultManager,
        @"should raise NSInternalInconsistencyException"
    );
}

@end
