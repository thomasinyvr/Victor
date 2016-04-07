//
//  CategoriesVC.h
//  Victor
//
//  Created by Rafael on 2016-04-06.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Show.h"

@interface CategoriesVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) Show *show;

@end
