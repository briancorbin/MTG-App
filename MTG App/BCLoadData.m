//
//  BCLoadData.m
//  MTG App
//
//  Created by Brian Corbin on 6/6/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCLoadData.h"
#import "BCMagicCard.h"
#import "BCSet.h"

@implementation BCLoadData

@synthesize cardLibrary, setList, blockList, cardTypeList, colorList, rarityList;

-(NSMutableArray *)loadCardData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Full Database" ofType:@"csv"];
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSMutableArray *rowArray = [[NSMutableArray alloc] initWithArray:[fileContent componentsSeparatedByString:@"\n"]];
    [rowArray removeObjectAtIndex:0];
    NSMutableArray *cardNames = [[NSMutableArray alloc]init];
    NSMutableArray *cardSets = [[NSMutableArray alloc]init];
    NSMutableArray *cardSetCodes = [[NSMutableArray alloc]init];
    NSMutableArray *cardImageIDs = [[NSMutableArray alloc]init];
    NSMutableArray *cardTypes = [[NSMutableArray alloc]init];
    NSMutableArray *cardPs = [[NSMutableArray alloc]init];
    NSMutableArray *cardTs = [[NSMutableArray alloc]init];
    NSMutableArray *cardLoyalties = [[NSMutableArray alloc]init];
    NSMutableArray *cardMCs = [[NSMutableArray alloc]init];
    NSMutableArray *cardCMCs = [[NSMutableArray alloc]init];
    NSMutableArray *cardArtists = [[NSMutableArray alloc]init];
    NSMutableArray *cardFlavors = [[NSMutableArray alloc]init];
    NSMutableArray *cardColors = [[NSMutableArray alloc]init];
    NSMutableArray *cardGeneratedManas = [[NSMutableArray alloc]init];
    NSMutableArray *cardNumbers = [[NSMutableArray alloc]init];
    NSMutableArray *cardRarities = [[NSMutableArray alloc]init];
    NSMutableArray *cardRatings = [[NSMutableArray alloc]init];
    NSMutableArray *cardRulings = [[NSMutableArray alloc]init];
    NSMutableArray *cardAbilities = [[NSMutableArray alloc]init];
    
    for(int i=0; i<rowArray.count;i++)
    {
        NSMutableArray *tempArray = [[NSMutableArray alloc]initWithArray:[rowArray[i] componentsSeparatedByString:@"@"]];
        [cardNames addObject:[tempArray objectAtIndex:0]];
        [cardSets addObject:[tempArray objectAtIndex:1]];
        [cardSetCodes addObject:[tempArray objectAtIndex:2]];
        [cardImageIDs addObject:[tempArray objectAtIndex:3]];
        [cardTypes addObject:[tempArray objectAtIndex:4]];
        [cardPs addObject:[tempArray objectAtIndex:5]];
        [cardTs addObject:[tempArray objectAtIndex:6]];
        [cardLoyalties addObject:[tempArray objectAtIndex:7]];
        [cardMCs addObject:[tempArray objectAtIndex:8]];
        [cardCMCs addObject:[tempArray objectAtIndex:9]];
        [cardArtists addObject:[tempArray objectAtIndex:10]];
        [cardFlavors addObject:[tempArray objectAtIndex:11]];
        [cardColors addObject:[tempArray objectAtIndex:12]];
        [cardGeneratedManas addObject:[tempArray objectAtIndex:13]];
        [cardNumbers addObject:[tempArray objectAtIndex:14]];
        [cardRarities addObject:[tempArray objectAtIndex:15]];
        [cardRatings addObject:[tempArray objectAtIndex:16]];
        [cardRulings addObject:[tempArray objectAtIndex:17]];
        [cardAbilities addObject:[tempArray objectAtIndex:18]];
    }
    
    cardLibrary = [[NSMutableArray alloc] init];
    for(int i=0;i<cardNames.count;i++)
    {
        BCMagicCard *newMC = [[BCMagicCard alloc]initWithName:cardNames[i] AndWithSet:cardSets[i] AndWithSetCode:cardSetCodes[i] AndWithImageID:cardImageIDs[i] AndWithType:cardTypes[i] AndWithPower:cardPs[i] AndWithToughness:cardTs[i] AndWithLoyalty:cardLoyalties[i] AndWithMC:cardMCs[i] AndWithCMC:cardCMCs[i] AndWithArtist:cardArtists[i] AndWithFlavor:cardFlavors[i] AndWithColor:cardColors[i] AndWithGeneratedMana:cardGeneratedManas[i] AndWithNumber:cardNumbers[i] AndWithRarity:cardRarities[i] AndWithRating:cardRatings[i] AndWithRuling:cardRulings[i] AndWithAbility:cardAbilities[i]];
        [cardLibrary addObject:newMC];
    }
    
    return cardLibrary;
}

-(NSMutableArray *)loadSetData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Set List" ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSMutableArray *rowArray = [[NSMutableArray alloc] initWithArray:[fileContent componentsSeparatedByString:@"\n"]];
    [rowArray removeObjectAtIndex:0];
    
    setList = [[NSMutableArray alloc]init];
    for (int i=0; i<rowArray.count; i++) {
        NSMutableArray *tempArray = [[NSMutableArray alloc] initWithArray:[rowArray[i] componentsSeparatedByString:@"@"]];
        BCSet *newSet = [[BCSet alloc]initWithSetName:[tempArray objectAtIndex:0] AndWithSetBlock:[tempArray objectAtIndex:1] AndWithSetCode:[tempArray objectAtIndex:2]];
        [setList addObject:newSet];
    }
    return setList;
}

-(NSMutableArray *)loadBlockData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Block List" ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSMutableArray *rowArray = [[NSMutableArray alloc] initWithArray:[fileContent componentsSeparatedByString:@"\n"]];
    [rowArray removeObjectAtIndex:0];
    
    blockList = [[NSMutableArray alloc]init];
    for (int i=0; i<rowArray.count; i++) {
        [blockList addObject:[rowArray objectAtIndex:i]];
    }
    return blockList;
}

-(NSMutableArray *)loadCardTypeData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Card Types" ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSMutableArray *rowArray = [[NSMutableArray alloc] initWithArray:[fileContent componentsSeparatedByString:@"\n"]];
    [rowArray removeObjectAtIndex:0];
    cardTypeList = [[NSMutableArray alloc]init];
    for (int i=0; i<rowArray.count;i++)
    {
        [cardTypeList addObject:[rowArray objectAtIndex:i]];
    }
    return cardTypeList;
}

-(NSMutableArray *)loadColorData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Colors" ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSMutableArray *rowArray = [[NSMutableArray alloc] initWithArray:[fileContent componentsSeparatedByString:@"\n"]];
    [rowArray removeObjectAtIndex:0];
    colorList = [[NSMutableArray alloc]init];
    for (int i=0; i<rowArray.count;i++)
    {
        [colorList addObject:[rowArray objectAtIndex:i]];
    }
    return colorList;

}

-(NSMutableArray *)loadRarityData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Rarities" ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSMutableArray *rowArray = [[NSMutableArray alloc] initWithArray:[fileContent componentsSeparatedByString:@"\n"]];
    [rowArray removeObjectAtIndex:0];
    rarityList = [[NSMutableArray alloc]init];
    for (int i=0; i<rowArray.count;i++)
    {
        [rarityList addObject:[rowArray objectAtIndex:i]];
    }
    return rarityList;

}

-(void)loadNewFormatTest
{
    
}

@end
