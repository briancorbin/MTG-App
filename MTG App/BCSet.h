//
//  BCSet.h
//  MTG App
//
//  Created by Brian Corbin on 6/6/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCSet : NSObject
{
    NSString *setName;
    NSString *setBlock;
}

@property (nonatomic, strong) NSString *setName;
@property (nonatomic, strong) NSString *setBlock;

-(id)initWithSetName:(NSString *) aSetName AndWithSetBlock:(NSString *) aSetBlock;
@end
