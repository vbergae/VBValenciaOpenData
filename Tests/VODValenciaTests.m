//
//  VODValenciaTests.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VODValencia.h"

@interface VODValenciaTests : XCTestCase

@end

@implementation VODValenciaTests

- (void)test_new
{
    id instance = VODValencia.new;
    XCTAssertNotNil(instance, @"should create an instance of VODValencia");
}

@end
