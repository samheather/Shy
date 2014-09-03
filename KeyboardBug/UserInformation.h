//
//  UserInformation.h
//  Shy
//
//  Created by Samuel B Heather on 03/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInformation : NSObject

@property (nonatomic) int sex; // 0 = Female, 1 = Male
@property (nonatomic) int sexuality;
@property (nonatomic) int age;
@property (nonatomic) NSMutableDictionary *likedKeywords;
@property (nonatomic) NSMutableDictionary *readArticles; // Key: questionID, value: last time read.

- (id)initWithSex:(int)inputSex
     andSexuality:(int)inputSexuality
           andAge:(int)inputAge
 andLikedKeywords:(NSMutableDictionary *)inputLikedKeywords
  andReadArticles:(NSMutableDictionary *)likedReadArticles;

@end
