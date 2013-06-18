//
//  BCCardInfoViewController.m
//  MTG App
//
//  Created by Brian Corbin on 6/17/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCCardInfoViewController.h"

@implementation BCCardInfoViewController
@synthesize cardImageView, lblCardName, selectedCard, cardAbilityTextField, cardFlavorTextField, cardOtherInfoTextField, lblSetName, imgSetSymbol;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *strSetNameForImage = [selectedCard.set stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    strSetNameForImage = [strSetNameForImage stringByReplacingOccurrencesOfString:@":" withString:@""];
    NSString *strCardNameForImage = [selectedCard.name stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    strCardNameForImage = [strCardNameForImage stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    
    //loading image from ark42.com's database
    cardImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ark42.com/mtg/cards/%@/%@.full.jpg",strSetNameForImage, strCardNameForImage]]]];
    
    //if image is not found at ark42.com, load image from gatherer.wizards.com
    if(cardImageView.image == nil) cardImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=%@&type=card",selectedCard.imageID]]]];
    lblCardName.text = selectedCard.name;
    NSString *ability = [selectedCard.ability stringByReplacingOccurrencesOfString:@"£" withString:@"\n\n"];
    NSString *ruling = [selectedCard.ruling stringByReplacingOccurrencesOfString:@"£" withString:@"\n\n"];
    cardAbilityTextField.text = ability;
    cardFlavorTextField.text = selectedCard.flavor;
    cardOtherInfoTextField.text = ruling;
    lblSetName.text = selectedCard.set;
    
    NSString *strRarity;
    NSString *strSymbolName = [selectedCard.set stringByReplacingOccurrencesOfString:@":" withString:@""];
    if([selectedCard.rarity isEqualToString:@"C"]) strRarity = @"Common";
    if([selectedCard.rarity isEqualToString:@"U"]) strRarity = @"Uncommon";
    if([selectedCard.rarity isEqualToString:@"R"]) strRarity = @"Rare";
    if([selectedCard.rarity isEqualToString:@"M"]) strRarity = @"Mythic";
    BOOL fileCommonExists = [[NSFileManager defaultManager]fileExistsAtPath:[NSString stringWithFormat:@"/Users/Brian/Documents/iOS Apps/MTG App/MTG App/Set Symbols/Small/%@_%@.gif", selectedCard.set, strRarity]];
    if (fileCommonExists) imgSetSymbol.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_%@.gif",strSymbolName, strRarity]];
    else imgSetSymbol.image = [UIImage imageNamed:[NSString stringWithFormat:@"Custom_%@.gif", strRarity]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
