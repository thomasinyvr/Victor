//
//  MasterViewController.h
//  Victor
//
//  Created by Thomas Friesman on 2016-04-06.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CategoryTableViewController;

@interface MasterViewController : UIViewController

@property (nonatomic) NSArray *tvShowArray;

@property (nonatomic) CategoryTableViewController *categoryTableViewController;




@end
