//
//  BUGViewController.m
//  KeyboardBug
//

#import "BUGViewController.h"
#import "BUGKeyViewController.h"

@interface BUGViewController ()

@end

@implementation BUGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showKeyboardView:(id)sender
{
    BUGKeyViewController *keyboardViewController = [[BUGKeyViewController alloc] initWithNibName:@"BUGKeyViewController" bundle:nil];
    [self.navigationController pushViewController:keyboardViewController animated:YES];
}

@end
