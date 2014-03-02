//
//  VBFindAllViewController.h
//  VBValenciaOpenDataExample
//
//  Created by Víctor on 02/03/14.
//  Copyright (c) 2014 VictorBerga.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBFindAllViewController : UIViewController

@property (readonly, weak, nonatomic) UITableView *tableView;

- (void)didReceiveElements:(NSArray *)elements;

@end
