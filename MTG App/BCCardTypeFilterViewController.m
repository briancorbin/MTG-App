//
//  BCCardTypeFilterViewController.m
//  MTG App
//
//  Created by Brian Corbin on 6/8/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCCardTypeFilterViewController.h"
#import "BCLoadData.h"

@interface BCCardTypeFilterViewController ()

@end

@implementation BCCardTypeFilterViewController
@synthesize cardTypeList, checkedCardTypeNames, checkedIndexPaths;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Card Type Filter";
    
    //Create right bar button to reset filter to contain no objects
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"Reset" style:UIBarButtonItemStyleBordered target:self action:@selector(actionResetFilter:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    BCLoadData *loadData = [[BCLoadData alloc]init];
    cardTypeList = [loadData loadCardTypeData];
    if(checkedIndexPaths == NULL) checkedIndexPaths = [[NSMutableArray alloc]init];
    if(checkedCardTypeNames == NULL) checkedCardTypeNames = [[NSMutableArray alloc]init];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cardTypeList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CardTypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if(cell == nil) cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CardTypeCell"];
    
    cell.textLabel.text = [cardTypeList objectAtIndex:indexPath.row];
    
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
        [self.checkedCardTypeNames addObject:selectedCell.textLabel.text];
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        [self.checkedIndexPaths removeObject:indexPath];
        [self.checkedCardTypeNames removeObject:selectedCell.textLabel.text];
        selectedCell.accessoryType = UITableViewCellAccessoryNone;
    }

}

-(IBAction)actionResetFilter:(id)sender
{
    [self.checkedIndexPaths removeAllObjects];
    [self.checkedCardTypeNames removeAllObjects];
    [self.tableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.delegate passCardTypeFilterBack:self didFinishWithFilter:self.checkedCardTypeNames AndIndexPaths:self.checkedIndexPaths];
}
@end
