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
    self.navigationItem.title = @"Set Filter";
    
    BCLoadData *loadData = [[BCLoadData alloc]init];
    setList = [loadData loadSetData];
    if (checkedIndexPaths == NULL) {
        checkedIndexPaths = [[NSMutableArray alloc]init];
    }
    blockList = [loadData loadBlockData];
    if (checkedSetNames == NULL) {
        checkedSetNames = [[NSMutableArray alloc]init];
    }
    [super viewDidLoad];
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
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SetNameCell"];
    }
    
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:indexPath.section];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"setBlock like[c] %@",sectionTitle];
    NSArray *setsInBlock = [[NSMutableArray alloc]init];
    setsInBlock = [setList filteredArrayUsingPredicate:predicate];
    
    BCSet *tempSet = [setsInBlock objectAtIndex:[indexPath row]];
    UILabel *setNameLabel = (UILabel *)[cell viewWithTag:1];
    setNameLabel.text = tempSet.setName;
    
    UIImageView *setSymbolImageView = (UIImageView *)[cell viewWithTag:2];
    
    if([self.checkedIndexPaths containsObject:indexPath]) setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_rare.gif",tempSet.setName]];//cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_common.gif",tempSet.setName]]; //cell.accessoryType = UITableViewCellAccessoryNone;

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
        setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_rare.gif",setNameLabel.text]];
        //selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        [self.checkedIndexPaths removeObject:indexPath];
        [self.checkedSetNames removeObject:setNameLabel.text];
        setSymbolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_common.gif",setNameLabel.text]];
        //selectedCell.accessoryType = UITableViewCellAccessoryNone;
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.delegate passSetFilterBack:self didFinishWithData:self.checkedSetNames And:self.checkedIndexPaths];
}
@end
