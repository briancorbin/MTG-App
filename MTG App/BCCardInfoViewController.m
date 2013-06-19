//
//  BCCardInfoViewController.m
//  MTG App
//
//  Created by Brian Corbin on 6/17/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCCardInfoViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation BCCardInfoViewController
@synthesize cardImageView, lblCardName, selectedCard, cardInfoTextField, lblSetName, imgSetSymbol, cardInfoSegmentController, lblCardType, lblPTorL;

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
    
    cardInfoTextField.layer.cornerRadius = 10.0f;
    NSString *ability = [selectedCard.ability stringByReplacingOccurrencesOfString:@"£" withString:@"\n"];
    cardInfoTextField.text = ability;

    NSString *PT;
    if([selectedCard.p isEqualToString:@""]) PT = @"";
    else PT = [NSString stringWithFormat:@"%@/%@", selectedCard.p, selectedCard.t];
    
    lblCardName.text = selectedCard.name;
    lblCardType.text = selectedCard.type;
    if([selectedCard.loyalty isEqualToString:@""]) lblPTorL.text = PT;
    else lblPTorL.text = selectedCard.loyalty;
    NSString *strRarity;
    NSString *strSymbolName = [selectedCard.set stringByReplacingOccurrencesOfString:@":" withString:@""];
    if([selectedCard.rarity isEqualToString:@"C"]) strRarity = @"Common";
    if([selectedCard.rarity isEqualToString:@"U"]) strRarity = @"Uncommon";
    if([selectedCard.rarity isEqualToString:@"R"]) strRarity = @"Rare";
    if([selectedCard.rarity isEqualToString:@"M"]) strRarity = @"Mythic";
    BOOL fileCommonExists = [[NSFileManager defaultManager]fileExistsAtPath:[NSString stringWithFormat:@"/Users/Brian/Documents/iOS Apps/MTG App/MTG App/Set Symbols/Small/%@_%@.gif", strSymbolName, strRarity]];
    if (fileCommonExists) imgSetSymbol.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_%@.gif",strSymbolName, strRarity]];
    else imgSetSymbol.image = [UIImage imageNamed:[NSString stringWithFormat:@"Custom_%@.gif", strRarity]];
    lblSetName.text = [NSString stringWithFormat:@"%@ - %@", selectedCard.set, strRarity];
    
    //Display Mana Symbols for Mana Cost
    NSMutableArray *manaSymbols = [[NSMutableArray alloc] initWithArray:[selectedCard.mc componentsSeparatedByString:@"}"]];
    [manaSymbols removeLastObject];
    for(int i=0; i<manaSymbols.count; i++)
    {
        CGRect frame = CGRectMake(118 + (20*i), 48, 20, 20);
        if(i>8)
        {
            frame.origin.y += 20;
            frame.origin.x = (118 + (20*(i-9)));
        }
        NSString *manaSymbol = [[manaSymbols objectAtIndex:i] stringByReplacingOccurrencesOfString:@"{" withString:@""];
        UIImageView *imgViewManaSymbol = [[UIImageView alloc]initWithFrame:frame];
        imgViewManaSymbol.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", manaSymbol]];
        //imgViewManaSymbol.image = [UIImage imageNamed:@"B.png"];
        [self.view addSubview:imgViewManaSymbol];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)actionChangeSelection:(id)sender
{
    NSString *ability = [selectedCard.ability stringByReplacingOccurrencesOfString:@"£" withString:@"\n"];
    NSString *ruling = [selectedCard.ruling stringByReplacingOccurrencesOfString:@"£" withString:@"\n"];
    ruling = [ruling stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSString *flavor = [selectedCard.flavor stringByReplacingOccurrencesOfString:@"£" withString:@"\n"];
    if(cardInfoSegmentController.selectedSegmentIndex == 0) cardInfoTextField.text = ability;
    if(cardInfoSegmentController.selectedSegmentIndex == 1) cardInfoTextField.text = ruling;
    if(cardInfoSegmentController.selectedSegmentIndex == 2) cardInfoTextField.text = flavor;
}
@end
