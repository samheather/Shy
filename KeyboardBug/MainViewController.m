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

UIButton *pandaView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0.149 blue:0.314 alpha:1]]; /*#002650*/
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    pandaView = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-31,0,32,44)];
    [pandaView setImage:[UIImage imageNamed:@"panda-small"] forState:UIControlStateNormal];
    [pandaView addTarget:self action:@selector(hidePanda) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:pandaView];
    //    [self.navigationController.view addSubview:pandaView];
    
    [categoriesScrollView.layer setCornerRadius:2.0];
    [categoriesScrollView setBackgroundColor:[UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1]]; /*#f3f3f3*/
    
    UIButton *friends = [[UIButton alloc] initWithFrame:CGRectMake(-1,
                                                                   44,
                                                                   categoriesScrollView.frame.size.width+1,
                                                                   44)];
    [friends setBackgroundColor:[UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1]];
    [friends setTitle:@"Friends" forState:UIControlStateNormal];
    [friends.layer setBorderWidth:0.4];
    [[friends titleLabel] setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [friends setTitleColor:[UIColor colorWithRed:0.29 green:0.29 blue:0.29 alpha:1] forState:UIControlStateNormal]; // #4a4a4a
    [friends.layer setBorderColor:[UIColor colorWithRed:0.592 green:0.592 blue:0.592 alpha:1].CGColor];
    friends.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    friends.contentEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 0);
    int squareSize = 44;
    // +1 for shadow offsetting the edge of scroll view.
    UIView *square = [[UIView alloc] initWithFrame:CGRectMake(categoriesScrollView.frame.size.width-squareSize+1,
                                                              0,
                                                              squareSize,
                                                              squareSize)];
    [square setBackgroundColor:[UIColor yellowColor]];
    [friends addTarget:self action:@selector(openCategory:) forControlEvents:UIControlEventTouchUpInside];
    [friends addSubview:square];
    [categoriesScrollView addSubview:friends];
    
    [self.navigationController setNavigationBarHidden:TRUE animated:FALSE];
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

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.navigationController setToolbarHidden:TRUE];
    [self.navigationController setNavigationBarHidden:TRUE animated:TRUE];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [self.navigationController setToolbarHidden:TRUE];
    [self.navigationController setNavigationBarHidden:FALSE animated:TRUE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
