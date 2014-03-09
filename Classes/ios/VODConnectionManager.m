//
//  VODConnectionManager.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODConnectionManager.h"

NSString * const kVODBaseURLString  = @"http://mapas.valencia.es/lanzadera";
NSString * const kVODUsernameKey    = @"username";
NSString * const kVODPasswordKey    = @"password";

NSString * NSStringFromCoordinateComponent(double value)
{
    BOOL negative = value < 0 ? YES : NO;
    unsigned char const PostiveLength   = 8;
    unsigned char const NegativeLength  = 9;
    
    NSNumber *lat = @((double)(value * 1000000.));
    NSString *retVal = lat.stringValue;
    
    unsigned char padLen = retVal.length;
    if (negative && retVal.length < NegativeLength)
        padLen = NegativeLength;
    else if (!negative && retVal.length < PostiveLength)
        padLen = PostiveLength;
    
    retVal = [retVal stringByPaddingToLength:padLen
                                  withString:@"0"
                             startingAtIndex:0];
    
    return retVal;
}

static NSDictionary * LoadOptions()
{
    NSString *authorizationFilePath = nil;
    for (NSBundle *bundle in NSBundle.allBundles) {
        authorizationFilePath = [bundle pathForResource:@"Authorization"
                                                 ofType:@"plist"];
        
        if (authorizationFilePath) break;
    }
    
    return [NSDictionary dictionaryWithContentsOfFile:authorizationFilePath];
}

@interface VODConnectionManager()

@end

@implementation VODConnectionManager

#pragma mark -
#pragma mark Initialization

- (id)initWithBaseURL:(NSURL *)url options:(NSDictionary *)options
{
    NSParameterAssert(url);
    NSParameterAssert(options);
    
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = AFJSONRequestSerializer.serializer;
        
        NSString *username  = options[kVODUsernameKey];
        NSParameterAssert(username);
        NSString *password  = options[kVODPasswordKey];
        NSParameterAssert(password);
        
        [self.requestSerializer
         setAuthorizationHeaderFieldWithUsername:username
         password:password];
    }
    
    return self;
}

- (id)initWithOptions:(NSDictionary *)options
{
    NSURL *baseURL = [NSURL URLWithString:kVODBaseURLString];
    return [self initWithBaseURL:baseURL options:options];
}

#pragma mark -
#pragma mark Instance methods

- (void)GET:(NSString *)URLFormat
coordinates:(CLLocationCoordinate2D)coordinate
 completion:(void (^)(id, NSError *))handler
{
    NSString *lat = NSStringFromCoordinateComponent(coordinate.latitude);
    NSString *lon = NSStringFromCoordinateComponent(coordinate.longitude);
    
    NSString *URLString = [[URLFormat
        stringByReplacingOccurrencesOfString:@"{lat}" withString:lat]
        stringByReplacingOccurrencesOfString:@"{lon}" withString:lon];
    
    [self GET:URLString completion:handler];
}

- (void)GET:(NSString *)URLString
 completion:(void (^)(id, NSError *))handler
{
    NSParameterAssert(URLString);
    NSParameterAssert(handler);

    [self GET:URLString
   parameters:nil
      success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        handler(responseObject, nil);
    }
      failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        handler(nil, error);
    }];
}

#pragma mark -
#pragma mark Class methods

+ (instancetype)defaultManager
{
    static dispatch_once_t onceToken;
    static VODConnectionManager *defaultManager;
    dispatch_once(&onceToken, ^{
        NSURL *URL = [NSURL URLWithString:kVODBaseURLString];
        NSDictionary *options   = LoadOptions();
        defaultManager          = [[VODConnectionManager alloc]
                                   initWithBaseURL:URL
                                   options:options];
    });
    
    return defaultManager;
}

@end
