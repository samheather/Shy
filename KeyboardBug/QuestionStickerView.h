//
//  QuestionStickerView.h
//  Shy
//
//  Created by Samuel B Heather on 02/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface QuestionStickerView : NSObject

-(id)initWithQuestion:(Question*)inputQuestion withHeight:(int)height withIndex:(int)index;

@property UIView *theView;

@end
