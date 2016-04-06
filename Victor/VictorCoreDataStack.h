//
//  VictorCoreDataStack.h
//  Victor
//
//  Created by Thomas Friesman on 2016-04-06.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>



@interface VictorCoreDataStack : NSObject

@property (nonatomic) NSManagedObjectContext *context;

@end
