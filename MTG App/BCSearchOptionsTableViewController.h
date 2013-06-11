//
//  BCSearchOptionsTableViewController.h
//  MTG App
//
//  Created by Brian Corbin on 6/7/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCSetFilterViewController.h"
#import "BCCardTypeFilterViewController.h"
#import "BCColorRarityFilterViewController.h"

@class BCSearchOptionsTableViewController;

@protocol BCSearchOptionsTableViewControllerDelegate <NSObject>

-(void)passBackSetFilterData:(BCSearchOptionsTableViewController *)controller didFinishWithFilter:(NSMutableArray *)Filter AndIndexPaths:(NSMutableArray *)IndexPaths;
-(void)passBackCardTypeFilterData:(BCSearchOptionsTableViewController *)controller didFinishWithFilter:(NSMutableArray *)Filter AndIndexPaths:(NSMutableArray *)IndexPaths;
-(void)passBackColorRarityFilterData:(BCSearchOptionsTableViewController *)controller didFinishWithColorFilter:(NSMutableArray *)ColorFilter AndRarityFilter:(NSMutableArray *)RarityFilter AndIndexPaths:(NSMutableArray *)IndexPaths;

@end

@interface BCSearchOptionsTableViewController : UITableViewController<BCColorRarityFilterViewControllerDelegate, BCSetFilterViewControllerDelegate, BCCardTypeFilterViewControllerDelegate>

-(IBAction)actionResetFilters:(id)sender;

@property (strong, nonatomic) NSMutableArray *setFilter;
@property (strong, nonatomic) NSMutableArray *setIndexPaths;
@property (strong, nonatomic) NSMutableArray *cardTypeFilter;
@property (strong, nonatomic) NSMutableArray *cardTypeIndexPaths;
@property (strong, nonatomic) NSMutableArray *colorFilter;
@property (strong, nonatomic) NSMutableArray *multicolorFilter;
@property (strong, nonatomic) NSMutableArray *rarityFilter;
@property (strong, nonatomic) NSMutableArray *colorRarityIndexPaths;

@property (weak, nonatomic) id<BCSearchOptionsTableViewControllerDelegate>delegate;
@end
