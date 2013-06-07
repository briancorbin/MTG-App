//
//  BCMagicCard.m
//  MTG App
//
//  Created by Brian Corbin on 6/6/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCMagicCard.h"

@implementation BCMagicCard
@synthesize name, type, cmc, p, t, set, rarity, imageID, oracleRulings;

-(id)initWithImageID:(NSString *)aImageID AndName:(NSString *)aCardName AndCMC:(NSString *)aCMC AndType:(NSString *)aCardType AndSet:(NSString *)aSet AndRarity:(NSString *)aRarity AndPower:(NSString *)aP AndToughness:(NSString *)aT AndOracleRulings:(NSString *)aOracleRulings
{
    self.imageID = aImageID;
    self.name = aCardName;
    self.cmc = aCMC;
    self.type = aCardType;
    self.set = aSet;
    self.rarity = aRarity;
    self.P = aP;
    self.T = aT;
    self.oracleRulings = aOracleRulings;
    
    return self;
}
@end
