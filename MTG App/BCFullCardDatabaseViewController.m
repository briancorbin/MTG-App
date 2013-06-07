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
@synthesize mySearchBar, myTableView, searchingLibrary, fullLibrary, isSearching, setFilter, setIndexPaths;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	BCLoadData *loadData = [[BCLoadData alloc]init];
    fullLibrary = [loadData loadCardData];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    fullLibrary = [fullLibrary sortedArrayUsingDescriptors:sortDescriptors];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    return [fullLibrary count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CardCell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CardCell"];
    }
    
    if(isSearching)
    {
        BCMagicCard *tempMC = (BCMagicCard *)[searchingLibrary objectAtIndex:indexPath.row];
        cell.textLabel.text = tempMC.name;
    }
    else
    {
        BCMagicCard *tempMC = (BCMagicCard *)[fullLibrary objectAtIndex:indexPath.row];
        cell.textLabel.text = tempMC.name;
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSIndexPath* selection = [self.myTableView indexPathForSelectedRow];
    if(selection) [self.myTableView deselectRowAtIndexPath:selection animated:YES];
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
        for(BCMagicCard *tempMC in fullLibrary)
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
        tempMC = fullLibrary[indexPath.row];
    }
    
    BCCardImageViewController *cardImageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BCCardImageViewController"];
    
    cardImageViewController.selectedCard = tempMC;

    //Maybe use Navigation Controller to do this, if it works with the data transfer. Would be cleaner
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
    [self.navigationController pushViewController:cardImageViewController animated:YES];
    //[self presentViewController:cardImageViewController animated:YES completion:nil];
    
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
    newVC.delegate = self;
    [self.navigationController pushViewController:newVC animated:YES];
}

-(void)passBackSetData:(BCSearchOptionsTableViewController *)controller didFinishWithFilter:(NSMutableArray *)Filter AndIndexPaths:(NSMutableArray *)IndexPaths
{
    if (setFilter == NULL) {
        setFilter = [[NSMutableArray alloc]init];
    }
    if (setIndexPaths == NULL) {
        setIndexPaths = [[NSMutableArray alloc]init];
    }
    self.setFilter = Filter;
    self.setIndexPaths = IndexPaths;
}

@end
