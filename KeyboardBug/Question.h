//
//  Questions.h
//  Shy
//
//  Created by Samuel B Heather on 01/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject <NSCopying>

@property (nonatomic) int uid;
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *answer;
@property (nonatomic, strong) NSString *internalKeywords;
@property (nonatomic, strong) NSString *externalKeywords;
@property (nonatomic, strong) NSString *targets;
@property (nonatomic, strong) NSString *ages;
@property (nonatomic) int votes; // int?

@property (nonatomic, strong) NSMutableArray *splitInternalKeywords;
@property (nonatomic, strong) NSMutableArray *splitExternalKeywords;
@property (nonatomic, strong) NSMutableArray *splitTargets;
@property (nonatomic) int minAge;
@property (nonatomic) int maxAge;

- (id)initWithUid:(int)inputUid
         question:(NSString *)inputQuestion
           answer:(NSString *)inputAnswer
 internalKeywords:(NSString *)inputInternalKeywords
 externalKeywords:(NSString *)inputExternalKeywords
          targets:(NSString *)inputTargets
         ageRange:(NSString *)inputAges
    numberOfVotes:(int)inputVotes;

-(id) copyWithZone:(NSZone *) zone;

@end
