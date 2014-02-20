//
//  VODArondMe.h
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VODAround : NSObject

+ (void)findParkings:(void(^)(NSArray *, NSError *))handler;

@end
