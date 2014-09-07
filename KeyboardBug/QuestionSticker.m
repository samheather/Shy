//
//  QuestionSticker.m
//  Shy
//
//  Created by Samuel B Heather on 06/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import "QuestionSticker.h"
#import "QUestion.h"

@implementation QuestionSticker

int initialHeight = 150;
CGRect originalStickerRect;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [NSException raise:@"Invalid Constructor" format:@"This constructor should never be called."];
    }
    return self;
}

- (id)initWithQuestion:(Question*)inputQuestion withIndex:(int)index
{
    self = [super initWithFrame:CGRectMake(10, 50+((10+initialHeight)*index), 300, initialHeight)];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer setShadowColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1].CGColor];
        [self.layer setShadowOffset:CGSizeMake(0, 0)];
        [self.layer setShadowOpacity:0.8];
        [self.layer setShadowRadius:1];
        
        originalStickerRect = self.frame;
        
        // Add in corner radius, shadows, questions and answers.
        
        [self addTarget:self action:@selector(tapDown) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(tapUpInside) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(tapUpOutside) forControlEvents:UIControlEventTouchUpOutside];
        [self addTarget:self action:@selector(tapUpOutside) forControlEvents:UIControlEventTouchDragOutside];
        // TODO - this means if dragging inside it's 'deselected' - is this expected/desired behaviour?
        [self addTarget:self action:@selector(tapUpOutside) forControlEvents:UIControlEventTouchDragInside];
    }
    return self;
}

-(void)tapDown {
    NSLog(@"Tap down");
}

-(void)tapUpInside {
    NSLog(@"Tap up inside");
}

-(void)tapUpOutside {
    NSLog(@"Tap up outside");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
