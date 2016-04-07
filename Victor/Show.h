//
//  Show.h
//  Victor
//
//  Created by Rafael on 2016-04-04.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Show : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic) NSString *showName;


- (instancetype)initWithImage:(UIImage *)image andName:(NSString*)showName;


@end