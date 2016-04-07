//
//  CategoriesVC.m
//  Victor
//
//  Created by Rafael on 2016-04-06.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "CategoriesVC.h"
#import "Category.h"
#import "CategoriesTVCell.h"
#import "ItemTableViewController.h"


@interface CategoriesVC ()

@property NSMutableArray *categories;


@end

@implementation CategoriesVC
- (IBAction)testButtonCode:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"showItemTableView" sender:self];
}
- (IBAction)showActionFigures:(id)sender {
    
    [self performSegueWithIdentifier:@"showItemTableView" sender:@"158671"];
    
}
- (IBAction)showCollectibles:(id)sender {
    
    [self performSegueWithIdentifier:@"showItemTableView" sender:@"1424"];
}
- (IBAction)showComicBooks:(id)sender {
    
    [self performSegueWithIdentifier:@"showItemTableView" sender:@"900"];
}
- (IBAction)showDVDBluRay:(id)sender {
    
    [self performSegueWithIdentifier:@"showItemTableView" sender:@"617"];
}
- (IBAction)showSoundtrack:(id)sender {
    
    [self performSegueWithIdentifier:@"showItemTableView" sender:@"176984"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CategoriesTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoriesTVCell" forIndexPath:indexPath];
    
    Category *category = self.categories[indexPath.row];
    
    cell.categoryLabel.text = category.title;
    
    return cell;
    

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.categories removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        // [tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showItemTableView"]){
        
        ItemTableViewController *itemsVC = segue.destinationViewController;
        itemsVC.show = self.show;
        itemsVC.categoryNumber = sender;
        
    }
    
    
}




@end
