//
//  Questions.m
//  Shy
//
//  Created by Samuel B Heather on 01/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import "Question.h"

@implementation Question

@synthesize uid, question, answer, internalKeywords, externalKeywords, targets, ages, votes, splitInternalKeywords, splitExternalKeywords, splitTargets, minAge, maxAge;

NSString *aa;
NSString *qq;

- (id)initWithUid:(int)inputUid
         question:(NSString *)inputQuestion
           answer:(NSString *)inputAnswer
 internalKeywords:(NSString *)inputInternalKeywords
 externalKeywords:(NSString *)inputExternalKeywords
          targets:(NSString *)inputTargets
         ageRange:(NSString *)inputAges
    numberOfVotes:(int)inputVotes
{
    self = [super init];
    if (self) {
        self.uid = inputUid;
        self.question = inputQuestion;
        self.answer = inputAnswer;
        self.internalKeywords = inputInternalKeywords;
        self.externalKeywords = inputExternalKeywords;
        self.targets = inputTargets;
        self.ages = inputAges;
        self.votes = inputVotes;
        
        qq = inputQuestion;
        aa = inputAnswer;
        
        splitInternalKeywords = [NSMutableArray arrayWithArray:[internalKeywords componentsSeparatedByString:@","]];
        splitExternalKeywords = [NSMutableArray arrayWithArray:[externalKeywords componentsSeparatedByString:@","]];
        splitTargets = [NSMutableArray arrayWithArray:[targets componentsSeparatedByString:@","]];
        // TODO Handle no age.
        NSArray *splitAges = [inputAges componentsSeparatedByString:@"-"];
        minAge = [[splitAges objectAtIndex:0] intValue];
        maxAge = [[splitAges objectAtIndex:1] intValue];
    }
    return self;
}

-(id) copyWithZone:(NSZone *) zone
{
    Question *copied = [[Question alloc] init];
    copied.uid = uid;
    copied.question = [question copy];
    copied.answer = [answer copy];
    copied.internalKeywords = [internalKeywords copy];
    copied.externalKeywords = [externalKeywords copy];
    copied.targets = [targets copy];
    copied.ages = [ages copy];
    copied.votes = votes;
    return copied;
}

@end
