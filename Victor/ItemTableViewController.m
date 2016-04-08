//
//  ItemTableViewController.m
//  Victor
//
//  Created by Thomas Friesman on 2016-04-06.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "ItemTableViewController.h"
#import "Item.h"
#import "ItemTableViewCell.h"
#import "SafariViewController.h"


@interface ItemTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *items;




@end

@implementation ItemTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *items = [NSMutableArray array];
    self.items = items;
    
    NSString *url = [NSString stringWithFormat:@"http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsAdvanced&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=ThomasFr-Victor-PRD-e3890c490-94272c2c&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD=true&keywords=%@&categoryId=%@", [self.show.showName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], self.categoryNumber ];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url relativeToURL:nil]];
    NSURLSessionDataTask * task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (!data) {
            NSLog(@"no data returned from server %@", error);
            return ;
        }
        NSError *jsonError = nil;
        NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (!jsonError && JSONDictionary) {
            
            NSArray *keywordsResponseArray = JSONDictionary[@"findItemsAdvancedResponse"];
            
            NSDictionary *firstResponse = [keywordsResponseArray firstObject];
            
            NSArray *searchResults = firstResponse[@"searchResult"];
            
            NSDictionary *searchResultIndividual = [searchResults firstObject];
            
            NSArray *items = searchResultIndividual[@"item"];
            
            for (NSDictionary *itemDictionary in items) {
                
                Item *items = [[Item alloc] initWithDictionary:itemDictionary];
                
                [self.items addObject:items];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
            
        }
        
    }];
    
    [task resume];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Item *item = self.items[indexPath.row];
    
    cell.categoryLabel.text = item.itemName;
    
    cell.Arrow3.image = nil;
    
    NSURL *url = item.itemImageUrl;
    NSURLSessionDataTask *imageTask = [[NSURLSession sharedSession]  dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        UIImage *thumbnail = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            ItemTableViewCell *innerCell = [self.tableView cellForRowAtIndexPath:indexPath];
            innerCell.Arrow3.image = thumbnail;
        });
        
    }];
    
    [imageTask resume];
    
    
    
    
    
//    UIImage *downloadedImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:item.itemImageUrl]];
//    
//    cell.Arrow3.image = downloadedImage;

    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [[cell contentView] setBackgroundColor:[UIColor clearColor]];
    [[cell backgroundView] setBackgroundColor:[UIColor clearColor]];
    [cell setBackgroundColor:[UIColor clearColor]];


    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showSafariView"]){
        
        SafariViewController *safariVC = segue.destinationViewController;
        safariVC.show = self.show;
        
        //[self.tableView indexPathForSelectedRow];
        NSIndexPath *pathSelected = [self.tableView indexPathForSelectedRow];
        
        
       // Item *item = [self.items objectAtIndex:pathSelected.row];
        
        Item *item = self.items[pathSelected.row];

        safariVC.item = item;
        

    }
    
    
}



@end
