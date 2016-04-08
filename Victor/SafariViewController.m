//
//  SafariViewController.m
//  Victor
//
//  Created by Thomas Friesman on 2016-04-06.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "SafariViewController.h"
#import "Item.h"
#import "ItemTableViewController.h"

@interface SafariViewController ()

@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemSubtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemCurrentPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemCurrencyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;



@end



@implementation SafariViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self labelsPopulate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)safariButtonPressed:(id)sender
{
    [[UIApplication sharedApplication] openURL:self.item.viewItemUrl];
    
}

-(void)labelsPopulate {
    

    self.itemNameLabel.text = [NSString stringWithFormat:@"%@", self.item.itemName];
    self.itemSubtitleLabel.text = [NSString stringWithFormat:@"%@", self.item.itemSubtitle];
    self.itemCategoryLabel.text = [NSString stringWithFormat:@"%@", self.item.itemCategory];
    self.itemCurrentPriceLabel.text = [NSString stringWithFormat:@"%@", self.item.currentPrice];
    self.itemCurrencyLabel.text = [NSString stringWithFormat:@"%@", self.item.currentCurrency];
    
    NSLog(@"%@", self.item.itemImageUrl);
    
    UIImage *downloadedImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.item.itemImageUrl]];
    
    self.itemImageView.image = downloadedImage;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showItemTableView"]){
        
        ItemTableViewController *itemsVC = segue.destinationViewController;
        itemsVC.show = self.show;
        itemsVC.categoryNumber = sender;
        
    }
}

@end
