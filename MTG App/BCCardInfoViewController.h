//
//  BCCardInfoViewController.h
//  MTG App
//
//  Created by Brian Corbin on 6/17/13.
//  Copyright (c) 2013 Brian Corbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCMagicCard.h"

@interface BCCardInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblCardName;
@property (strong, nonatomic) BCMagicCard *selectedCard;
@property (weak, nonatomic) IBOutlet UITextView *cardOtherInfoTextField;
@property (weak, nonatomic) IBOutlet UITextView *cardAbilityTextField;
@property (weak, nonatomic) IBOutlet UITextView *cardFlavorTextField;
@property (weak, nonatomic) IBOutlet UILabel *lblSetName;
@property (weak, nonatomic) IBOutlet UIImageView *imgSetSymbol;


@end
