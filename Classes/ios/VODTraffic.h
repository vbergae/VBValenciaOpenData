//
//  VODTraffic.h
//  VBValenciaOpenData
//
//  Created by Víctor on 26/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODEntity.h"

/**
 VODTraffic
 
 Concrete class to represent traffic status
 */
@interface VODTraffic : VODEntity

/**
 @name Properties
 */

/**
 Traffic message
 */
@property NSString *message;

@end
