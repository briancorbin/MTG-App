//
//  BCColorRarityFilterViewController.m
//  MTG App
//
//  Created by Brian Corbin on 6/8/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCColorRarityFilterViewController.h"
#import "BCLoadData.h"

@interface BCColorRarityFilterViewController ()

@end

@implementation BCColorRarityFilterViewController
@synthesize checkedColors, checkedIndexPaths, checkedRarities, colorList, rarityList;

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
    
    self.navigationItem.title = @"Color/Rarity Filter";
    
    //Create right bar button to reset filter to contain no objects
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"Reset" style:UIBarButtonItemStyleBordered target:self action:@selector(actionResetFilter:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    BCLoadData *loadData = [[BCLoadData alloc]init];
    
    colorList = [loadData loadColorData];
    rarityList = [loadData loadRarityData];
    if(checkedIndexPaths == NULL) checkedIndexPaths = [[NSMutableArray alloc]init];
    if(checkedColors == NULL) checkedColors = [[NSMutableArray alloc]init];
    if(checkedRarities == NULL) checkedRarities = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0) return [colorList count];
    return [rarityList count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0) return @"Colors";
    return @"Rarities";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifierColor = @"ColorCell";
    static NSString *CellIdentifierRarity = @"RarityCell";
    UITableViewCell *cell;
    if(indexPath.section == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierColor forIndexPath:indexPath];
        cell.textLabel.text = [colorList objectAtIndex:indexPath.row];
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierRarity forIndexPath:indexPath];
        cell.textLabel.text = [rarityList objectAtIndex:indexPath.row];
    }
    
    if([self.checkedIndexPaths containsObject:indexPath]) cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
    if(![self.checkedIndexPaths containsObject:indexPath])
    {
        [self.checkedIndexPaths addObject:indexPath];
        if(indexPath.section == 0) [self.checkedColors addObject:selectedCell.textLabel.text];
        else [self.checkedRarities addObject:selectedCell.textLabel.text];
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        [self.checkedIndexPaths removeObject:indexPath];
        if(indexPath.section == 0) [self.checkedColors removeObject:selectedCell.textLabel.text];
        else [self.checkedRarities removeObject:selectedCell.textLabel.text];
        selectedCell.accessoryType = UITableViewCellAccessoryNone;
    }

}

-(IBAction)actionResetFilter:(id)sender
{
    [self.checkedIndexPaths removeAllObjects];
    [self.checkedColors removeAllObjects];
    [self.checkedRarities removeAllObjects];
    [self.tableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.delegate passDataBack:self didFinishWithColorFilter:checkedColors AndRarityFilter:checkedRarities AndIndexPaths:checkedIndexPaths];
}
@end
