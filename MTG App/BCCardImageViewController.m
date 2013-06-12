//
//  BCCardImageViewController.m
//  MTG App
//
//  Created by Brian Corbin on 6/7/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCCardImageViewController.h"
#import "BCCardInfoViewController.h"

@implementation BCCardImageViewController

@synthesize selectedCard, myImageView, myVCTitle;

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
    self.navigationItem.title = selectedCard.name;
    
    //myImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=%@&type=card",selectedCard.imageID ]]]];
    NSString *strSetNameForImage = [selectedCard.set stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    strSetNameForImage = [strSetNameForImage stringByReplacingOccurrencesOfString:@":" withString:@""];
    NSString *strCardNameForImage = [selectedCard.name stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    strCardNameForImage = [strCardNameForImage stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    myImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ark42.com/mtg/cards/%@/%@.full.jpg",strSetNameForImage, strCardNameForImage]]]];
    
    //add tap gesture recognizer when image is tapped
    myImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionFlipImage:)];
    [myImageView addGestureRecognizer:tapImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)btnBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)actionFlipImage:(id)sender
{
    BCCardInfoViewController *newVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BCCardInfoViewController"];
    
    [UIView beginAnimations:@"animation" context:nil];
    [self.navigationController pushViewController:newVC animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    [UIView setAnimationDuration:0.7];
    [UIView commitAnimations];
}
@end
