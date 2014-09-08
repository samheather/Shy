//
//  Questions.h
//  Shy
//
//  Created by Samuel B Heather on 01/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface Questions : NSObject

@property (nonatomic, strong) NSMutableArray *questions;
@property (nonatomic) BOOL liveData;

-(void)loadQuestions;
-(Question *)getQuestionWithIndex:(int)index;
-(int)numberOfQuestions;
-(void)addQuestion:(Question *)newQuestion;
-(BOOL)isLiveData;

@end