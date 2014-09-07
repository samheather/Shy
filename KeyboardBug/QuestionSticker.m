//
//  QuestionSticker.m
//  Shy
//
//  Created by Samuel B Heather on 06/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import "QuestionSticker.h"
#import "Question.h"
#import "MainViewController.h"

@implementation QuestionSticker

int initialHeight = 150;
CGRect originalStickerRect;
UIImageView *sideBar;
UILabel *questionTitle;
UILabel *answer;
UIView *topView;
//BUGViewController *topViewController;

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
        topView = self.superview;
        
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer setShadowColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1].CGColor];
        [self.layer setShadowOffset:CGSizeMake(0, 0)];
        [self.layer setShadowOpacity:0.8];
        [self.layer setShadowRadius:1];
        
        originalStickerRect = self.frame;
        
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer setShadowColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1].CGColor];
        [self.layer setShadowOffset:CGSizeMake(0, 0)];
        [self.layer setShadowOpacity:0.8];
        [self.layer setShadowRadius:1];
        
        // Add in corner radius, shadows, questions and answers.
        
//        [self addTarget:self action:@selector(tapDown) forControlEvents:UIControlEventTouchDown];
//        [self addTarget:self action:@selector(tapUpInside) forControlEvents:UIControlEventTouchUpInside];
//        [self addTarget:self action:@selector(tapUpOutside) forControlEvents:UIControlEventTouchUpOutside];
//        [self addTarget:self action:@selector(tapUpOutside) forControlEvents:UIControlEventTouchDragOutside];
//        // TODO - this means if dragging inside it's 'deselected' - is this expected/desired behaviour?
//        [self addTarget:self action:@selector(tapUpOutside) forControlEvents:UIControlEventTouchDragInside];
        
        // TODO Finish this code to use the return sidebar gradient below and handle null for grey background.
        // TODO check handling of null?  Since I don't use this specificaly now, sets grey and puts image on top.
        sideBar = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,self.frame.size.height)];
        [sideBar setBackgroundColor:[UIColor grayColor]];
        [sideBar setImage:[self getSideBarImage:[[inputQuestion splitExternalKeywords] objectAtIndex:0]]];
        [self addSubview:sideBar];
        
        questionTitle = [[UILabel alloc] initWithFrame:CGRectMake(20,10,self.frame.size.width-20,15)];
        [questionTitle setText:[inputQuestion question]];
        [self addSubview:questionTitle];
        
        answer = [[UILabel alloc] initWithFrame:CGRectMake(20, 35,self.frame.size.width-20,initialHeight-35-10)];
        [answer setText:[inputQuestion answer]];
        //        answer.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        [answer setNumberOfLines:4];
        //        answer.
        [self addSubview:answer];
        
        [self.layer setCornerRadius:4];
        self.layer.masksToBounds = YES;

    }
    return self;
}

-(void)expandAndMove {
//    self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.98, 0.98);
    
    [topView bringSubviewToFront:self];
    
    CGRect frameInTopView = [self convertRect:self.frame toView:topView];
    CGFloat scale = [[UIScreen mainScreen] scale];
    if (scale == 1) {
        // Do nothing
    }
    else if (scale == 2) {
        frameInTopView.origin.x = frameInTopView.origin.x/2;
        frameInTopView.origin.y = frameInTopView.origin.y/2;
        frameInTopView.size.width = frameInTopView.size.width/2;
        frameInTopView.size.height = frameInTopView.size.height/2;
    }
    // TODO The above code isn't so expandable if Apple release a higher resolution screen.  Debug info below.
    // NSLog(@"%@", NSStringFromCGRect(frameInTopView));
    
    CGRect tempCurrentFrame = self.frame;
    tempCurrentFrame.origin.y = tempCurrentFrame.origin.y-frameInTopView.origin.y+82;
    [self setFrame:tempCurrentFrame];
}

-(void)tapUpInside {
//    self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
}

-(void)tapUpOutside {
//    self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
}

-(UIImage *)getSideBarImage:(NSString *)category {
    if ([category isEqualToString:@"Drugs & Alcohol"]) {
        return [UIImage imageNamed:@"drugsandalcohol-darkgreen"];
    }
    else if ([category isEqualToString:@"Family"]) {
        return [UIImage imageNamed:@"family-orange"];
    }
    else if ([category isEqualToString:@"Feelings"]) {
        return [UIImage imageNamed:@"feelings-deeppurple"];
    }
    else if ([category isEqualToString:@"Friends"]) {
        return [UIImage imageNamed:@"friends-yellow"];
    }
    else if ([category isEqualToString:@"Health"]) {
        return [UIImage imageNamed:@"health-green"];
    }
    else if ([category isEqualToString:@"Relationships"]) {
        return [UIImage imageNamed:@"relationships-purple"];
    }
    else if ([category isEqualToString:@"School"]) {
        return [UIImage imageNamed:@"school-turqouise"];
    }
    else if ([category isEqualToString:@"Sex"]) {
        return [UIImage imageNamed:@"sex-redish"];
    }
    else if ([category isEqualToString:@"Your Body"]) {
        return [UIImage imageNamed:@"yourbody-blue"];
    }
    return NULL;
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
