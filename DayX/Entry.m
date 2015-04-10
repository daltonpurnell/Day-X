//
//  Entry.m
//  DayX
//
//  Created by Dalton on 4/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

@implementation Entry


// this method converts the dictionary to a model object when bringing it out of NSUserDefaults to use it in the app (use the preset Objective-C -init Method - )
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.title = dictionary[keyForTitle];
        self.body = dictionary[keyForBodyText];
        self.entry = dictionary[keyForEntry];
    }
    return self;
}

-(NSDictionary *)dictionaryFromEntry {
    
    NSMutableDictionary *dictionaryFromEntry = [NSMutableDictionary new];
    if (self.title) {
        [dictionaryFromEntry setObject:self.title forKey:keyForTitle];
    }
    if (self.body) {
        [dictionaryFromEntry setObject:self.body forKey:keyForBodyText];
    }
    if (self.timestamp) {
        [dictionaryFromEntry setObject:self.timestamp forKey:timestampKey];
    }
    
    return dictionaryFromEntry;
}


// use these methods to convert the model object back into a dictionary so we can put it into NSUserDefaults


+ (NSMutableArray *)loadEntriesFromDefaults {
    // retrieving dictionary from nsuser defaults
    NSArray *allEntries = [[NSUserDefaults standardUserDefaults]
                        objectForKey:allEntriesKey];
    
    NSMutableArray *convertedEntries = [NSMutableArray new];
    
    // converting dictionary to model object and storing in array
    for (NSDictionary *dictionary in allEntries) {
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        
        [convertedEntries addObject:entry];
        
    }
    
    return convertedEntries;
    
}

+ (void)storeEntriesInDefaults:(NSArray *)entries {
    
    NSMutableArray *convertedEntries = [NSMutableArray new];
    
    // convert object into nsdictionary
    for (Entry *entry in entries) {
        NSDictionary *dictionary = [entry dictionaryFromEntry];
        [convertedEntries addObject:convertedEntries];
    }
    
}

@end

