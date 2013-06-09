//
//  BCMagicCard.h
//  MTG App
//
//  Created by Brian Corbin on 6/6/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCMagicCard : NSObject
{
    NSString *name;
    NSString *set;
    NSString *setCode;
    NSString *imageID;
    NSString *type;
    NSString *p;
    NSString *t;
    NSString *loyalty;
    NSString *mc;
    NSString *cmc;
    NSString *artist;
    NSString *flavor;
    NSString *color;
    NSString *generatedMana;
    NSString *number;
    NSString *rarity;
    NSString *rating;
    NSString *ruling;
    NSString *ability;
}

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *set;
@property (strong, nonatomic) NSString *setCode;
@property (strong, nonatomic) NSString *imageID;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *p;
@property (strong, nonatomic) NSString *t;
@property (strong, nonatomic) NSString *loyalty;
@property (strong, nonatomic) NSString *mc;
@property (strong, nonatomic) NSString *cmc;
@property (strong, nonatomic) NSString *artist;
@property (strong, nonatomic) NSString *flavor;
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *generatedMana;
@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *rarity;
@property (strong, nonatomic) NSString *rating;
@property (strong, nonatomic) NSString *ruling;
@property (strong, nonatomic) NSString *ability;


-(id)initWithName:(NSString *)aName AndWithSet:(NSString *)aSet AndWithSetCode:(NSString *)aSetCode AndWithImageID:(NSString *)aImageID AndWithType:(NSString *)aType AndWithPower:(NSString *)aPower AndWithToughness:(NSString *)aToughness AndWithLoyalty:(NSString *)aLoyalty AndWithMC:(NSString *)aMC AndWithCMC:(NSString *)aCMC AndWithArtist:(NSString *)aArtist AndWithFlavor:(NSString *)aFlavor AndWithColor:(NSString *)aColor AndWithGeneratedMana:(NSString *)aGeneratedMana AndWithNumber:(NSString *)aNumber AndWithRarity:(NSString *)aRarity AndWithRating:(NSString *)aRating AndWithRuling:(NSString *)aRuling AndWithAbility:(NSString *)aAbility;
@end
