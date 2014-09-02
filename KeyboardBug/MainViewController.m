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
    qs = [[Questions alloc] init];
    [qs loadQuestions];
    
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(testDataPull) userInfo:nil repeats:NO];
}

- (void)testDataPull {
    NSLog(@"Doing test data pull");
    Question *q0 = [qs getQuestionWithIndex:0];
//    Question *q1 = [qs getQuestionWithIndex:1];
//    NSLog([q0 answer]);
    QuestionStickerView *qsv0 = [[QuestionStickerView alloc] initWithQuestion:q0 withHeight:heightOfCard withIndex:0];
//    QuestionStickerView *qsv1 = [[QuestionStickerView alloc] initWithQuestion:q1 withHeight:heightOfCard withIndex:1];
    [cardScrollView addSubview:[qsv0 theView]];
//    [cardScrollView addSubview:[qsv1 theView]];
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
