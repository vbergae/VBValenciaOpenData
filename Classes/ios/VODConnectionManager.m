//
//  VODConnectionManager.m
//  VBValenciaOpenData
//
//  Created by Víctor Berga on 20/02/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VODConnectionManager.h"

static NSString * const kVODBaseURLString = @"http://mapas.valencia.es/lanzadera";
NSString * const kVODUsernameKey = @"username";
NSString * const kVODPasswordKey = @"password";

NSDictionary * LoadOptions()
{
    NSString *authorizationFilePath = nil;
    for (NSBundle *bundle in NSBundle.allBundles)
    {
        authorizationFilePath = [bundle pathForResource:@"Authorization"
                                                 ofType:@"plist"];
        
        if (authorizationFilePath) break;
    }
    
    return [NSDictionary dictionaryWithContentsOfFile:authorizationFilePath];
}

@interface VODConnectionManager() {
@private
    CLLocationManager *_locationManager;
}
@property (readonly) CLLocationManager *locationManager;
@property (readwrite) CLLocation *userLocation;
@property BOOL userLocationAvailable;
@property (readonly) NSString *latitudeString;
@property (readonly) NSString *longitudeString;

@end

@implementation VODConnectionManager

#pragma mark -
#pragma mark Properties

- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = CLLocationManager.new;
        _locationManager.delegate = self;
    }
    
    return _locationManager;
}

- (NSString *)latitudeString
{
    NSNumber *lat = @((NSInteger)(self.userLocation.coordinate.latitude
                                   * 1000000));
    
    return lat.stringValue;
}


- (NSString *)longitudeString
{
    NSNumber *lon   = @((NSInteger)(self.userLocation.coordinate.longitude
                                    * 1000000));
    
    return lon.stringValue;
}

#pragma mark -
#pragma mark Initialization

- (id)initWithOptions:(NSDictionary *)options
{
    NSParameterAssert(options);
    
    NSURL *baseURL = [NSURL URLWithString:kVODBaseURLString];
    self = [super initWithBaseURL:baseURL];
    if (self) {
        self.requestSerializer = AFJSONRequestSerializer.serializer;
        
        NSString *username  = options[kVODUsernameKey];
        NSParameterAssert(username);
        NSString *password  = options[kVODPasswordKey];
        NSParameterAssert(password);
        
        [self.requestSerializer
         setAuthorizationHeaderFieldWithUsername:username
         password:password];
        
        [self.locationManager startUpdatingLocation];
    }
    
    return self;
}

#pragma mark -
#pragma mark Instance methods

- (void)GET:(NSString *)URLString
 completion:(void (^)(id, NSError *))handler
{
    NSParameterAssert(URLString);
    NSParameterAssert(handler);
    
    URLString = [URLString stringByReplacingOccurrencesOfString:@"{lon}"
                           withString:self.longitudeString];
    URLString = [URLString stringByReplacingOccurrencesOfString:@"{lat}"
                           withString:self.latitudeString];

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

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    self.userLocation = locations[locations.count - 1];
    if (self.userLocation)
        self.userLocationAvailable = YES;
    else
        self.userLocationAvailable = NO;
    
    [manager stopUpdatingLocation];
}

#pragma mark -
#pragma mark Class methods

+ (instancetype)defaultManager
{
    static dispatch_once_t onceToken;
    static VODConnectionManager *defaultManager;
    dispatch_once(&onceToken, ^{
        NSDictionary *options   = LoadOptions();
        defaultManager          = [[VODConnectionManager alloc]
                                   initWithOptions:options];
    });
    
    return defaultManager;
}

@end
