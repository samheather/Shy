//
//  BUGViewController.m
//  KeyboardBug
//

#import "MainViewController.h"
#import "PersonalInformationViewController.h"
#import "Question.h"
#import "Questions.h"

@interface BUGViewController ()

@end

@implementation BUGViewController

Questions *qs;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.796 green:0.796 blue:0.796 alpha:1]];
    qs = [[Questions alloc] init];
    [qs loadQuestions];
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(testDataPull) userInfo:nil repeats:NO];
}

- (void)testDataPull {
    NSLog(@"Doing test data pull");
    Question *q = [qs getQuestionWithIndex:0];
    NSLog([q answer]);
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
