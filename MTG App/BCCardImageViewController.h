//
//  BCCardImageViewController.h
//  MTG App
//
//  Created by Brian Corbin on 6/17/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCMagicCard.h"

@interface BCCardImageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;
@property (strong, nonatomic) BCMagicCard *selectedCard;

@end
