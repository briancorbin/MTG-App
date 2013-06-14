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

@interface BCCardImageInfoViewController : UIViewController <UIScrollViewDelegate>
{
    BCCardImageViewController *cardImageVC;
    BCCardInfoViewController *cardInfoVC;
    
    UIScrollView *cardImageSV;
}

@property (nonatomic, retain) BCCardImageViewController *cardImageVC;
@property (nonatomic, retain) BCCardInfoViewController *cardInfoVC;
@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;

@property (strong, nonatomic) NSArray *cardDatabase;
@property int cardIndex;

@end
