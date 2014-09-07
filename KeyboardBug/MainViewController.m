//
//  BUGViewController.m
//  KeyboardBug
//

#import "MainViewController.h"
#import "PersonalInformationViewController.h"
#import "Question.h"
#import "Questions.h"
#import "QuestionSticker.h"
#import "CategoryViewController.h"

@interface BUGViewController ()

@end

@implementation BUGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0.149 blue:0.314 alpha:1]]; /*#002650*/
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController setNavigationBarHidden:YES];
    
    [categoriesScrollView.layer setCornerRadius:2.0];
    [categoriesScrollView setBackgroundColor:[UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1]]; /*#f3f3f3*/
    
    
    
}

// TODO below hard coded category to Sex.
-(void)openCategory:(NSString *)category {
    CategoryViewController *categoryViewController = [[CategoryViewController alloc] initWithNibName:@"CategoryViewController" bundle:nil category:@"Sex"];
    [self.navigationController pushViewController:categoryViewController animated:YES];
}

- (IBAction)showGetPersonalInfoView:(id)sender
{
    PersonalInformationViewController *personalInformationViewController = [[PersonalInformationViewController alloc] initWithNibName:@"PersonalInformationViewController" bundle:nil];
    [self.navigationController pushViewController:personalInformationViewController animated:YES];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
