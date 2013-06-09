//
//  BCFullCardDatabaseViewController.m
//  MTG App
//
//  Created by Brian Corbin on 6/6/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCFullCardDatabaseViewController.h"
#import "BCMagicCard.h"
#import "BCSet.h"
#import "BCLoadData.h"
#import "BCCardImageViewController.h"
#import "BCSearchOptionsTableViewController.h"

@interface BCFullCardDatabaseViewController ()

@end

@implementation BCFullCardDatabaseViewController
@synthesize mySearchBar, myTableView, searchingLibrary, fullLibrary, isSearching, setFilter, setIndexPaths, filteredLibrary, cardTypeIndexPaths, cardTypeFilter;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
	BCLoadData *loadData = [[BCLoadData alloc]init];
    [loadData loadNewFormatTest];
    fullLibrary = [loadData loadCardData];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    fullLibrary = [fullLibrary sortedArrayUsingDescriptors:sortDescriptors];
    filteredLibrary = fullLibrary;
}

#pragma mark-TableViewCode
//-----------------------------------------------------------
//----------------------TableViewCode------------------------
//-----------------------------------------------------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(isSearching) return [searchingLibrary count];
    return [filteredLibrary count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CardCell"];
    UILabel *labelCardName =(UILabel *)[cell viewWithTag:1];
    UILabel *labelCardType =(UILabel *)[cell viewWithTag:2];
    UIImageView *imageViewSet =(UIImageView *)[cell viewWithTag:3];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CardCell"];
    }
    
    if(isSearching)
    {
        BCMagicCard *tempMC = (BCMagicCard *)[searchingLibrary objectAtIndex:indexPath.row];
        labelCardName.text = tempMC.name;
        labelCardType.text = tempMC.type;
        imageViewSet.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_%@.gif",tempMC.set, tempMC.rarity]];
    }
    else
    {
        BCMagicCard *tempMC = (BCMagicCard *)[filteredLibrary objectAtIndex:indexPath.row];
        labelCardName.text = tempMC.name;
        labelCardType.text = tempMC.type;
        imageViewSet.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@_%@.gif",tempMC.set, tempMC.rarity]];
    }
    
    return cell;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSIndexPath* selection = [self.myTableView indexPathForSelectedRow];
    if(selection) [self.myTableView deselectRowAtIndexPath:selection animated:YES];
    //-----------------------------------
    filteredLibrary = fullLibrary; //resets the filteredLibrary to contain all cards before filtering again
    NSPredicate *predicate;
    NSString *strPredicate;
    //Fitlers out selected sets first
    for (int i = 0; i<setFilter.count; i++)
    {
        if(i==0) strPredicate = [NSString stringWithFormat:@"set like[c] '%@'",[setFilter objectAtIndex:i]];
        else strPredicate = [strPredicate stringByAppendingString:[NSString stringWithFormat:@" OR set like[c] '%@'", [setFilter objectAtIndex:i]]];
    }
    if (strPredicate != nil) {
        predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"%@", strPredicate]];
        filteredLibrary = [filteredLibrary filteredArrayUsingPredicate:predicate];
    }
    //then filters out selected card Types
    for(int i=0; i<cardTypeFilter.count;i++)
    {
        if(i==0) strPredicate = [NSString stringWithFormat:@"type CONTAINS[c] '%@'", [cardTypeFilter objectAtIndex:i]];
        else strPredicate = [strPredicate stringByAppendingString:[NSString stringWithFormat:@" OR type CONTAINS[c] '%@'", [cardTypeFilter objectAtIndex:i]]];
    }
    if (strPredicate != nil) {
        predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"%@", strPredicate]];
        filteredLibrary = [filteredLibrary filteredArrayUsingPredicate:predicate];
    }
    [myTableView reloadData];
}

#pragma mark-SearchBarCode
//-----------------------------------------------------------
//----------------------SearchBarCode------------------------
//-----------------------------------------------------------
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length == 0)
    {
        isSearching = NO;
    }
    else
    {
        isSearching = YES;
        searchingLibrary = [[NSMutableArray alloc]init];
        for(BCMagicCard *tempMC in filteredLibrary)
        {
            NSRange MCNameRange = [tempMC.name rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(MCNameRange.location != NSNotFound)
            {
                [searchingLibrary addObject:tempMC];
            }
        }
    }
    [myTableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [mySearchBar resignFirstResponder];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [mySearchBar resignFirstResponder];
}

#pragma mark-PassRowDataToBCImageView
//-----------------------------------------------------------
//----------------------PassDataToBCImageView----------------
//-----------------------------------------------------------

-(NSIndexPath *)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BCMagicCard *tempMC = [[BCMagicCard alloc]init];
    if(isSearching)
    {
        tempMC = searchingLibrary[indexPath.row];
    }
    else
    {
        tempMC = filteredLibrary[indexPath.row];
    }
    
    BCCardImageViewController *cardImageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BCCardImageViewController"];
    
    cardImageViewController.selectedCard = tempMC;
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    [self.navigationController pushViewController:cardImageViewController animated:YES];
        
    return indexPath;
}


#pragma mark-PassFilterDataToSearchOptions
//-----------------------------------------------------------
//----------------------SearchOptions------------------------
//-----------------------------------------------------------

- (IBAction)btnSeachOptions:(id)sender
{
    BCSearchOptionsTableViewController *newVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BCSearchOptionsTableViewController"];
    newVC.setFilter = self.setFilter;
    newVC.setIndexPaths = self.setIndexPaths;
    newVC.cardTypeFilter = self.cardTypeFilter;
    newVC.cardTypeIndexPaths = self.cardTypeIndexPaths;
    newVC.delegate = self;
    [self.navigationController pushViewController:newVC animated:YES];
}

//Passing data between view controllers

-(void)passBackSetFilterData:(BCSearchOptionsTableViewController *)controller didFinishWithFilter:(NSMutableArray *)Filter AndIndexPaths:(NSMutableArray *)IndexPaths
{
    if (setFilter == NULL) setFilter = [[NSMutableArray alloc]init];
    if (setIndexPaths == NULL) setIndexPaths = [[NSMutableArray alloc]init];
    self.setFilter = Filter;
    self.setIndexPaths = IndexPaths;
}

-(void)passBackCardTypeFilterData:(BCSearchOptionsTableViewController *)controller didFinishWithFilter:(NSMutableArray *)Filter AndIndexPaths:(NSMutableArray *)IndexPaths
{
    if(cardTypeFilter == NULL) cardTypeFilter = [[NSMutableArray alloc]init];
    if(cardTypeIndexPaths == NULL) cardTypeIndexPaths = [[NSMutableArray alloc]init];
    self.cardTypeFilter = Filter;
    self.cardTypeIndexPaths = IndexPaths;
}

@end
