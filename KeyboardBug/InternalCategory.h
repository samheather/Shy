//
//  InternalCategory.h
//  Shy
//
//  Created by Samuel B Heather on 08/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InternalCategory : NSObject

@property(nonatomic, strong) NSString *categoryName;
@property(nonatomic, strong) UIColor *categoryChevronColour;

- (id)initWithName:(NSString *)inputName
     chevronColour:(UIColor*)inputColor;

@end