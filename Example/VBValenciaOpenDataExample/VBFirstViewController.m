//
//  VBFirstViewController.m
//  VBValenciaOpenDataExample
//
//  Created by Víctor on 02/03/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <VBValenciaOpenData/VODValencia.h>
#import "VBFirstViewController.h"

@interface VBFirstViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (readonly) NSArray *segues;

@end

@implementation VBFirstViewController

- (NSArray *)titles
{
    return @[
        @"Parking",
        @"Valenbisi - Bikes",
        @"Valenbisi - Parking",
        @"Taxi",
        @"Containers",
        @"WiFi Points",
        @"Traffic"
    ];
}

- (NSArray *)segues
{
    return @[@"VBParkingSegue"];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const Identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             Identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:Identifier];
    }
    
    cell.textLabel.text = self.titles[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row < self.segues.count) {
        NSString *segueName = self.segues[indexPath.row];
        [self performSegueWithIdentifier:segueName sender:nil];
    }
}

@end
