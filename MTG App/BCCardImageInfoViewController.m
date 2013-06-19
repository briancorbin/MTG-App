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
@synthesize selectedCard, isFlipped, cardImageVC, cardInfoVC, btnFlip;

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
    
    if(isFlipped)
    {
        [self.view addSubview:cardInfoVC.view];
        btnFlip.title = @"Less";
    }
    else
    {
        [self.view addSubview:cardImageVC.view];
        btnFlip.title = @"More";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)actionFlipImage:(id)sender
{
    if(isFlipped == NO)
    {
        isFlipped = YES;
        btnFlip.title = @"Less";
        [cardImageVC.view removeFromSuperview];
        [self.view addSubview:cardInfoVC.view];
    }
    else
    {
        isFlipped = NO;
        btnFlip.title = @"More";
        [cardInfoVC.view removeFromSuperview];
        [self.view addSubview:cardImageVC.view];
    }
}

@end









