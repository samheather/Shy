//
//  BUGKeyViewController.h
//  KeyboardBug
//

#import <UIKit/UIKit.h>

@interface PersonalInformationViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    IBOutlet UISegmentedControl *maleFemale;
    IBOutlet UIPickerView *sexualityPicker;
    IBOutlet UITextField *age;
    
}

@end
