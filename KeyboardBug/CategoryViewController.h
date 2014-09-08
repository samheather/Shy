//
//  CategoryViewController.h
//  Shy
//
//  Created by Samuel B Heather on 07/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UIViewController {
    IBOutlet UIScrollView *cardScrollView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil category:(NSString *)inputCategory;
-(void)greyOutBackground;

@end