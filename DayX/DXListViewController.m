//
//  DXListViewController.m
//  DayX
//
//  Created by Dalton on 4/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DXListViewController.h"

@interface DXListViewController () <UITableViewDelegate>

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
    
}

@end
