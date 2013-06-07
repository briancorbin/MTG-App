//
//  BCSearchOptionsTableViewController.m
//  MTG App
//
//  Created by Brian Corbin on 6/7/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCSearchOptionsTableViewController.h"
#import "BCSetFilterViewController.h"

@interface BCSearchOptionsTableViewController ()

@end

@implementation BCSearchOptionsTableViewController
@synthesize setFilter, setIndexPaths;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Search Options";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BCSetFilterViewController *newVC;
    if (indexPath.row == 0) {
        newVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BCSetFilterViewController"];
        newVC.checkedSetNames = setFilter;
        newVC.checkedIndexPaths = setIndexPaths;
        newVC.delegate = self;
        [self.navigationController pushViewController:newVC animated:YES];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.delegate passBackSetData:self didFinishWithFilter:self.setFilter AndIndexPaths:self.setIndexPaths];
}

-(void)passSetFilterBack:(BCSetFilterViewController *)controller didFinishWithData:(NSMutableArray *)data And:(NSMutableArray *)indexPaths
{
    if (self.setIndexPaths == NULL) {
        self.setIndexPaths = [[NSMutableArray alloc]init];
    }
    if (self.setFilter == NULL) {
        self.setFilter = [[NSMutableArray alloc]init];
    }
    self.setFilter = data;
    self.setIndexPaths = indexPaths;
}

@end
