//
//  Entry.h
//  DayX
//
//  Created by Christopher Hoffmann on 4/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailViewController.h"

//Add static keys for the dictionary
static NSString * const TitleKey = @"title";
static NSString * const BodyKey = @"body text";
static NSString * const  TimeKey = @"timestamp";

@interface Entry : NSObject


@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSDate *timeStamp;

-(NSDictionary *) entryDictionary; 
    

-(id)initWithDictionary:(NSDictionary *)dictionary;


+ (NSMutableArray *)loadEntriesFromDefaults;

+ (void)storeEntriesInDefaults:(NSArray *)entries;

@end
