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

UIImageView *categoriesLogo;
UIScrollView *mainCategoryView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0.149 blue:0.314 alpha:1]]; /*#002650*/
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController setNavigationBarHidden:YES];
    
    /*
    int widthOfLogo = 141;
    int heightOfLogo = 88;
    categoriesLogo = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-widthOfLogo)/2,
                                                                   30,
                                                                   widthOfLogo,
                                                                   heightOfLogo)];
    [categoriesLogo setImage:[UIImage imageNamed:@"categories"]];
    [self.view addSubview:categoriesLogo];
    
    int border = 10;
    // TODO fix static 400 below.  TODO Fix -30 in param2 for height cutting off panda feet.
    mainCategoryView = [[UIScrollView alloc] initWithFrame:CGRectMake(border,
                                                                      categoriesLogo.frame.size.height+categoriesLogo.frame.origin.y-20,
                                                                      self.view.frame.size.width-(2*border),
                                                                      400)];
    [mainCategoryView setBackgroundColor:[UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1]]; //#f3f3f3
    [mainCategoryView.layer setCornerRadius:2.0];
    [self.view addSubview:mainCategoryView];*/
    
//    CategoryViewController *categoryViewController = [[CategoryViewController alloc] initWithNibName:@"CategoryViewController" bundle:nil];
//    [self.navigationController pushViewController:categoryViewController animated:YES];
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
