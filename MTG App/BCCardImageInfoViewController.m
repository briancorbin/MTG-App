//
//  BCCardImageInfoViewController.m
//  MTG App
//
//  Created by Brian Corbin on 6/13/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCCardImageInfoViewController.h"
#import "BCCardImageViewController.h"
#import "BCCardInfoViewController.h"
#import "BCMagicCard.h"

@implementation BCCardImageInfoViewController
@synthesize cardDatabase, cardIndex, cardImageVC, cardInfoVC;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *swipeScreenLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(didSwipeLeft:)];
    swipeScreenLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    UISwipeGestureRecognizer *swipeScreenRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(didSwipeRight:)];
    swipeScreenRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeScreenLeft];
    [self.view addGestureRecognizer:swipeScreenRight];
    
    cardImageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BCCardImageViewController"];
    cardImageVC.selectedCard = [cardDatabase objectAtIndex:cardIndex];
    [self.view addSubview:cardImageVC.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//Increment Card Counter and reload new View
-(void)didSwipeLeft:(UISwipeGestureRecognizer *)swipe
{
    if(self.cardIndex < self.cardDatabase.count - 1) self.cardIndex++;
    [UIView beginAnimations:@"Swipe Left" context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    [cardImageVC.view removeFromSuperview];
    cardImageVC.selectedCard = [cardDatabase objectAtIndex:self.cardIndex];
    [self.view insertSubview:cardImageVC.view atIndex:0];
    [UIView commitAnimations];
}

//Decrement Card Counter and reload new View
-(void)didSwipeRight:(UISwipeGestureRecognizer *)swipe
{
}

@end
