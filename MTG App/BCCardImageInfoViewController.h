//
//  BCCardImageInfoViewController.h
//  MTG App
//
//  Created by Brian Corbin on 6/13/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCMagicCard.h"
#import "BCCardInfoViewController.h"
#import "BCCardImageViewController.h"

@interface BCCardImageInfoViewController : UIViewController
{
    BCCardImageViewController *cardImageVC;
    BCCardInfoViewController *cardInfoVC;
}

@property (strong, nonatomic) BCCardImageViewController *cardImageVC;
@property (strong, nonatomic) BCCardInfoViewController *cardInfoVC;

- (IBAction)actionFlipImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnFlip;

@property (strong, nonatomic) BCMagicCard *selectedCard;
@property BOOL isFlipped;

@end
