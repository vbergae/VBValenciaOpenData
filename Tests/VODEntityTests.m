//
//  VODEntityTests.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 21/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "VODEntity.h"

@interface VODEntityTests : XCTestCase

@property VODEntity *entity;

@end

@implementation VODEntityTests

- (void)setUp
{
    [super setUp];
    
    self.entity = VODEntity.new;
}

- (void)tearDown
{
    self.entity = nil;
    
    [super tearDown];
}

#pragma mark -
#pragma mark Properties

- (void)test_coordinates
{
    self.entity.coordinates = CLLocationCoordinate2DMake(34.23, -34.98);
    XCTAssertTrue(self.entity.coordinates.latitude != 0
                  && self.entity.coordinates.longitude != 0,
                  @"should set coordinates");
}

- (void)test_distance
{
    self.entity.distance = NSUIntegerMax;
    XCTAssertTrue(self.entity.distance != 0,
                  @"should set adistance");
}

#pragma mark -
#pragma mark Class methods

#pragma mark findAllByCoordinates:completion:

- (void)test_findAllByCoordinates_completion
{
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(0.234, 32.834);
    
    id manager = [OCMockObject mockForClass:VODConnectionManager.class];
    [[[manager stub] andReturn:manager] defaultManager];
    [[manager expect]
     GET:OCMOCK_ANY
     coordinates:coord
     completion:OCMOCK_ANY];
    
    [VODEntity findAllByCoordinates:coord
                         completion:^(NSArray *elements,
                                      NSError *error) {}];
    
    XCTAssertNoThrow([manager verify], @"should call GET:coordinate:handler");
}

#pragma mark - entitiesFromResponse:

- (void)test_entitiesFromResponse_with_nil_response
{
    XCTAssertThrows([VODEntity entitiesFromResponse:nil],
                    @"should raise NSInternalInconsistencyException");
}

- (void)test_entitiesFromResponse
{
    NSDictionary *object = @{
        @"latDestino"   : @(39471796),
        @"lonDestino"   : @(-36815300),
        @"distancia"    : @(2186),
        @"titulo"       : @"APARCAMIENTOS",
        @"mensaje"      : @"PORTAL DE LA MAR\nPlazas: 87"
    };
    
    NSArray *response = @[object];
    NSArray *results = [VODEntity entitiesFromResponse:response];
    
    XCTAssertTrue(results.count == 1,
                  @"should create one element");
}

- (void)test_entityFromResponse_with_nil_object
{
    XCTAssertThrows([VODEntity entityFromResponse:nil],
                    @"should raise NSInternalInconsistencyException");
}

- (void)test_entityFromResponse
{
    NSDictionary *object = @{
        @"latDestino"   : @(39471796),
        @"lonDestino"   : @(-36815300),
        @"distancia"    : @(2186),
        @"titulo"       : @"APARCAMIENTOS",
        @"mensaje"      : @"PORTAL DE LA MAR\nPlazas: 87"
    };
    
    VODEntity *entity = [VODEntity entityFromResponse:object];
    
    XCTAssertTrue(entity.coordinates.latitude == 39.471796,
                  @"should set latitude from object");
    XCTAssertTrue(entity.coordinates.longitude == -36.8153,
                  @"should set longitude from object");
    XCTAssertTrue(entity.distance == 2186,
                  @"should set distance from object");
}

- (void)test_relativePath
{
    XCTAssertNil(VODEntity.relativePath,
                 @"should return nil because VODEntity is an abstract class");
}

@end
