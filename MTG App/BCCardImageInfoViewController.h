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

@end
