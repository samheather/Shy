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
#import "InitialSetup.h"
#import "InternalCategory.h"

@interface BUGViewController ()

@end

@implementation BUGViewController

UIButton *pandaView;
InitialSetup *initialSetup;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0.149 blue:0.314 alpha:1]]; /*#002650*/
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar
//     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    pandaView = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-31,0,32,44)];
    [pandaView setImage:[UIImage imageNamed:@"panda-small"] forState:UIControlStateNormal];
    [pandaView addTarget:self action:@selector(hidePanda) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:pandaView];
    //    [self.navigationController.view addSubview:pandaView];
    
    [categoriesScrollView.layer setCornerRadius:3.0];
    [categoriesImageView.layer setMasksToBounds:TRUE];
    [categoriesScrollView setBackgroundColor:[UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1]]; /*#f3f3f3*/
    
    [searchBar setSearchBarStyle:UISearchBarStyleMinimal];
    
    initialSetup = [[InitialSetup alloc] init];
    for (int i = 0; i<[[initialSetup categories] count]; i++) {
        NSLog(@"Adding a button");
        InternalCategory *thisCategory = [[initialSetup categories] objectAtIndex:i];
        UIButton *thisButton = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                                44+(i*44),
                                                                categoriesScrollView.frame.size.width,
                                                                44)];
        [thisButton setBackgroundColor:[UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1]];
        [thisButton setTitle:[thisCategory categoryName] forState:UIControlStateNormal];
        [[thisButton titleLabel] setFont:[UIFont fontWithName:@"Helvetica" size:18]];
        [thisButton setTitleColor:[UIColor colorWithRed:0.29 green:0.29 blue:0.29 alpha:1] forState:UIControlStateNormal]; // #4a4a4a
        thisButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        thisButton.contentEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 0);
        // Sqaure
        int squareSize = 44;
        UIImageView *square = [[UIImageView alloc] initWithFrame:CGRectMake(categoriesScrollView.frame.size.width-squareSize,
                                                                            0,
                                                                            squareSize,
                                                                            squareSize)];
        [square setUserInteractionEnabled:FALSE];
        [square setBackgroundColor:[thisCategory categoryChevronColour]];
        [square setImage:[UIImage imageNamed:@"chevron"]];
        
        // Dividing line
        UIView *dividingLine = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                        0,
                                                                        thisButton.frame.size.width-44,
                                                                        0.5)];
        [dividingLine setBackgroundColor:[UIColor grayColor]];
        [thisButton addSubview:dividingLine];
        
        [thisButton addSubview:square];
        [thisButton addTarget:self action:@selector(categoryPushed:) forControlEvents:UIControlEventTouchUpInside];
        [categoriesScrollView addSubview:thisButton];
    }
    
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

-(void)categoryPushed:(id)sender {
    UIButton *button = (UIButton *)sender;
    [self openCategory:button.currentTitle];
}

// TODO below hard coded category to Sex.
-(void)openCategory:(NSString *)category {
    CategoryViewController *categoryViewController = [[CategoryViewController alloc] initWithNibName:@"CategoryViewController" bundle:nil category:category];
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
    [self.navigationController setNavigationBarHidden:TRUE animated:TRUE];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:FALSE animated:TRUE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
