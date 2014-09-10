//
//  BUGViewController.h
//  KeyboardBug
//

#import <UIKit/UIKit.h>

@interface BUGViewController : UIViewController <UISearchBarDelegate> {
    IBOutlet UIImageView *categoriesImageView;
    IBOutlet UIScrollView *categoriesScrollView;
    IBOutlet UISearchBar *searchBar;
    IBOutlet UIView *loadingView;
}

@end
