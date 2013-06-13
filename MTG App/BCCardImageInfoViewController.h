//
//  BCCardImageInfoViewController.h
//  MTG App
//
//  Created by Brian Corbin on 6/13/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCCardInfoViewController.h"
#import "BCCardImageViewController.h"

@interface BCCardImageInfoViewController : UIViewController
{
    BCCardImageViewController *cardImageVC;
    BCCardInfoViewController *cardInfoVC;
}

@property (nonatomic, retain) BCCardImageViewController *cardImageVC;
@property (nonatomic, retain) BCCardInfoViewController *cardInfoVC;

@property (strong, nonatomic) NSArray *cardDatabase;
@property int cardIndex;

-(void)didSwipeLeft:(UISwipeGestureRecognizer*)swipe;
-(void)didSwipeRight:(UISwipeGestureRecognizer*)swipe;

@end
