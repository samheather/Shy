//
//  QuestionStickerView.m
//  Shy
//
//  Created by Samuel B Heather on 02/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import "QuestionStickerView.h"

@implementation QuestionStickerView

@synthesize theView;

-(id)initWithQuestion:(Question*)inputQuestion withHeight:(int)height withIndex:(int)index {
    self = [super init];
    if (self) {
        theView = [[UIView alloc] initWithFrame:CGRectMake(10, 40+((10+height)*index), 300, height)];
        [theView setBackgroundColor:[UIColor whiteColor]];
        [theView.layer setCornerRadius:4];
        [theView.layer setBorderWidth:2];
        CGColorRef*  aqua = [[UIColor colorWithRed:0.521569 green:0.768627 blue:0.254902 alpha:1] CGColor];
        [theView.layer setBorderColor:aqua];
    }
    return self;
}

@end
