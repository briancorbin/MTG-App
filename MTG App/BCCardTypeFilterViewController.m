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
    
    BCLoadData *loadData = [[BCLoadData alloc]init];
    cardTypeList = [loadData loadCardTypeData];
    if(checkedIndexPaths == NULL)
    {
        checkedIndexPaths = [[NSMutableArray alloc]init];
    }
    if(checkedCardTypeNames == NULL)
    {
        checkedCardTypeNames = [[NSMutableArray alloc]init];
    }
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
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CardTypeCell"];
    }
    
    cell.textLabel.text = [cardTypeList objectAtIndex:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.delegate passCardTypeFilterBack:self didFinishWithData:self.checkedCardTypeNames AndWithIndexPaths:self.checkedIndexPaths];
}
@end
