//
//  BUGKeyViewController.m
//  KeyboardBug
//

#import "BUGKeyViewController.h"

@interface BUGKeyViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation BUGKeyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 44)];
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.textField.keyboardAppearance = UIKeyboardAppearanceDark;
    [self.view addSubview:self.textField];
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.textField becomeFirstResponder];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
