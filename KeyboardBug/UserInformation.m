//
//  UserInformation.m
//  Shy
//
//  Created by Samuel B Heather on 03/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation

@synthesize sex, sexuality, age, likedKeywords, readArticles;

- (id)initWithSex:(int)inputSex
     andSexuality:(int)inputSexuality
           andAge:(int)inputAge
 andLikedKeywords:(NSMutableDictionary *)inputLikedKeywords
  andReadArticles:(NSMutableDictionary *)inputReadArticles {
    self = [super init];
    if (self) {
        // Initialise
        self.sex = inputSex;
        self.sexuality = inputSexuality;
        self.age = inputAge;
        self.likedKeywords = inputLikedKeywords;
        self.readArticles = inputReadArticles;
    }
    return self;
}

-(void)addLikedKeyword:(NSString *)keyword {
    if ([likedKeywords objectForKey:keyword]) {
        int newValue = [[likedKeywords objectForKey:keyword] intValue]+1;
        [likedKeywords setObject:[NSString stringWithFormat:@"%d", newValue] forKey:keyword];
    }
    else {
        [likedKeywords setObject:@"1" forKey:keyword];
    }
}

-(void)addReadArticle:(int)articleID {
    NSString *key = [NSString stringWithFormat:@"%d", articleID];
    [readArticles setValue:[NSDate date] forKey:key];
}

// Cleans out the ReadArticles for reads that are 60 days old.
-(void)maintenance {
    NSDate *now = [NSDate date];
    for (NSString *key in readArticles) {
        if ([self daysBetweenDate:[readArticles objectForKey:key] andDate:now] > 60) {
            NSLog(@"Deleting object with ID: %@", key);
            [readArticles removeObjectForKey:key];
        }
    }
}

-(NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

@end
