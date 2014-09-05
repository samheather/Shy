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

UIImageView *sideBar;
UILabel *questionTitle;
UILabel *answer;
CGRect originalStickerRect;

-(id)initWithQuestion:(Question*)inputQuestion withHeight:(int)initialHeight withIndex:(int)index isExpanded:(BOOL)isExpanded {
    self = [super init];
    if (self) {
        questionForThisButton = inputQuestion;
        
        // Initialise and set appearance
        // TODO this might be redudant code.
        if (!isExpanded) {
            theView = [[UIButton alloc] initWithFrame:CGRectMake(10, 50+((10+initialHeight)*index), 300, initialHeight)];
        }
        else {
            theView = [[UIButton alloc] initWithFrame:CGRectMake(10, 114, 300, initialHeight)];
        }
        [theView setBackgroundColor:[UIColor whiteColor]];
        [theView.layer setShadowColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1].CGColor];
        [theView.layer setShadowOffset:CGSizeMake(0, 0)];
        [theView.layer setShadowOpacity:0.8];
        [theView.layer setShadowRadius:1];
        
        originalStickerRect = theView.frame;
        
        // TODO Finish this code to use the return sidebar gradient below and handle null for grey background.
        // TODO check handling of null?  Since I don't use this specificaly now, sets grey and puts image on top.
        sideBar = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,theView.frame.size.height)];
        [sideBar setBackgroundColor:[UIColor grayColor]];
        [sideBar setImage:[self getSideBarImage:[[questionForThisButton splitExternalKeywords] objectAtIndex:0]]];
        [theView addSubview:sideBar];
        
        questionTitle = [[UILabel alloc] initWithFrame:CGRectMake(20,10,theView.frame.size.width-20,15)];
        [questionTitle setText:[inputQuestion question]];
        [theView addSubview:questionTitle];
        
        answer = [[UILabel alloc] initWithFrame:CGRectMake(20, 35,theView.frame.size.width-20,initialHeight-35-10)];
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

-(void)moveToTopOfView:(UIView *)parentView {
    CGRect topOfScreenInThisScollView = [theView convertRect:theView.frame toView:parentView];
    CGRect tempCurrentStickerFrame = theView.frame;
    tempCurrentStickerFrame.origin.y = tempCurrentStickerFrame.origin.y-topOfScreenInThisScollView.origin.y+100;
    [theView setFrame:tempCurrentStickerFrame];
}

//-(void)expandStickerView {
//    [UIView animateWithDuration:0.3
//                          delay:0.0
//                        options: UIViewAnimationOptionCurveEaseOut
//                     animations:^{
//                         // TODO fix below constant of 250.
//                         theView.frame = CGRectMake(10, 114, 300, 250);
//                         CGRect tempSideBarFrame = sideBar.frame;
//                         tempSideBarFrame.size.height = theView.frame.size.height;
//                         sideBar.frame = tempSideBarFrame;
//                         
//                     }
//                     completion:^(BOOL finished){
//                     }];
//}

-(void)contractStickerView {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         // TODO fix below constant of 150.
                         theView.frame = CGRectMake(10, 114, 300, 150);
                         CGRect tempSideBarFrame = sideBar.frame;
                         tempSideBarFrame.size.height = theView.frame.size.height;
                         sideBar.frame = tempSideBarFrame;
                     }
                     completion:^(BOOL finished){
                         [self.theView removeFromSuperview];
                     }];
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

@end
