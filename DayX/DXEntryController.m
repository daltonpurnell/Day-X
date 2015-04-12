//
//  DXEntryController.m
//  DayX
//
//  Created by Dalton on 4/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DXEntryController.h"


@implementation DXEntryController




// This goes in the implementation file
+ (DXEntryController *)sharedInstance {
    
    // create an instance of CurrentUser and set it to nil (only gets created once)
    static DXEntryController *sharedInstance = nil;
    
    // Never create that token again
    static dispatch_once_t onceToken;
    
    // create this line of code only once
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DXEntryController alloc] init];
        
        [sharedInstance loadEntriesFromDefaults];
        
    });
    
    // next time we call this method, this is the only code that will do anything
    return sharedInstance;
}





- (void)loadEntriesFromDefaults {
    // retrieving dictionary from nsuser defaults
    NSArray *allEntries = [[NSUserDefaults standardUserDefaults]
                           objectForKey:allEntriesKey];
    
    NSMutableArray *convertedEntries = [NSMutableArray new];
    
    // converting dictionary to model object and storing in array
    for (NSDictionary *dictionary in allEntries) {
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        
        [convertedEntries addObject:entry];
        
    }
    
    self.allEntries = convertedEntries;
    
}





// Create a mutable version of the controller's entries array, add the entry that's passed in, and then re-set the controller's Entries array

- (void)addEntry:(Entry *)entry

{
    
    NSMutableArray *mutableEntries = [[NSMutableArray alloc] initWithArray:self.allEntries];
    
    self.allEntries = mutableEntries;
    
    [self synchronize];
    
}





// needs to do the reverse. It should create a mutable copy of the entries array, remove the entry that was passed in, and then re-set the controllers Entries array.
- (void)removeEntry:(Entry *)entry

{
    
    NSMutableArray *mutableEntries = self.allEntries.mutableCopy;
    
    [mutableEntries removeObject:entry];
    
}






// create a mutable copy of the entries array, check to see if it contains oldEntry, and then if it does find the index and replace object at index.
- (void)replaceEntry:(Entry *)oldEntry withEntry:(Entry *)newEntry
{
    
    if (!oldEntry) {
        return;
    }
    
    NSMutableArray *mutableEntries = self.allEntries.mutableCopy;
    
    if ([mutableEntries containsObject:oldEntry]) {
    
    NSInteger index = [mutableEntries indexOfObject:oldEntry];
    [mutableEntries replaceObjectAtIndex:index withObject:newEntry];
    
    }
    
}





- (void)synchronize {
    
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.allEntries) {
        [entryDictionaries addObject:[entry entryDictionary]];
    }
}




@end
