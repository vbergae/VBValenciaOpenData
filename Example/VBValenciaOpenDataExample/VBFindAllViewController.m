//
//  VBFindAllViewController.m
//  VBValenciaOpenDataExample
//
//  Created by Víctor on 02/03/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import "VBFindAllViewController.h"
#import "VBAppDelegate.h"

@interface VBFindAllViewController ()<UITableViewDataSource>

@property NSArray *elements;
@property (readwrite, weak, nonatomic) IBOutlet UITableView *tableView;
@property (readonly) CLLocationCoordinate2D userLocation;

@end

@implementation VBFindAllViewController

- (CLLocationCoordinate2D)userLocation
{
    VBAppDelegate *app = UIApplication.sharedApplication.delegate;
    return app.userCoordinates;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIApplication.sharedApplication.networkActivityIndicatorVisible = YES;
    [VODParking findAllByCoordinates:self.userLocation
                          completion:^(NSArray *elements, 
                                       NSError *error)
    {
        NSAssert(!error, error.localizedDescription);
        UIApplication.sharedApplication.networkActivityIndicatorVisible = NO;
        [self didReceiveElements:elements];
    }];
}

- (void)didReceiveElements:(NSArray *)elements
{
    self.elements = elements;
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.elements.count ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.elements.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const Identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             Identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:Identifier];
    }
    
    VODParking *parking = self.elements[indexPath.row];
    
    cell.textLabel.text         = parking.name;
    cell.detailTextLabel.text   = [NSString stringWithFormat:@"%d",
                                   parking.availables];
    
    return cell;
}



@end
