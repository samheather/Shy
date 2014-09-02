//
//  BUGViewController.m
//  KeyboardBug
//

#import "MainViewController.h"
#import "PersonalInformationViewController.h"
#import "Question.h"
#import "Questions.h"
#import "QuestionStickerView.h"

@interface BUGViewController ()

@end

@implementation BUGViewController

int heightOfCard = 150;
Questions *qs;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.796 green:0.796 blue:0.796 alpha:1]];
    
    // Set white text style of titleBar, add Panda
    self.navigationController.navigationBar.barTintColor =
        [UIColor colorWithRed:0 green:0.149 blue:0.314 alpha:1];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"panda-small"]];
    imageView.frame = CGRectMake(self.view.frame.size.width-40,24,40,40);
    [self.navigationController.view addSubview:imageView];
    //////
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
//    [searchBar setText:@"What are you shy about?"];
//    [searchBar setPrompt:@"What are you shy about?"];
    [searchBar setPlaceholder:@"What are you shy about?"];
    [cardScrollView addSubview:searchBar];
    [cardScrollView setContentSize:(CGSizeMake(320, 1000))];
    
    qs = [[Questions alloc] init];
    [qs loadQuestions];
    
    [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(testDataPull) userInfo:nil repeats:NO];
}

- (void)testDataPull {
    NSLog(@"Doing test data pull");
    for (int i = 0; i<[qs numberOfQuestions]; i++) {
        [cardScrollView addSubview:[[[QuestionStickerView alloc] initWithQuestion:[qs getQuestionWithIndex:i] withHeight:heightOfCard withIndex:i] theView]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showGetPersonalInfoView:(id)sender
{
    PersonalInformationViewController *personalInformationViewController = [[PersonalInformationViewController alloc] initWithNibName:@"PersonalInformationViewController" bundle:nil];
    [self.navigationController pushViewController:personalInformationViewController animated:YES];
}

@end
