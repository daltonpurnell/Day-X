//
//  Entry.h
//  DayX
//
//  Created by Dalton on 4/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>


// Add a static key for entry
static NSString * const keyForEntry = @"entry";

// Add a static key for title
static NSString * const keyForTitle = @"title";

// Add a static key for body text
static NSString * const keyForBodyText = @"body text";

static NSString * const allEntriesKey= @"allEntries";

static NSString *const timestampKey = @"time stamp";



@interface Entry : NSObject


@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSDate *timestamp;
@property (nonatomic, strong) NSString *entry;
@property (nonatomic, strong) NSArray *allEntries;

-(NSDictionary *)entryDictionary;

-(id)initWithDictionary:(NSDictionary *)dictionary;



@end
