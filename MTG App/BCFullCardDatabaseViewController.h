//
//  BCFullCardDatabaseViewController.h
//  MTG App
//
//  Created by Brian Corbin on 6/6/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCFullCardDatabaseViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
- (IBAction)btnSeachOptions:(id)sender;

@property (nonatomic, strong) NSArray *fullLibrary;
@property (nonatomic, strong) NSMutableArray *searchingLibrary;
@property BOOL isSearching;
@end
