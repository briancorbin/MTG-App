//
//  BCSet.m
//  MTG App
//
//  Created by Brian Corbin on 6/6/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCSet.h"

@implementation BCSet
@synthesize setName, setBlock;

-(id)initWithSetName:(NSString *)aSetName AndWithSetBlock:(NSString *)aSetBlock
{
    self.setName = aSetName;
    self.setBlock = aSetBlock;
    return self;
}

@end
