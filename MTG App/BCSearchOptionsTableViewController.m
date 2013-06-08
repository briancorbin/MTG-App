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
@synthesize setFilter, setIndexPaths, cardTypeFilter, cardTypeIndexPaths;

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
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc]init];
    backBarButton.title = @"Back";
    self.navigationItem.backBarButtonItem = backBarButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        BCSetFilterViewController *newVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BCSetFilterViewController"];
        newVC.checkedSetNames = setFilter;
        newVC.checkedIndexPaths = setIndexPaths;
        newVC.delegate = self;
        [self.navigationController pushViewController:newVC animated:YES];
    }
    if(indexPath.row == 1)
    {
        BCCardTypeFilterViewController *newVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BCCardTypeFilterViewController"];
        newVC.cardTypeList = cardTypeFilter;
        newVC.checkedIndexPaths = cardTypeIndexPaths;
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
    if (self.setIndexPaths == NULL) self.setIndexPaths = [[NSMutableArray alloc]init];
    if (self.setFilter == NULL) self.setFilter = [[NSMutableArray alloc]init];
    self.setFilter = data;
    self.setIndexPaths = indexPaths;
}

-(void)passCardTypeFilterBack:(BCCardTypeFilterViewController *)controller didFinishWithData:(NSMutableArray *)data AndWithIndexPaths:(NSMutableArray *)indexPaths
{
    if(self.cardTypeIndexPaths == NULL) self.cardTypeIndexPaths = [[NSMutableArray alloc]init];
    if(self.cardTypeFilter == NULL) self.cardTypeFilter = [[NSMutableArray alloc]init];
    self.cardTypeFilter = data;
    self.cardTypeIndexPaths = indexPaths;
}

@end
