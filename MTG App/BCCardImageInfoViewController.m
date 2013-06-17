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
@synthesize selectedCard, myImageView, lblCardName, lblCardRarity, lblCardSet;

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
    
    [myScrollView setScrollEnabled:YES];
    [myScrollView setContentSize:CGSizeMake(320, 650)];
    
    NSString *strSetNameForImage = [selectedCard.set stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    strSetNameForImage = [strSetNameForImage stringByReplacingOccurrencesOfString:@":" withString:@""];
    NSString *strCardNameForImage = [selectedCard.name stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    strCardNameForImage = [strCardNameForImage stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    
    //loading image from ark42.com's database
    myImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ark42.com/mtg/cards/%@/%@.full.jpg",strSetNameForImage, strCardNameForImage]]]];
    
    //if image is not found at ark42.com, load image from gatherer.wizards.com
    if(myImageView.image == nil) myImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=%@&type=card",selectedCard.imageID ]]]];
    
    lblCardName.text = selectedCard.name;
    lblCardSet.text = selectedCard.set;
    lblCardRarity.text = selectedCard.rarity;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
