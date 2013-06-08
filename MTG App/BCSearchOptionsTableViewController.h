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

@class BCSearchOptionsTableViewController;

@protocol BCSearchOptionsTableViewControllerDelegate <NSObject>

-(void)passBackSetData:(BCSearchOptionsTableViewController *)controller didFinishWithFilter:(NSMutableArray *)Filter AndIndexPaths:(NSMutableArray *)IndexPaths;

@end

@interface BCSearchOptionsTableViewController : UITableViewController<BCSetFilterViewControllerDelegate, BCCardTypeFilterViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *setFilter;
@property (strong, nonatomic) NSMutableArray *setIndexPaths;
@property (strong, nonatomic) NSMutableArray *cardTypeFilter;
@property (strong, nonatomic) NSMutableArray *cardTypeIndexPaths;


@property (weak, nonatomic) id<BCSearchOptionsTableViewControllerDelegate>delegate;
@end
