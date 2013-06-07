//
//  BCSearchOptionsTableViewController.h
//  MTG App
//
//  Created by Brian Corbin on 6/7/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCSetFilterViewController.h"

@class BCSearchOptionsTableViewController;

@protocol BCSearchOptionsTableViewControllerDelegate <NSObject>

-(void)passBackSetData:(BCSearchOptionsTableViewController *)controller didFinishWithFilter:(NSMutableArray *)Filter AndIndexPaths:(NSMutableArray *)IndexPaths;

@end

@interface BCSearchOptionsTableViewController : UITableViewController<BCSetFilterViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *setFilter;
@property (strong, nonatomic) NSMutableArray *setIndexPaths;
@property (strong, nonatomic) NSMutableArray *editionFilter;
@property (strong, nonatomic) NSMutableArray *colorFilter;
@property (strong, nonatomic) NSMutableArray *rarityFilter;


@property (weak, nonatomic) id<BCSearchOptionsTableViewControllerDelegate>delegate;
@end
