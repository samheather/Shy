//
//  QuestionStickerView.m
//  Shy
//
//  Created by Samuel B Heather on 02/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import "QuestionStickerView.h"

@implementation QuestionStickerView

@synthesize theView, questionForThisButton;

-(id)initWithQuestion:(Question*)inputQuestion withHeight:(int)height withIndex:(int)index {
    self = [super init];
    if (self) {
        questionForThisButton = inputQuestion;
        
        // Initialise and set appearance
        theView = [[UIButton alloc] initWithFrame:CGRectMake(10, 50+((10+height)*index), 300, height)];
        [theView setBackgroundColor:[UIColor whiteColor]];
        [theView.layer setShadowColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1].CGColor];
        [theView.layer setShadowOffset:CGSizeMake(0, 0)];
        [theView.layer setShadowOpacity:0.8];
        [theView.layer setShadowRadius:1];
        
        // Set tap behaviour
//        [theView addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
//        [theView addTarget:self action:@selector(pressUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
//        [theView addTarget:self action:@selector(pressUpInside:) forControlEvents:UIControlEventTouchUpInside];
        
//        [theView.layer setBorderColor:aqua];
        
        UIImageView *sideBar = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,theView.frame.size.height)];
        [sideBar setBackgroundColor:[UIColor blueColor]];
        [theView addSubview:sideBar];
        
        UILabel *questionTitle = [[UILabel alloc] initWithFrame:CGRectMake(20,10,theView.frame.size.width-20,15)];
        [questionTitle setText:[inputQuestion question]];
        [theView addSubview:questionTitle];
        
        UILabel *answer = [[UILabel alloc] initWithFrame:CGRectMake(20, 35,theView.frame.size.width-20,height-35-10)];
        [answer setText:[inputQuestion answer]];
//        answer.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        [answer setNumberOfLines:4];
//        answer.
        [theView addSubview:answer];
        
        [theView.layer setCornerRadius:4];
        theView.layer.masksToBounds = YES;
                                
    }
    return self;
}

-(void)pressDown:(id)sender {
    NSLog(@"Press down start");
//    [theView setBackgroundColor:[UIColor grayColor]];
//    theView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.90, 0.90);
    NSLog(@"Press down stop");
}

-(void)pressUpOutside:(id)sender {
//    [theView setBackgroundColor:[UIColor whiteColor]];
//    theView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
}

-(void)pressUpInside:(id)sender {
    NSLog(@"Touch up inside");
//    [theView setBackgroundColor:[UIColor whiteColor]];
    //    theView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
}

@end
