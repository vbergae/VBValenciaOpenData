//
//  VODContainer.m
//  VBValenciaOpenData
//
//  Created by Víctor on 26/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODContainer.h"

static NSString * const kVODBatteryString   = @"pilas";
static NSString * const kVODOilString       = @"aceite";
static NSString * const kVODClotingString   = @"ropa";
static NSString * const kVODWasteString     = @"residuos";
static NSString * const kVODPackString      = @"envases";
static NSString * const kVODCardboarString  = @"carton";
static NSString * const kVODGlassString     = @"vidrio";

NSString * NSStringFromVODContainerType(VODContainerType type)
{
    switch (type) {
        case VODBatteryContainer:
            return kVODBatteryString;
            break;
        case VODOilContainer:
            return kVODOilString;
            break;
        case VODClothingContainer:
            return kVODClotingString;
            break;
        case VODWasteCotainer:
            return kVODWasteString;
            break;
        case VODPackContainer:
            return kVODPackString;
            break;
        case VODCardboardContainer:
            return kVODCardboarString;
            break;
        case VODGlassContainer:
            return kVODGlassString;
            break;
        default:
            return nil;
            break;
    }
}

VODContainerType VODContainerTypeFromNSString(NSString *typeName)
{
    if ([typeName isEqualToString:kVODBatteryString])
        return VODBatteryContainer;
    else if ([typeName isEqualToString:kVODOilString])
        return VODOilContainer;
    else if ([typeName isEqualToString:kVODClotingString])
        return VODClothingContainer;
    else if ([typeName isEqualToString:kVODWasteString])
        return VODWasteCotainer;
    else if ([typeName isEqualToString:kVODPackString])
        return VODPackContainer;
    else if ([typeName isEqualToString:kVODCardboarString])
        return VODCardboardContainer;
    else if ([typeName isEqualToString:kVODGlassString])
        return VODGlassContainer;
    else
        return UCHAR_MAX;
}

@implementation VODContainer

#pragma mark -
#pragma mark Class methods

+ (NSString *)relativePath
{
    return @"contenedores/{tipo}/{lat}/{lon}";
}

@end
