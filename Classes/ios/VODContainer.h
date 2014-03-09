//
//  VODContainer.h
//  VBValenciaOpenData
//
//  Created by Víctor on 26/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODEntity.h"

/**
 @name Types and helper functions
 */

/**
 Opaque type to represent the different containers' types provided by
 the service.
 */
typedef NS_ENUM(unsigned char, VODContainerType) {
    VODBatteryContainer,
    VODOilContainer,
    VODClothingContainer,
    VODWasteCotainer,
    VODPackContainer,
    VODCardboardContainer,
    VODGlassContainer
};

/**
 Transforms the given type in a valid string for the service
 
 @param type Container type
 @return String representing the type (get string types from the official
 documentation)
 */
NSString * NSStringFromVODContainerType(VODContainerType type);

/**
 Transforms the given string in a valid VODContainerType
 
 @param typeName String representing the type
 @return Valid VODContainerType value
 */
VODContainerType VODContainerTypeFromNSString(NSString *typeName);

/**
 VODContainer
 
 Concrete class to represent garbage containers near the user
 */
@interface VODContainer : VODEntity

/**
 @name Properties
 */

/**
 Addres where the container lives
 */
@property NSString *address;

/**
 Type of container @see VODContainerType
 */
@property VODContainerType type;

/**
 @name Make Requests
 */

/**
 Finds elements near the given coordinates filtered by VODContainerType
 
 @param type One of VODContainerType values
 @param coordinates Coordinates used as reference
 @param handler Completion handler
 */
+ (void)findAllByType:(VODContainerType)type
          coordinates:(CLLocationCoordinate2D)coordinates
           completion:(void(^)(NSArray *elements, NSError *error))handler;

@end
