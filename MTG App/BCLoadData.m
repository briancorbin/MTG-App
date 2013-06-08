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
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"FullDatabase" ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSMutableArray *rowArray = [[NSMutableArray alloc] initWithArray:[fileContent componentsSeparatedByString:@"@!END!\n"]];
    [rowArray removeObjectAtIndex:0]; //removes the header titles of each column
    NSMutableArray *cardImageIDs = [[NSMutableArray alloc]init];
    NSMutableArray *cardNames = [[NSMutableArray alloc]init];
    NSMutableArray *cardTypes = [[NSMutableArray alloc]init];
    NSMutableArray *cardCMCs = [[NSMutableArray alloc]init];
    NSMutableArray *cardPs = [[NSMutableArray alloc]init];
    NSMutableArray *cardTs = [[NSMutableArray alloc]init];
    NSMutableArray *cardOracleRulings = [[NSMutableArray alloc]init];
    NSMutableArray *cardSets = [[NSMutableArray alloc]init];
    NSMutableArray *cardRarities = [[NSMutableArray alloc]init];
    
    for(int i=0; i<rowArray.count;i++)
    {
        NSMutableArray *tempArray = [[NSMutableArray alloc]initWithArray:[rowArray[i] componentsSeparatedByString:@"@"]];
        [cardImageIDs addObject:[tempArray objectAtIndex:0]];
        [cardNames addObject:[tempArray objectAtIndex:1]];
        [cardCMCs addObject:[tempArray objectAtIndex:2]];
        [cardTypes addObject:[tempArray objectAtIndex:3]];
        [cardSets addObject:[tempArray objectAtIndex:4]];
        [cardRarities addObject:[tempArray objectAtIndex:5]];
        [cardPs addObject:[tempArray objectAtIndex:6]];
        [cardTs addObject:[tempArray objectAtIndex:7]];
        [cardOracleRulings addObject:[tempArray objectAtIndex:8]];
    }
    cardLibrary = [[NSMutableArray alloc] init];
    for(int i=0;i<cardNames.count;i++)
    {
        BCMagicCard *newMagicCard = [[BCMagicCard alloc]initWithImageID:cardImageIDs[i] AndName:cardNames[i] AndCMC:cardCMCs[i] AndType:cardTypes[i] AndSet:cardSets[i] AndRarity:cardRarities[i] AndPower:cardPs[i] AndToughness:cardTs[i] AndOracleRulings:cardOracleRulings[i]];
        [cardLibrary addObject:newMagicCard];
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
        BCSet *newSet = [[BCSet alloc]initWithSetName:[tempArray objectAtIndex:0] AndWithSetBlock:[tempArray objectAtIndex:1]];
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

@end
