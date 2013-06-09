//
//  BCMagicCard.m
//  MTG App
//
//  Created by Brian Corbin on 6/6/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCMagicCard.h"

@implementation BCMagicCard
@synthesize name, set, setCode, imageID, type, p, t, loyalty, mc, cmc, artist, flavor, color, generatedMana, number, rarity, rating, ruling, ability;

-(id)initWithName:(NSString *)aName AndWithSet:(NSString *)aSet AndWithSetCode:(NSString *)aSetCode AndWithImageID:(NSString *)aImageID AndWithType:(NSString *)aType AndWithPower:(NSString *)aPower AndWithToughness:(NSString *)aToughness AndWithLoyalty:(NSString *)aLoyalty AndWithMC:(NSString *)aMC AndWithCMC:(NSString *)aCMC AndWithArtist:(NSString *)aArtist AndWithFlavor:(NSString *)aFlavor AndWithColor:(NSString *)aColor AndWithGeneratedMana:(NSString *)aGeneratedMana AndWithNumber:(NSString *)aNumber AndWithRarity:(NSString *)aRarity AndWithRating:(NSString *)aRating AndWithRuling:(NSString *)aRuling AndWithAbility:(NSString *)aAbility
{
    self.name = aName;
    self.set = aSet;
    self.setCode = aSetCode;
    self.imageID = aImageID;
    self.type = aType;
    self.p = aPower;
    self.t = aToughness;
    self.loyalty = aLoyalty;
    self.mc = aMC;
    self.cmc = aCMC;
    self.artist = aArtist;
    self.flavor = aFlavor;
    self.color = aColor;
    self.generatedMana = aGeneratedMana;
    self.number = aNumber;
    self.rarity = aRarity;
    self.rating = aRating;
    self.ruling = aRuling;
    self.ability = aAbility;
    return self;
}
@end
