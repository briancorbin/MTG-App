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
    NSString *Name;
    NSString *Type;
    NSString *cmc;
    NSString *p;
    NSString *t;
    NSString *oracleRulings;
    NSString *set;
    NSString *rarity;
    NSString *imageID;
}

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *cmc;
@property (nonatomic) NSString *p;
@property (nonatomic) NSString *t;
@property (nonatomic) NSString *oracleRulings;
@property (nonatomic) NSString *set;
@property (nonatomic) NSString *rarity;
@property (nonatomic) NSString *imageID;

-(id)initWithImageID:(NSString *) aImageID AndName:(NSString *) aCardName AndCMC:(NSString *) aCMC AndType:(NSString *) aCardType AndSet:(NSString *) aSet AndRarity:(NSString *) aRarity AndPower:(NSString *) aP AndToughness:(NSString *) aT AndOracleRulings:(NSString *) aOracleRulings;
@end
