//
//  BCSearchOptionsTableViewController.m
//  MTG App
//
//  Created by Brian Corbin on 6/7/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCSearchOptionsTableViewController.h"
#import "BCSetFilterViewController.h"
#import "BCCardTypeFilterViewController.h"

@interface BCSearchOptionsTableViewController ()

@end

@implementation BCSearchOptionsTableViewController
@synthesize setFilter, setIndexPaths, cardTypeFilter, cardTypeIndexPaths, colorFilter, rarityFilter, colorRarityIndexPaths, multicolorFilter;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
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
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"Reset All" style:UIBarButtonItemStyleBordered target:self action:@selector(actionResetFilters:)];
    self.navigationItem.rightBarButtonItem = rightButton;
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
        newVC.checkedCardTypeNames = cardTypeFilter;
        newVC.checkedIndexPaths = cardTypeIndexPaths;
        newVC.delegate = self;
        [self.navigationController pushViewController:newVC animated:YES];
    }
    if(indexPath.row == 2)
    {
        BCColorRarityFilterViewController *newVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BCColorRarityFilterViewController"];
        newVC.checkedColors = colorFilter;
        newVC.checkedMulticolors = multicolorFilter;
        newVC.checkedRarities = rarityFilter;
        newVC.checkedIndexPaths = colorRarityIndexPaths;
        newVC.delegate = self;
        [self.navigationController pushViewController:newVC animated:YES];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.delegate passBackSetFilterData:self didFinishWithFilter:self.setFilter AndIndexPaths:self.setIndexPaths];
    [self.delegate passBackCardTypeFilterData:self didFinishWithFilter:self.cardTypeFilter AndIndexPaths:self.cardTypeIndexPaths];
    [self.delegate passBackColorRarityFilterData:self didFinishWithColorFilter:colorFilter AndRarityFilter:rarityFilter AndIndexPaths:colorRarityIndexPaths];
}

-(void)passSetFilterBack:(BCSetFilterViewController *)controller didFinishWithFilter:(NSMutableArray *)Filter AndIndexPaths:(NSMutableArray *)indexPaths
{
    if (self.setIndexPaths == NULL) self.setIndexPaths = [[NSMutableArray alloc]init];
    if (self.setFilter == NULL) self.setFilter = [[NSMutableArray alloc]init];
    self.setFilter = Filter;
    self.setIndexPaths = indexPaths;
}

-(void)passCardTypeFilterBack:(BCCardTypeFilterViewController *)controller didFinishWithFilter:(NSMutableArray *)Filter AndIndexPaths:(NSMutableArray *)indexPaths
{
    if(self.cardTypeIndexPaths == NULL) self.cardTypeIndexPaths = [[NSMutableArray alloc]init];
    if(self.cardTypeFilter == NULL) self.cardTypeFilter = [[NSMutableArray alloc]init];
    self.cardTypeFilter = Filter;
    self.cardTypeIndexPaths = indexPaths;
}
-(void)passDataBack:(BCColorRarityFilterViewController *)controller didFinishWithColorFilter:(NSMutableArray *)ColorFilter AndMulticolorFilter:(NSMutableArray *)MulticolorFilter AndRarityFilter:(NSMutableArray *)RarityFilter AndIndexPaths:(NSMutableArray *)IndexPaths
{
    if(self.colorRarityIndexPaths == NULL) self.colorRarityIndexPaths = [[NSMutableArray alloc]init];
    if(self.colorFilter == NULL) self.colorFilter = [[NSMutableArray alloc]init];
    if(self.multicolorFilter == NULL) self.multicolorFilter = [[NSMutableArray alloc]init];
    if(self.rarityFilter == NULL) self.rarityFilter = [[NSMutableArray alloc]init];
    self.colorRarityIndexPaths = IndexPaths;
    self.colorFilter = ColorFilter;
    self.multicolorFilter = MulticolorFilter;
    self.rarityFilter = RarityFilter;
}

-(IBAction)actionResetFilters:(id)sender
{
    self.setFilter = NULL;
    self.setIndexPaths = NULL;
    self.cardTypeFilter = NULL;
    self.cardTypeIndexPaths = NULL;
    self.colorFilter = NULL;
    self.multicolorFilter = NULL;
    self.rarityFilter = NULL;
    self.colorRarityIndexPaths = NULL;
}

@end
