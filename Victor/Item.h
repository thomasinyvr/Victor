//
//  Item.h
//  Victor
//
//  Created by Thomas Friesman on 2016-04-06.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic) NSString *itemName;
@property (nonatomic) NSString *itemSubtitle;
@property (nonatomic) NSString *itemCategory;
@property (nonatomic) NSString *itemCategoryNumber;
@property (nonatomic) NSString *currentPrice;
@property (nonatomic) NSString *currentCurrency;
@property (nonatomic) NSString *itemID;
@property (nonatomic) NSURL *itemImageUrl;
@property (nonatomic) NSURL *viewItemUrl;


- (instancetype)initWithDictionary:(NSDictionary*)itemDictionary;


@end
