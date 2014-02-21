//
//  VODValenbisiParking.h
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 21/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODEntity.h"

/**
 VODValenbisiParking
 
 Concrete entity to represent Valenbisi's parking data.
 */
@interface VODValenbisiParking : VODEntity

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
