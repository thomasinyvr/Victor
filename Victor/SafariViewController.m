//
//  SafariViewController.m
//  Victor
//
//  Created by Thomas Friesman on 2016-04-06.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "SafariViewController.h"

@interface SafariViewController ()

@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemSubtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemCurrentPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemCurrencyLabel;

@property (nonatomic,weak) NSString *nameString;
@property (nonatomic,weak) NSString *subtitleString;
@property (nonatomic,weak) NSString *categoryString;
@property (nonatomic,weak) NSString *

@end



@implementation SafariViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)safariButtonPressed:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.cnn.com"]];
    
}

//-(void)labelsPopulate {
//    
//    self.itemNameLabel.text = [NSString stringWithFormat:@"%@", nameLabelText];
//    
//    
//}


@end
