//
//  Questions.h
//  Shy
//
//  Created by Samuel B Heather on 01/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic) int uid;
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *answer;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) NSString *targets;
@property (nonatomic, strong) NSString *ages;
@property (nonatomic) int votes; // int?

@property (nonatomic, strong) NSMutableArray *splitKeywords;
@property (nonatomic, strong) NSMutableArray *splitTargets;
@property (nonatomic) int minAge;
@property (nonatomic) int maxAge;

- (id)initWithUid:(int)inputUid
         question:(NSString *)inputQuestion
           answer:(NSString *)inputAnswer
         keywords:(NSString *)inputKeywords
          targets:(NSString *)inputTargets
         ageRange:(NSString *)inputAges
    numberOfVotes:(int)inputVotes;

@end
