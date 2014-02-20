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

#pragma mark GET:completion:

- (void)test_GET_completion_with_nil_URLString
{
    XCTAssertThrows(
        [self.manager GET:nil completion:^(id o, NSError *e) {}],
        @"should raise NSInternalIncosistencyException"
    );
}

- (void)test_GET_completion_with_nil_handler
{
    XCTAssertThrows(
        [self.manager GET:@"" completion:nil],
        @"should raise NSInternalIncosistencyException"
    );
}

- (void)test_GET_completion
{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(
        23.123456, -12.123456
    );
    id userLocation = [OCMockObject mockForClass:CLLocation.class];
    [[[userLocation expect] andReturnValue:OCMOCK_VALUE(coordinate)] coordinate];
    [[[userLocation expect] andReturnValue:OCMOCK_VALUE(coordinate)] coordinate];

    id manager = [OCMockObject partialMockForObject:self.manager];
    [[[manager expect] andReturn:userLocation] userLocation];
    [[[manager expect] andReturn:userLocation] userLocation];
    [[manager expect] GET:@"path/23123456/-12123456"
               parameters:OCMOCK_ANY
                  success:OCMOCK_ANY
                  failure:OCMOCK_ANY];
    
    [manager GET:@"path/{lat}/{lon}" completion:^(id o, NSError *e) {}];
    
    XCTAssertNoThrow([userLocation verify], @"coordinates not called");
    XCTAssertNoThrow([manager verify], @"should make the request");
}

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
