//
//  CategoryViewController.m
//  Shy
//
//  Created by Samuel B Heather on 07/09/2014.
//  Copyright (c) 2014 Apple, Inc. All rights reserved.
//

#import "CategoryViewController.h"
#import "Question.h"
#import "Questions.h"
#import "QuestionSticker.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

int heightOfCard = 150;
Questions *qs;
UIButton *pandaView;
//QuestionStickerView *expandedView;
UIButton *greyOutTop;
UIButton *greyOutMain;

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
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.796 green:0.796 blue:0.796 alpha:1]];
    
    // Set white text style of titleBar, add Panda
    self.navigationController.navigationBar.barTintColor =
    [UIColor colorWithRed:0 green:0.149 blue:0.314 alpha:1];
    // TODO can remove below line?
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
    
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(testDataPull) userInfo:nil repeats:NO];
}

- (void)testDataPull {
    NSLog(@"Doing card creation, will fail if no data was pulled");
    
    //    Question *noInternetQuestion1 = [[Question alloc] initWithUid:0 question:@"Question1" answer:@"Answer1" internalKeywords:@"internal,keywords" externalKeywords:@"Sex,Health" targets:@"male,female" ageRange:@"14-18" numberOfVotes:4];
    //    [qs addQuestion:noInternetQuestion1];
    //    Question *noInternetQuestion2 = [[Question alloc] initWithUid:1 question:@"Question2" answer:@"Answer2" internalKeywords:@"internal,keywords" externalKeywords:@"Health" targets:@"female" ageRange:@"16-17" numberOfVotes:6];
    //    [qs addQuestion:noInternetQuestion2];
    
    
    NSLog(@"%d", [qs numberOfQuestions]);
    
    
    for (int i = 0; i<[qs numberOfQuestions]; i++) {
        QuestionSticker *qsv = [[QuestionSticker alloc] initWithQuestion:[qs getQuestionWithIndex:i] withIndex:i];
        
        [qsv addTarget:self action:@selector(tapDown:) forControlEvents:UIControlEventTouchDown];
        [qsv addTarget:self action:@selector(tapUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [qsv addTarget:self action:@selector(tapUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
        [qsv addTarget:self action:@selector(tapUpOutside:) forControlEvents:UIControlEventTouchDragOutside];
        // TODO - this means if dragging inside it's 'deselected' - is this expected/desired behaviour?
        [qsv addTarget:self action:@selector(tapUpOutside:) forControlEvents:UIControlEventTouchDragInside];
        
        [cardScrollView addSubview:qsv];
    }
}

-(void)tapDown:(id)selector {
    QuestionSticker *temp = selector;
    [temp tapDown];
}

-(void)tapUpInside:(id)selector {
    QuestionSticker *temp = selector;
    //    QuestionSticker *expanded = [[QuestionSticker alloc] initWithQuestion:<#(Question *)#> withIndex:<#(int)#>]
    [self greyOutBackground];
    [temp moveUp];
}

-(void)tapUpOutside:(id)selector {
    QuestionSticker *temp = selector;
    [temp tapUpOutside];
}

-(void)greyOutBackground {
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
}

-(void)closeExpandedCard {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [greyOutTop.layer setOpacity:0.0];
                         [greyOutMain.layer setOpacity:0.0];
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
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

@end
