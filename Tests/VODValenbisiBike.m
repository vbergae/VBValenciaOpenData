//
//  VODValenbisiBike.m
//  VBValenciaOpenData
//
//  Created by Víctor on 21/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "VODValenbisiBike.h"

@interface VODValenbisiBikeTests : XCTestCase

@property VODValenbisiBike *valenbisi;

@end

@implementation VODValenbisiBikeTests

- (void)setUp
{
    [super setUp];
    
    self.valenbisi = VODValenbisiBike.new;
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
    NSString *expected = @"valenbisi/disponibles/{lat}/{lon}";
    NSString *result = VODValenbisiBike.relativePath;
    
    XCTAssertEqualObjects(expected, result, @"shoult return his relative path");
}

@end
