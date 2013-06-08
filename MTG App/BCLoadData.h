//
//  BCLoadData.h
//  MTG App
//
//  Created by Brian Corbin on 6/6/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCLoadData : NSObject

@property (nonatomic, strong) NSMutableArray *cardLibrary;
@property (nonatomic, strong) NSMutableArray *setList;
@property (nonatomic, strong) NSMutableArray *blockList;
@property (nonatomic, strong) NSMutableArray *cardTypeList;
@property (nonatomic, strong) NSMutableArray *colorList;
@property (nonatomic, strong) NSMutableArray *rarityList;

-(NSMutableArray *)loadCardData;
-(NSMutableArray *)loadSetData;
-(NSMutableArray *)loadBlockData;
-(NSMutableArray *)loadCardTypeData;
-(NSMutableArray *)loadColorData;
-(NSMutableArray *)loadRarityData;

@end
