//
//  SafariViewController.h
//  Victor
//
//  Created by Thomas Friesman on 2016-04-06.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Show.h"
#import "Item.h"

@interface SafariViewController : UIViewController

-(IBAction)safariButtonPressed:(id)sender;

@property (nonatomic, strong) Show *show;
@property (nonatomic, strong) Item *item;


@end
