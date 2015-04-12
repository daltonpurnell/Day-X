//
//  DXListViewController.m
//  DayX
//
//  Created by Dalton on 4/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DXListViewController.h"
#import "DetailViewController.h"
#import "DXListDataSource.h"
#import "DXEntryController.h"

@interface DXListViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DXListDataSource *dataSource;

@end

@implementation DXListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)addEntry:(id)sender {
    [self performSegueWithIdentifier:@"rowSelected" sender:self];
}



-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // immediately deselect the cell
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *detailViewController = [DetailViewController new];
    [detailViewController updateWithEntry:[DXEntryController sharedInstance].allEntries[indexPath.row]];
     
}

@end
