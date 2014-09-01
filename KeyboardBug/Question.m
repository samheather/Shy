//
//  Questions.m
//  Shy
//
//  Created by Samuel B Heather on 01/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import "Question.h"

@implementation Question

@synthesize uid, question, answer, keywords, targets, ages, votes, splitKeywords, splitTargets, minAge, maxAge;

- (id)initWithUid:(int)inputUid
         question:(NSString *)inputQuestion
           answer:(NSString *)inputAnswer
         keywords:(NSString *)inputKeywords
          targets:(NSString *)inputTargets
         ageRange:(NSString *)inputAges
    numberOfVotes:(int)inputVotes
{
    self = [super init];
    if (self) {
        self.uid = inputUid;
        self.question = inputQuestion;
        self.answer = inputAnswer;
        self.keywords = inputKeywords;
        self.targets = inputTargets;
        self.ages = inputAges;
        self.votes = inputVotes;
        
        splitKeywords = [NSMutableArray arrayWithArray:[keywords componentsSeparatedByString:@","]];
        splitTargets = [NSMutableArray arrayWithArray:[targets componentsSeparatedByString:@","]];
        NSArray *splitAges = [inputAges componentsSeparatedByString:@"-"];
        minAge = [[splitAges objectAtIndex:0] intValue];
        maxAge = [[splitAges objectAtIndex:1] intValue];
    }
    return self;
}

@end
