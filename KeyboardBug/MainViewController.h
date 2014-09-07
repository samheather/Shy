//
//  BUGViewController.h
//  KeyboardBug
//

#import <UIKit/UIKit.h>

@interface BUGViewController : UIViewController {
    IBOutlet UIScrollView *cardScrollView;
}

-(UIView *)getView;
-(void)greyOutBackground;

@end
