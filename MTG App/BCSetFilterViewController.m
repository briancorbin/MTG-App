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
    cell.textLabel.text = tempSet.setName;
    
    if([self.checkedIndexPaths containsObject:indexPath])
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else cell.accessoryType = UITableViewCellAccessoryNone;

    return cell;
}

-(void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
    if(![self.checkedIndexPaths containsObject:indexPath])
    {
        [self.checkedIndexPaths addObject:indexPath];
        [self.checkedSetNames addObject:selectedCell.textLabel.text];
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        [self.checkedIndexPaths removeObject:indexPath];
        [self.checkedSetNames removeObject:selectedCell.textLabel.text];
        selectedCell.accessoryType = UITableViewCellAccessoryNone;
    }
    NSLog(@"%@",checkedSetNames);
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.delegate passSetFilterBack:self didFinishWithData:self.checkedSetNames And:self.checkedIndexPaths];
}
@end
