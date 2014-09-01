//
//  Questions.h
//  Shy
//
//  Created by Samuel B Heather on 01/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Questions : NSObject

@property (nonatomic, strong) NSMutableArray *questions;

-(BOOL)loadQuestions;

@end
