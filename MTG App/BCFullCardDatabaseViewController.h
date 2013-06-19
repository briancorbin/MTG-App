//
//  BCFullCardDatabaseViewController.h
//  MTG App
//
//  Created by Brian Corbin on 6/6/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCSearchOptionsTableViewController.h"

@interface BCFullCardDatabaseViewController : UIViewController<BCSearchOptionsTableViewControllerDelegate,UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)btnSeachOptions:(id)sender;

@property (nonatomic, strong) NSArray *fullLibrary;
@property (nonatomic, strong) NSArray *filteredLibrary;
@property (nonatomic, strong) NSMutableArray *searchingLibrary;

@property (nonatomic, strong) NSMutableArray *setFilter;
@property (nonatomic, strong) NSMutableArray *setIndexPaths;
@property (nonatomic, strong) NSMutableArray *cardTypeFilter;
@property (nonatomic, strong) NSMutableArray *cardTypeIndexPaths;
@property (nonatomic, strong) NSMutableArray *colorFilter;
@property (nonatomic, strong) NSMutableArray *rarityFilter;
@property (nonatomic, strong) NSMutableArray *colorRarityIndexPaths;

@property BOOL isSearching;

@end
