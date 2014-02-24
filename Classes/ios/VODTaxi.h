//
//  VODTaxi.h
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 24/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODEntity.h"

/**
 VODTaxi
 
 Concrete class to represent taxi stops data
 */
@interface VODTaxi : VODEntity

/**
 @name Properties
 */

/**
 String representing the stop address
 */
@property NSString *address;

@end
