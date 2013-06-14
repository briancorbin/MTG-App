//
//  BCCardImageInfoViewController.m
//  MTG App
//
//  Created by Brian Corbin on 6/13/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCCardImageInfoViewController.h"
#import "BCCardImageViewController.h"
#import "BCCardInfoViewController.h"
#import "BCMagicCard.h"

@implementation BCCardImageInfoViewController
@synthesize cardDatabase, cardIndex, cardImageVC, cardInfoVC, myScrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    for(int i=0; i<cardDatabase.count; i++)
    {
        BCMagicCard *tempMC = [cardDatabase objectAtIndex:i];
        NSString *strSetNameForImage = [tempMC.set stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        strSetNameForImage = [strSetNameForImage stringByReplacingOccurrencesOfString:@":" withString:@""];
        NSString *strCardNameForImage = [tempMC.name stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        strCardNameForImage = [strCardNameForImage stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        CGRect frame;
        frame.origin.x = self.myScrollView.frame.size.width * i/2;
        frame.origin.y = 0;
        frame.size = self.myScrollView.frame.size;
        
        UIView *subview = [[UIView alloc]initWithFrame:frame];
        UIImageView *imgSubView = [[UIImageView alloc]initWithFrame:subview.frame];
        imgSubView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ark42.com/mtg/cards/%@/%@.full.jpg",strSetNameForImage, strCardNameForImage]]]];
        if(imgSubView.image == nil) imgSubView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=%@&type=card",tempMC.imageID ]]]];
        [subview addSubview:imgSubView];
        [self.myScrollView addSubview:subview];
    }
    self.myScrollView.contentSize = CGSizeMake(self.myScrollView.frame.size.width * cardDatabase.count, self.myScrollView.frame.size.height);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.myScrollView.frame.size.width;
    int page = floor((self.myScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    NSLog(@"%d", page);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
