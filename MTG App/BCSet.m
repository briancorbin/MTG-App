//
//  BCSet.m
//  MTG App
//
//  Created by Brian Corbin on 6/6/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCSet.h"

@implementation BCSet
@synthesize setName, setBlock,setCode;

-(id)initWithSetName:(NSString *)aSetName AndWithSetBlock:(NSString *)aSetBlock AndWithSetCode:(NSString *)aSetCode
{
    self.setName = aSetName;
    self.setBlock = aSetBlock;
    self.setCode = aSetCode;
    return self;
}

@end
