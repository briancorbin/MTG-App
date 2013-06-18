//
//  BCCardImageInfoViewController.m
//  MTG App
//
//  Created by Brian Corbin on 6/13/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCCardImageInfoViewController.h"
#import "BCMagicCard.h"

@implementation BCCardImageInfoViewController
@synthesize selectedCard, isFlipped, cardImageVC, cardInfoVC;

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
    isFlipped = NO;
    
    cardImageVC= [self.storyboard instantiateViewControllerWithIdentifier:@"BCCardImageViewController"];
    cardInfoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BCCardInfoViewController"];
    cardImageVC.selectedCard = self.selectedCard;
    cardInfoVC.selectedCard = self.selectedCard;
    
    if(isFlipped) [self.view addSubview:cardInfoVC.view];
    else [self.view addSubview:cardImageVC.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)actionFlipImage:(id)sender
{
    [UIView beginAnimations:@"Flip" context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    if(isFlipped == NO)
    {
        isFlipped = YES;
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:cardImageVC.view cache:YES];
        [cardInfoVC viewWillAppear:YES];
        [cardImageVC viewWillDisappear:YES];
        [cardImageVC.view removeFromSuperview];
        [self.view addSubview:cardInfoVC.view];
        [cardImageVC viewDidDisappear:YES];
        [cardInfoVC viewDidAppear:YES];
    }
    else
    {
        isFlipped = NO;
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:cardInfoVC.view cache:YES];
        [cardImageVC viewWillAppear:YES];
        [cardInfoVC viewWillDisappear:YES];
        [cardInfoVC.view removeFromSuperview];
        [self.view addSubview:cardImageVC.view];
        [cardInfoVC viewDidDisappear:YES];
        [cardImageVC viewDidAppear:YES];
    }
    
    [UIView commitAnimations];
    
}

@end









