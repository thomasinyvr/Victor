//
//  MasterViewController.m
//  Victor
//
//  Created by Thomas Friesman on 2016-04-06.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "MasterViewController.h"
#import "CategoryTableViewController.h"
#import "TVShows.h"

@interface MasterViewController ()


@end

@implementation CDMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TVShows *daredevil = [[TVShows alloc]init];
    
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showCategoryTableView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        FavoriteItem *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        CategoryTableViewController *controller = (CategoryTableViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


@end
