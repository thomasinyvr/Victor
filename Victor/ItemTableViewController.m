//
//  ItemTableViewController.m
//  Victor
//
//  Created by Thomas Friesman on 2016-04-06.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "ItemTableViewController.h"
#import "Item.h"

@interface ItemTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *items;


@end

@implementation ItemTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *items = [NSMutableArray array];
    self.items = items;
    
    NSString *url = [NSString stringWithFormat:@"http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsAdvanced&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=ThomasFr-Victor-PRD-e3890c490-94272c2c&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD=true&keywords=%@&categoryId=868", [@"Daredevil" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Item *item = self.items[indexPath.row];
    
    cell.textLabel.text = item.itemName;
    cell.detailTextLabel.text = item.itemCategoryNumber;
    
    return cell;
    
}


@end
