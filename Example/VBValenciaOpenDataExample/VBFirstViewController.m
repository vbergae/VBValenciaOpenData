//
//  VBFirstViewController.m
//  VBValenciaOpenDataExample
//
//  Created by Víctor on 02/03/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <VBValenciaOpenData/VODValencia.h>
#import "VBFirstViewController.h"

@interface VBFirstViewController ()

@end

@implementation VBFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(39.468932,
                                                              -0.374823);
    [VODParking findAllByCoordinates:coord
                          completion:^(NSArray *elements, NSError *error)
    {
        NSLog(@"elements: %@", elements);
        NSLog(@"Error: %@", error);
    }];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
