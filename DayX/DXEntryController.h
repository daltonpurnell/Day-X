//
//  DXEntryController.h
//  DayX
//
//  Created by Dalton on 4/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"




@interface DXEntryController : NSObject

+ (DXEntryController *)sharedInstance;

@property (nonatomic, strong) NSArray *allEntries;

- (void)addEntry:(Entry *)entry;

- (void)removeEntry:(Entry *)entry;

- (void)replaceEntry:(Entry *)oldEntry withEntry:(Entry *)newEntry;

@end
