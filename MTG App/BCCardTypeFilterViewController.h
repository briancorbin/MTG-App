//
//  BCCardTypeFilterViewController.h
//  MTG App
//
//  Created by Brian Corbin on 6/8/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCCardTypeFilterViewController.h"

@class BCCardTypeFilterViewController;

@protocol BCCardTypeFilterViewControllerDelegate <NSObject>

-(void)passCardTypeFilterBack:(BCCardTypeFilterViewController *)controller didFinishWithData:(NSMutableArray *)data AndWithIndexPaths:(NSMutableArray *)indexPaths;

@end
@interface BCCardTypeFilterViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *cardTypeList;
@property (strong, nonatomic) NSMutableArray *checkedCardTypeNames;
@property (strong, nonatomic) NSMutableArray *checkedIndexPaths;

@property (weak, nonatomic) id<BCCardTypeFilterViewControllerDelegate>delegate;

@end
