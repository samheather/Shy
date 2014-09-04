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
UIButton *pandaView;
QuestionStickerView *expandedView;
UIButton *greyOutTop;
UIButton *greyOutMain;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.796 green:0.796 blue:0.796 alpha:1]];
    
    // Set white text style of titleBar, add Panda
    self.navigationController.navigationBar.barTintColor =
        [UIColor colorWithRed:0 green:0.149 blue:0.314 alpha:1];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    pandaView = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-31,20,32,44)];
    [pandaView setImage:[UIImage imageNamed:@"panda-small"] forState:UIControlStateNormal];
    [pandaView addTarget:self action:@selector(hidePanda) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:pandaView];

    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
//    [searchBar setText:@"What are you shy about?"];
//    [searchBar setPrompt:@"What are you shy about?"];
    [searchBar setPlaceholder:@"What are you shy about?"];
    [cardScrollView addSubview:searchBar];
    [cardScrollView setContentSize:(CGSizeMake(320, 1000))];
    
    qs = [[Questions alloc] init];
    [qs loadQuestions];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(testDataPull) userInfo:nil repeats:NO];
}

- (void)testDataPull {
    NSLog(@"Doing card creation, will fail if no data was pulled");
    
    Question *noInternetQuestion = [[Question alloc] initWithUid:0 question:@"Question" answer:@"Answer" internalKeywords:@"internal,keywords" externalKeywords:@"Sex,Health" targets:@"male,female" ageRange:@"14-18" numberOfVotes:4];
    [qs addQuestion:noInternetQuestion];
    
    NSLog(@"%d", [qs numberOfQuestions]);
    
    
    for (int i = 0; i<[qs numberOfQuestions]; i++) {
        QuestionStickerView *qsv = [[QuestionStickerView alloc] initWithQuestion:[qs getQuestionWithIndex:i] withHeight:heightOfCard withIndex:i isExpanded:FALSE];
        [[qsv theView] addTarget:self action:@selector(tapDown:) forControlEvents:UIControlEventTouchDown];
        [[qsv theView] addTarget:self action:@selector(tapUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [[qsv theView] addTarget:self action:@selector(tapUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
        [[qsv theView] addTarget:self action:@selector(tapUpOutside:) forControlEvents:UIControlEventTouchDragOutside];
        // TODO - this means if dragging inside it's 'deselected' - is this expected/desired behaviour?
        [[qsv theView] addTarget:self action:@selector(tapUpOutside:) forControlEvents:UIControlEventTouchDragInside];
        [cardScrollView addSubview:[qsv theView]];
    }
}

-(void)tapDown:(id)sender {
    // TODO - add light white opacity overlay over whole card when tapping and holding.
    UIButton *button = sender;
    button.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.98, 0.98);
}

-(void)tapUpInside:(id)sender {
    UIButton *button = sender;
    button.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
    
    // Grey out background
    // TODO change 40 below to the dynamic height of the top bar
    greyOutTop = [[UIButton alloc] initWithFrame:CGRectMake(0,0,
        self.view.frame.size.width,
        self.navigationController.navigationBar.frame.size.height+self.navigationController.navigationBar.frame.origin.y+1)]; // +1 for random thin white line.
    [greyOutTop setBackgroundColor:[UIColor blackColor]];
    [greyOutTop.layer setOpacity:0.0];
    [greyOutTop addTarget:self action:@selector(closeExpandedCard) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:greyOutTop];
    
    // TODO change 400 below to the dynamic height of the screen minus the top bar.
    greyOutMain = [[UIButton alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
    [greyOutMain setBackgroundColor:[UIColor blackColor]];
    [greyOutMain.layer setOpacity:0.0];
    [greyOutMain addTarget:self action:@selector(closeExpandedCard) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:greyOutMain];
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [greyOutTop.layer setOpacity:0.85];
                         [greyOutMain.layer setOpacity:0.85];
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];

    expandedView = [[QuestionStickerView alloc] initWithQuestion:[qs getQuestionWithIndex:0] withHeight:heightOfCard withIndex:0 isExpanded:true];
    [self.view addSubview:[expandedView theView]];
    [expandedView expandStickerView];
}

-(void)tapUpOutside:(id)sender {
    UIButton *button = sender;
    button.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
}

-(void)closeExpandedCard {
    [expandedView contractStickerView];
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [greyOutTop.layer setOpacity:0.0];
                         [greyOutMain.layer setOpacity:0.0];
                     }
                     completion:^(BOOL finished){
                     }];
}

-(void)hidePanda {
    NSLog(@"Animating panda");
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         CGPoint pandaCenter = pandaView.center;
                         pandaCenter.x = pandaCenter.x-3;
                         pandaView.center = pandaCenter;
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.5
                                               delay:0.0
                                             options: UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              CGPoint pandaCenter = pandaView.center;
                                              pandaCenter.x = pandaCenter.x+3+pandaView.frame.size.width;
                                              pandaView.center = pandaCenter;
                                          }
                                          completion:^(BOOL finished){
                                              [UIView animateWithDuration:4.0
                                                                    delay:5.0
                                                                  options: UIViewAnimationOptionCurveEaseOut
                                                               animations:^{
                                                                   CGPoint pandaCenter = pandaView.center;
                                                                   pandaCenter.x = pandaCenter.x-pandaView.frame.size.width;
                                                                   pandaView.center = pandaCenter;
                                                               }
                                                               completion:^(BOOL finished){
                                                                   // Done
                                                               }];
                                          }];
                     }];
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
