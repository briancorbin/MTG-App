//
//  BCCardImageViewController.h
//  MTG App
//
//  Created by Brian Corbin on 6/7/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCMagicCard.h"

@interface BCCardImageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@property BCMagicCard *selectedCard;

@end