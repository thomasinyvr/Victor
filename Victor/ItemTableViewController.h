//
//  ItemTableViewController.h
//  Victor
//
//  Created by Thomas Friesman on 2016-04-06.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Show.h"

@interface ItemTableViewController : UIViewController

@property (nonatomic, strong) Show *show;
@property (nonatomic, strong) NSString *categoryNumber;
@end
