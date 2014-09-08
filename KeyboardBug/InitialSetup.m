//
//  InitialSetup.m
//  Shy
//
//  Created by Samuel B Heather on 08/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import "InitialSetup.h"
#import "InternalCategory.h"

@implementation InitialSetup

@synthesize categories;

- (id)init {
    self = [super init];
    if (self) {
        [categories
         addObject:[[InternalCategory alloc]
                    initWithName:@"Friends"
                    chevronColour:
                    [UIColor colorWithRed:1 green:0.682 blue:0 alpha:1]]]; //#ffae00
        
        [categories
         addObject:[[InternalCategory alloc]
                    initWithName:@"Family"
                    chevronColour:
                    [UIColor colorWithRed:1 green:0.278 blue:0 alpha:1]]]; //#ff4700
        
        [categories
         addObject:[[InternalCategory alloc]
                    initWithName:@"Sex"
                    chevronColour:
                    [UIColor colorWithRed:0.737 green:0 blue:0.392 alpha:1]]]; //#bc0064
        
        [categories
         addObject:[[InternalCategory alloc]
                    initWithName:@"Relationships"
                    chevronColour:
                    [UIColor colorWithRed:0.486 green:0 blue:0.443 alpha:1]]]; //#7c0071
        
        [categories
         addObject:[[InternalCategory alloc]
                    initWithName:@"Your Body"
                    chevronColour:
                    [UIColor colorWithRed:0.298 green:0.314 blue:0.788 alpha:1]]]; //#4c50c9
        
        [categories
         addObject:[[InternalCategory alloc]
                    initWithName:@"Feelings"
                    chevronColour:
                    [UIColor colorWithRed:0.255 green:0.008 blue:0.506 alpha:1]]]; //#410281
        
        [categories
         addObject:[[InternalCategory alloc]
                    initWithName:@"School"
                    chevronColour:
                    [UIColor colorWithRed:0 green:0.71 blue:0.722 alpha:1]]]; //#00b5b8
        
        [categories
         addObject:[[InternalCategory alloc]
                    initWithName:@"Health"
                    chevronColour:
                    [UIColor colorWithRed:0.463 green:0.733 blue:0 alpha:1]]]; //#76bb00
        
        [categories
         addObject:[[InternalCategory alloc]
                    initWithName:@"Drugs & Alcohol"
                    chevronColour:
                    [UIColor colorWithRed:0.204 green:0.396 blue:0 alpha:1]]]; //#346500
    }
    return self;
}

@end
