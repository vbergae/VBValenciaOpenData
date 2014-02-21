//
//  VODParking.h
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODEntity.h"

/**
 VODParking
 
 Entity class which represents parking's data.
 */
@interface VODParking : VODEntity

/**
 @name Properties
 */

/**
 Parking's name
 */
@property NSString *name;

/**
 Number of available places on parking
 */
@property NSUInteger places;

@end
