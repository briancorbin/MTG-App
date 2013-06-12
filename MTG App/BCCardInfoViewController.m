//
//  BCCardInfoViewController.m
//  MTG App
//
//  Created by Brian Corbin on 6/11/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import "BCCardInfoViewController.h"

@implementation BCCardInfoViewController

@synthesize myImageView;

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
    
    UITapGestureRecognizer *tapImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionFlipView:)];
    [myImageView addGestureRecognizer:tapImage];
    myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 300, 420)];
    myImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://ark42.com/mtg/cards/Dragon's%20Maze/Advent%20of%20the%20Wurm.full.jpg"]]];
    [myImageView addGestureRecognizer:tapImage];
    [self.view addSubview:myImageView];
}

- (IBAction)actionFlipView:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
