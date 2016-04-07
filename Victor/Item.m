//
//  Item.m
//  Victor
//
//  Created by Thomas Friesman on 2016-04-06.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "Item.h"

@implementation Item


- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary*)itemDictionary
{
    self = [super init];
    if (self) {
        
        
        //isolate Item name
        
        _itemName = [itemDictionary [@"title"] firstObject];
        
        
        //isolate item subtitle/description
        
        _itemSubtitle = [itemDictionary [@"subtitle"] firstObject];
        
        
        
        //isolate Item category = TVShow
        
        NSArray *primaryCategories = itemDictionary[@"primaryCategory"];
        
        NSDictionary *categoryNames = [primaryCategories firstObject];
        
        NSArray *itemNames = [categoryNames objectForKey:@"categoryName"];
        
        NSString *specificItemNames = [itemNames firstObject];
        
        _itemCategory = specificItemNames;
        
        
        
        NSArray *itemNumbersArray = [categoryNames objectForKey:@"categoryId"];
        
        _itemCategoryNumber = [itemNumbersArray firstObject];
        
        
        
        // isolate current selling price
        
        NSArray *sellingStats = itemDictionary[@"sellingStatus"];
        
        NSDictionary *convertedCurrentPrice = [sellingStats firstObject];
        
        NSArray *currentSellingPrice = [convertedCurrentPrice objectForKey:@"convertedCurrentPrice"];
        
        NSDictionary *currentSalePriceCurrency = [currentSellingPrice firstObject];
        
        NSString *currentSalePrice = [currentSalePriceCurrency objectForKey:@"__value__"];
        
        _currentPrice = currentSalePrice;
        
        
        
        //isolate current price currency
        
        NSArray *sellingStatistics = itemDictionary[@"sellingStatus"];
        
        NSDictionary *convertedCurrency = [sellingStatistics firstObject];
        
        NSArray *currencySellingPrice = [convertedCurrency objectForKey:@"convertedCurrentPrice"];
        
        NSDictionary *salePriceCurrency = [currencySellingPrice firstObject];
        
        NSString *currencySalePriceString = [salePriceCurrency objectForKey:@"@currencyId"];
        
        _currentCurrency = currencySalePriceString;
        
        
        
        //isolate Item ID number
        
        NSArray *itemIDNumber = itemDictionary[@"itemId"];
        
        NSString *specificItemId = [itemIDNumber firstObject];
        
        _itemID = specificItemId;
        
        
        
        // isolate Item Image URL
        
        NSArray *galleryUrls = itemDictionary[@"galleryURL"];
        
        NSString *itemImageUrlString = [galleryUrls firstObject];
        
        NSURL *itemImageUrl = [NSURL URLWithString:itemImageUrlString];
        
        _itemImageUrl = itemImageUrl;
        
        
        
        //isolate Item View URL - i think to link to ebay site when BUY button is pushed
        
        NSArray *viewItemsURLS = itemDictionary[@"viewItemURL"];
        
        NSString *viewItemsURLString = [viewItemsURLS firstObject];
        
        NSURL *viewItemURL = [NSURL URLWithString:viewItemsURLString];
        
        _viewItemUrl = viewItemURL;
        
    }
    return self;
}


@end
