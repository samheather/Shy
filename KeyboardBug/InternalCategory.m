//
//  InternalCategory.m
//  Shy
//
//  Created by Samuel B Heather on 08/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import "InternalCategory.h"

@implementation InternalCategory

@synthesize categoryName, categoryChevronColour;

- (id)initWithName:(NSString *)inputName
     chevronColour:(UIColor*)inputColor {
    self = [super init];
    if (self) {
        categoryName = inputName;
        categoryChevronColour = inputColor;
    }
    return self;
}

@end
