//
//  CategoryViewController.h
//  Shy
//
//  Created by Samuel B Heather on 07/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Questions.h"

@interface CategoryViewController : UIViewController <UISearchBarDelegate> {
    IBOutlet UIScrollView *cardScrollView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
        withQuestions:(Questions *)inputQuestions
             category:(NSString *)inputCategory;
-(void)setupGreyOutBackground;
-(void)createCards;

@end
