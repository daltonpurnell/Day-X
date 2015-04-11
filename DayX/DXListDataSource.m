//
//  DXListDataSource.m
//  DayX
//
//  Created by Dalton on 4/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DXListDataSource.h"
#import "DXEntryController.h"

@implementation DXListDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [DXEntryController sharedInstance].allEntries.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];

    Entry *entry = [DXEntryController sharedInstance].allEntries[indexPath.row];
    cell.textLabel.text = entry.title;
    return cell;
}

@end
