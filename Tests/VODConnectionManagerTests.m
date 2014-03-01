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

    NSURL *URL = [NSURL URLWithString:kVODBaseURLString];
    NSDictionary *options = @{kVODUsernameKey: @"username",
                              kVODPasswordKey : @"password"};
    self.manager = [[VODConnectionManager alloc] initWithBaseURL:URL
                                                         options:options];
}

- (void)tearDown
{
    self.manager = nil;
    [super tearDown];
}

#pragma mark -
#pragma mark Helper functions

- (void)test_NSStringFromCoordinateComponent
{
    unsigned char count = 6;
    double values[]     = {
        -23.9887,
        23.9887,
        0.000001,
        32.876543,
        -32.876543,
        99.876543};
    NSArray *expecteds = @[
        @"-23988700",
        @"23988700",
        @"10000000",
        @"32876543",
        @"-32876543",
        @"99876543"
    ];
    
    for (NSUInteger i = 0; i < count; ++i) {
        double value = values[i];
        NSString *result = NSStringFromCoordinateComponent(value);
        
        XCTAssertEqualObjects(expecteds[i], result,
                              @"should generate valid string");
    }
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

- (void)test_initWithBaseURL_options_with_nil_URL
{
    XCTAssertThrows(
        [[VODConnectionManager alloc] initWithBaseURL:nil options:@{}],
        @"should raise NSInternalInconsistencyException exception"
    );
}

- (void)test_initWithBaseURL_options_with_nil_options
{
    NSURL *URL = [NSURL URLWithString:@"http://mapas.valencia.es"];
    
    XCTAssertThrows(
        [[VODConnectionManager alloc] initWithBaseURL:URL   options:nil],
        @"should raise NSInternalInconsistencyException exception"
    );
}

#pragma mark -
#pragma mark Instance methods

#pragma mark GET:coordinates:compeltion:

- (void)test_GET_coordinates_completion
{
    id manager = [OCMockObject partialMockForObject:self.manager];
    [[manager expect] GET:@"path/-12345000/99876543" completion:OCMOCK_ANY];
    
    CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(-12.345,
                                                                    99.876543);
    [manager GET:@"path/{lat}/{lon}"
     coordinates:coordinates
      completion:^(id response, NSError *error) {}];
    
    
    XCTAssertNoThrow([manager verify],
                     @"should call Get:completion:");
}

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
    id manager = [OCMockObject partialMockForObject:self.manager];
    [[manager expect] GET:@"path/23123456/-12123456"
               parameters:OCMOCK_ANY
                  success:OCMOCK_ANY
                  failure:OCMOCK_ANY];
    
    [manager GET:@"path/23123456/-12123456" completion:^(id o, NSError *e) {}];
    
    XCTAssertNoThrow([manager verify], @"should make the request");
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
