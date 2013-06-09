//
//  BCSetFilterViewController.m
//  MTG App
//
//  Created by Brian Corbin on 6/7/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCSetFilterViewController.h"
#import "BCSet.h"
#import "BCLoadData.h"
@interface BCSetFilterViewController ()

@end

@implementation BCSetFilterViewController
@synthesize setList, blockList, checkedIndexPaths, checkedSetNames;

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
    self.navigationItem.title = @"Set Filter";
    
    BCLoadData *loadData = [[BCLoadData alloc]init];
    setList = [loadData loadSetData];
    blockList = [loadData loadBlockData];
    if (checkedIndexPaths == NULL) checkedIndexPaths = [[NSMutableArray alloc]init];
    if (checkedSetNames == NULL) checkedSetNames = [[NSMutableArray alloc]init];
    
    //Create right bar button to reset filter to contain no objects
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"Reset Filter" style:UIBarButtonItemStyleBordered target:self action:@selector(actionResetSetFilter:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [blockList count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [blockList objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"setBlock like[c] %@",sectionTitle];
    NSArray *setsInBlock = [[NSMutableArray alloc]init];
    setsInBlock = [setList filteredArrayUsingPredicate:predicate];
    return setsInBlock.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SetNameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if(cell == nil) cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SetNameCell"];
    
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:indexPath.section];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"setBlock like[c] %@",sectionTitle];
    NSArray *setsInBlock = [[NSMutableArray alloc]init];
    setsInBlock = [setList filteredArrayUsingPredicate:predicate];
    
    BCSet *tempSet = [setsInBlock objectAtIndex:[indexPath row]];
    UILabel *setNameLabel = (UILabel *)[cell viewWithTag:1];
    setNameLabel.text = tempSet.setName;
    
    UIImageView *setSymbolImageView = (UIImageView *)[cell viewWithTag:2];
    
    if([self.checkedIndexPaths containsObject:indexPath])
    {
        if([setNameLabel.text isEqualToString:@"Ravnica: City of Guilds"]) setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Ravnica City of Guilds_rare.gif" ]];
        else setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_rare.gif",setNameLabel.text]];
    }
        //setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_rare.gif",tempSet.setName]];
    else
    {
        if([setNameLabel.text isEqualToString:@"Ravnica: City of Guilds"]) setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Ravnica City of Guilds_common.gif" ]];
        else setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_common.gif",setNameLabel.text]];
    }
        //setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_common.gif",tempSet.setName]];

    return cell;
}

-(void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
    UIImageView *setSymbolImageView = (UIImageView *)[selectedCell viewWithTag:2];
    UILabel *setNameLabel = (UILabel *)[selectedCell viewWithTag:1];
    if(![self.checkedIndexPaths containsObject:indexPath])
    {
        [self.checkedIndexPaths addObject:indexPath];
        [self.checkedSetNames addObject:setNameLabel.text];
        if([setNameLabel.text isEqualToString:@"Ravnica: City of Guilds"]) setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Ravnica City of Guilds_rare.gif" ]];
        else setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_rare.gif",setNameLabel.text]];
    }
    else
    {
        [self.checkedIndexPaths removeObject:indexPath];
        [self.checkedSetNames removeObject:setNameLabel.text];
        if([setNameLabel.text isEqualToString:@"Ravnica: City of Guilds"]) setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Ravnica City of Guilds_common.gif" ]];
        else setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_common.gif",setNameLabel.text]];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.delegate passSetFilterBack:self didFinishWithFilter:self.checkedSetNames AndIndexPaths:self.checkedIndexPaths];
}

-(IBAction)actionResetSetFilter:(id)sender
{
    [self.checkedIndexPaths removeAllObjects];
    [self.checkedSetNames removeAllObjects];
    [self.tableView reloadData];
}
@end
