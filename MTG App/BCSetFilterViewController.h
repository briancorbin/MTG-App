//
//  BCSetFilterViewController.h
//  MTG App
//
//  Created by Brian Corbin on 6/7/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCSetFilterViewController;

@protocol BCSetFilterViewControllerDelegate <NSObject>

-(void)passSetFilterBack:(BCSetFilterViewController *)controller didFinishWithFilter:(NSMutableArray *)Filter AndIndexPaths:(NSMutableArray *)indexPaths;

@end

@interface BCSetFilterViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *setList;
@property (strong, nonatomic) NSMutableArray *blockList;
@property (strong, nonatomic) NSMutableArray *checkedIndexPaths;
@property (strong, nonatomic) NSMutableArray *checkedSetNames;

- (IBAction)actionResetSetFilter:(id)sender;

@property (weak, nonatomic) id<BCSetFilterViewControllerDelegate>delegate;

@end
