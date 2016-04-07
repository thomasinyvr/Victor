//
//  Show.m
//  Victor
//
//  Created by Rafael on 2016-04-04.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "Show.h"

@implementation Show

- (instancetype)initWithImage:(UIImage *)image andName:(NSString *)showName
{
    self = [super init];
    if (self) {
        _image = image;
        _showName = showName;
    }
    return self;
}

@end
