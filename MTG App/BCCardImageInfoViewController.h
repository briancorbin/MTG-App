//
//  BCCardImageInfoViewController.h
//  MTG App
//
//  Created by Brian Corbin on 6/13/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCMagicCard.h"

@interface BCCardImageInfoViewController : UIViewController

@property (strong, nonatomic) BCMagicCard *selectedCard;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UILabel *lblCardName;
@property (weak, nonatomic) IBOutlet UILabel *lblCardSet;
@property (weak, nonatomic) IBOutlet UILabel *lblCardRarity;

@end
