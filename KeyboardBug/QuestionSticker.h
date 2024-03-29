//
//  QuestionSticker.h
//  Shy
//
//  Created by Samuel B Heather on 06/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface QuestionSticker : UIButton

- (id)initWithQuestion:(Question*)inputQuestion withIndex:(int)index;
-(void)tapDown;
-(void)tapUpInside;
-(void)tapUpOutside;
-(void)expandAndGreyThis:(UIView *)view1 andThis:(UIView *)view2;
-(void)contractAndUnGreyThis:(UIView *)view1 andThis:(UIView *)view2;
-(CGRect)getFrameInUIView;
-(UIImage *)getSideBarImage:(NSString *)category;
-(Question *)getQuestion;

@property(nonatomic, retain)Question *question;

@end
