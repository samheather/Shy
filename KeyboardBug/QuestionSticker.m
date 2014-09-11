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

@synthesize question;

int standardHeight = 150;
CGRect originalStickerRect;
UIImageView *sideBar;
UILabel *questionTitle;
UITextView *answer;
UIView *topView;
UIView *dividingLine1;
UILabel *keywords;
UIView *dividingLine2;

CGRect originalViewFrame;

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
    self = [super initWithFrame:CGRectMake(10, 50+((10+standardHeight)*index), 300, standardHeight)];
    if (self) {
        question = inputQuestion;
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
        
        // TODO Finish this code to use the return sidebar gradient below and handle null for grey background.
        // TODO check handling of null?  Since I don't use this specificaly now, sets grey and puts image on top.
        sideBar = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,self.frame.size.height)];
        [sideBar setBackgroundColor:[UIColor grayColor]];
        [sideBar setImage:[self getSideBarImage:[[inputQuestion splitExternalKeywords] objectAtIndex:0]]];
        [self addSubview:sideBar];
        
        questionTitle = [[UILabel alloc] initWithFrame:CGRectMake(20,8,self.frame.size.width-20,48)];
        [questionTitle setText:[inputQuestion question]];
        [questionTitle setFont:[UIFont fontWithName:@"Helvetica" size:20]];
//        [questionTitle setLineBreakMode:NSLineBreakByWordWrapping];
        [questionTitle setNumberOfLines:0];
        [questionTitle setTextColor:[UIColor colorWithRed:0.29 green:0.29 blue:0.29 alpha:1]]; //#4a4a4a
        [self addSubview:questionTitle];
        
        // Dividing line
        dividingLine1 = [[UIView alloc] initWithFrame:CGRectMake(20,
                                                                 questionTitle.frame.size.height+questionTitle.frame.origin.y+5,
                                                                 self.frame.size.width-30,
                                                                 0.5)];
        [dividingLine1 setBackgroundColor:[UIColor grayColor]];
        [self addSubview:dividingLine1];
        
        keywords = [[UILabel alloc] initWithFrame:CGRectMake(20,
                                                             dividingLine1.frame.origin.y + dividingLine1.frame.size.height,
                                                             self.frame.size.width-30,
                                                             20)];
        [keywords setTextColor:[UIColor colorWithRed:0.29 green:0.29 blue:0.29 alpha:1]]; //#4a4a4a
        [keywords setText:@"Hello, World"];
        [self addSubview:keywords];
        
        dividingLine2 = [[UIView alloc] initWithFrame:CGRectMake(20,
                                                                 questionTitle.frame.size.height+questionTitle.frame.origin.y+25,
                                                                 self.frame.size.width-30,
                                                                 0.5)];
        [dividingLine2 setBackgroundColor:[UIColor grayColor]];
        [self addSubview:dividingLine2];
        
        answer = [[UITextView alloc] initWithFrame:CGRectMake(20, 86,self.frame.size.width-20,standardHeight-86-10)];
        [answer setText:[inputQuestion answer]];
        [answer setUserInteractionEnabled:FALSE];
        [answer setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        [answer setTextColor:[UIColor colorWithRed:0.29 green:0.29 blue:0.29 alpha:1]]; //#4a4a4a
        [self addSubview:answer];
        
        [self.layer setCornerRadius:4];
        self.layer.masksToBounds = YES;
        
    }
    return self;
}

-(void)tapDown {
//    self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.98, 0.98);
}

-(void)tapUpInside {
//    self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
}

-(void)tapUpOutside {
//    self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
}

-(void)expandAndGreyThis:(UIView *)view1 andThis:(UIView *)view2 {
    originalViewFrame = self.frame;
    CGRect currentFrame = self.frame;
    CGRect superviewFrame = self.superview.frame;
    currentFrame.origin.y = 70;
    currentFrame.size.height = superviewFrame.size.height-80;
    
    CGRect sideBarFrame = sideBar.frame;
    sideBarFrame.size.height = currentFrame.size.height;
    
    CGRect answerFrame = answer.frame;
    answerFrame.size.height = currentFrame.size.height-answerFrame.origin.y-10;
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self setFrame:currentFrame];
                         [sideBar setFrame:sideBarFrame];
                         [view1.layer setOpacity:0.0];
                         
                         // TODO Hack to stop grey top been turned grey
                         [view2.layer setOpacity:0.85];
                         
                         [answer setFrame:answerFrame];
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];
}

-(void)contractAndUnGreyThis:(UIView *)view1 andThis:(UIView *)view2 {
    CGRect sideBarFrame = sideBar.frame;
    sideBarFrame.size.height = originalViewFrame.size.height;
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self setFrame:originalViewFrame];
                         [sideBar setFrame:sideBarFrame];
                         [view1.layer setOpacity:0.0];
                         [view2.layer setOpacity:0.0];
                     }
                     completion:^(BOOL finished){
                         [self removeFromSuperview];
                     }];
}

-(CGRect)getFrameInUIView {
    CGRect frameInTopView = [self.superview convertRect:self.frame toView:topView];
    // Below code may be needed if scaling for retina doesn't work (i.e. CGRect is 2X)
//    CGFloat scale = [[UIScreen mainScreen] scale];
//    if (scale == 1) {
//        // Do nothing
//    }
//    else if (scale == 2) {
//        frameInTopView.origin.x = frameInTopView.origin.x/2;
//        frameInTopView.origin.y = frameInTopView.origin.y/2;
//        frameInTopView.size.width = frameInTopView.size.width/2;
//        frameInTopView.size.height = frameInTopView.size.height/2;
//    }

    return frameInTopView;
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

-(Question *)getQuestion {
    return question;
}

-(int)getStandardHeight {
    return standardHeight;
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
