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

+ (void)findAllByType:(VODContainerType)type
          coordinates:(CLLocationCoordinate2D)coordinates
           completion:(void (^)(NSArray *, NSError *))handler
{
    NSString *typeString    = NSStringFromVODContainerType(type);
    NSString *path          = [VODContainer.relativePath
                               stringByReplacingOccurrencesOfString:@"{tipo}"
                               withString:typeString];
    
    [VODConnectionManager.defaultManager
     GET:path
     coordinates:coordinates
     completion:^(id response, NSError *error) {
         NSArray *elements = [self entitiesFromResponse:response];
         handler(elements, error);
     }];
}

+ (instancetype)entityFromResponse:(NSDictionary *)object
{
    VODContainer *entity = [super entityFromResponse:object];
    NSAssert([entity isKindOfClass:VODContainer.class],
             @"Entity not expected as %@",
             NSStringFromClass(entity.class));

    // Extracts type from the title
    static NSString * const Title = @"CONTENEDORES DE ";
    NSString *title = object[@"titulo"];
    NSString *typeString = [title substringFromIndex:Title.length];
    VODContainerType type = VODContainerTypeFromNSString(typeString.lowercaseString);
    
    entity.address  = object[@"mensaje"];
    entity.type     = type;
    
    return entity;
}

+ (NSString *)relativePath
{
    return @"contenedores/{tipo}/{lat}/{lon}";
}

@end
