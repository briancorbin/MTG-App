//
//  BCColorRarityFilterViewController.h
//  MTG App
//
//  Created by Brian Corbin on 6/8/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCColorRarityFilterViewController.h"

@class BCColorRarityFilterViewController;
@protocol BCColorRarityFilterViewControllerDelegate <NSObject>

-(void)passDataBack:(BCColorRarityFilterViewController *)controller didFinishWithColorFilter:(NSMutableArray *)ColorFilter AndRarityFilter:(NSMutableArray *)RarityFilter AndIndexPaths:(NSMutableArray *)IndexPaths;

@end
@interface BCColorRarityFilterViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *colorList;
@property (strong, nonatomic) NSMutableArray *rarityList;
@property (strong, nonatomic) NSMutableArray *checkedColors;
@property (strong, nonatomic) NSMutableArray *checkedRarities;
@property (strong, nonatomic) NSMutableArray *checkedIndexPaths;

- (IBAction)actionResetFilter:(id)sender;

@property (weak, nonatomic)id <BCColorRarityFilterViewControllerDelegate>delegate;

@end
