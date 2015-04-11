//
//  Entry.m
//  DayX
//
//  Created by Christopher Hoffmann on 4/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

static NSString * const EntriesKey = @"entrykey";

@implementation Entry

//This method is used to take a dictionary and turn it into an entry object so the app can use it
- (id)initWithDictionary: (NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[TitleKey];
        self.body = dictionary[BodyKey];
        self.timeStamp = dictionary[TimeKey];

    }
    return self;
}

-(NSDictionary *)entryDictionary {
    
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    if (self.title != nil) {
        [entryDictionary setObject:self.title forKey:TitleKey];
    }
    if (self.body != nil) {
        [entryDictionary setObject:self.body forKey:BodyKey];
    }
    if (self.timeStamp != nil) {
        [entryDictionary setObject:self.timeStamp forKey:TimeKey];
    }
    
    return entryDictionary;
    
}

+ (NSMutableArray *)loadEntriesFromDefaults {
    
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    NSMutableArray *entries = [NSMutableArray new];
    
    for (NSDictionary *entryDictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary:entryDictionary];
        [entries addObject:entry];
    }
    return entries;
    
}

+ (void)storeEntriesInDefaults:(NSArray *)entries {
    NSMutableArray *arrayOfEntriesDictionaries = [NSMutableArray new];
    
    for (Entry *entry in entries) {
        [arrayOfEntriesDictionaries addObject:[entry entryDictionary]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:arrayOfEntriesDictionaries forKey:EntriesKey];
}




@end
