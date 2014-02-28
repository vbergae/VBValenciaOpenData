//
//  VODContainerTests.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 27/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VODContainer.h"

@interface VODContainerTests : XCTestCase

@property VODContainer *container;

@end

@implementation VODContainerTests

- (void)setUp
{
    [super setUp];
    
    self.container = VODContainer.new;
}

- (void)tearDown
{
    self.container = nil;
    
    [super tearDown];
}

#pragma mark -
#pragma mark Helper functions

#pragma mark NSStringFromVODContainerType

- (void)test_NSStringFromVODContainerType
{
    VODContainerType types[] = {
        VODBatteryContainer, VODOilContainer,
        VODClothingContainer, VODWasteCotainer,
        VODPackContainer, VODCardboardContainer,
        VODGlassContainer
    };
    
    NSArray *expecteds = @[@"pilas", @"aceite", @"ropa", @"residuos",
                           @"envases", @"carton", @"vidrio"];
    
    unsigned char count = 7;
    for (unsigned char i = 0; i < count; ++i) {
        VODContainerType type = types[i];
        NSString *result = NSStringFromVODContainerType(type);
        
        XCTAssertEqualObjects(expecteds[i], result, @"should returns valid string");
    }
}

- (void)test_VODContainerTypeFromNSString
{
    VODContainerType types[] = {
        VODBatteryContainer, VODOilContainer,
        VODClothingContainer, VODWasteCotainer,
        VODPackContainer, VODCardboardContainer,
        VODGlassContainer
    };
    
    NSArray *expecteds = @[@"pilas", @"aceite", @"ropa", @"residuos",
                           @"envases", @"carton", @"vidrio"];
    
    unsigned char count = 7;
    for (unsigned char i = 0; i < count; ++i) {
        VODContainerType type = VODContainerTypeFromNSString(expecteds[i]);
        
        XCTAssertTrue(types[i] == type, @"should return valid type");
    }
}

#pragma mark -
#pragma mark Properties

- (void)test_address
{
    self.container.address = @"some address";
    XCTAssertNotNil(self.container.address, @"should set an address");
}

- (void)test_type
{
    self.container.type = VODGlassContainer;
    XCTAssertTrue(self.container.type == VODGlassContainer,
                  @"should set some type");
}

#pragma mark -
#pragma mark Class methods

- (void)test_entityFromResponse
{
    NSDictionary *object = @{
        @"latDestino": @39461416,
        @"lonDestino": @-345131,
        @"distancia": @1277,
        @"titulo": @"CONTENEDORES DE ACEITE",
        @"mensaje": @"C. Trafalgar, 34\nCMPM-TRAFALGAR 02-CM_PERSONAS MAYORES"
    };
    
    VODContainer *entity = [VODContainer entityFromResponse:object];
    XCTAssertEqualObjects(entity.address,
        @"C. Trafalgar, 34\nCMPM-TRAFALGAR 02-CM_PERSONAS MAYORES");
    XCTAssertTrue(entity.type == VODOilContainer, @"should set type from options");
}

- (void)test_relativePath
{
    NSString *expected = @"contenedores/{tipo}/{lat}/{lon}";
    NSString *result = VODContainer.relativePath;
    
    XCTAssertEqualObjects(expected, result, @"should return his path");
}

@end
