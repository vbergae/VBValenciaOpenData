//
//  VODTrafficTests.m
//  VBValenciaOpenData
//
//  Created by Víctor on 26/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VODTraffic.h"

@interface VODTrafficTests : XCTestCase

@property VODTraffic *entity;

@end

@implementation VODTrafficTests

- (void)setUp
{
    [super setUp];
    
    self.entity = VODTraffic.new;
}

- (void)tearDown
{
    self.entity = nil;
    
    [super tearDown];
}

#pragma mark -
#pragma mark Properties

- (void)test_message
{
    self.entity.message = @"Some address";
    XCTAssertNotNil(self.entity.message, @"should set an address");
}

#pragma mark -
#pragma mark Class methods

- (void)test_entitiesFromResponse
{
    NSDictionary *object = @{
        @"titulo": @"TRÁFICO",
        @"mensaje":@"PERIS Y VALERO HACIA AUSIAS MARCH (Denso)\nGASPAR AGUILAR DE SALIDA (Denso)"
    };
    
    NSArray *results = [VODTraffic entitiesFromResponse:object];
    
    XCTAssertTrue(results.count == 2,
                  @"should create two element");
}

- (void)test_entityFromResponse
{
    NSDictionary *object = @{
        @"message": @"PERIS Y VALERO HACIA AUSIAS MARCH (Denso)"
    };
    
    VODTraffic *entity = [VODTraffic entityFromResponse:object];
    XCTAssertEqualObjects(entity.message,
                          @"PERIS Y VALERO HACIA AUSIAS MARCH (Denso)",
                          @"should set name from options");
}

- (void)test_relativePath
{
    NSString *expected = @"trafico/{lat}/{lon}";
    NSString *result = VODTraffic.relativePath;
    
    XCTAssertEqualObjects(expected, result,
                          @"should return the documented path");
}

@end
