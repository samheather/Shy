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
Questions *questions;
//QuestionStickerView *expandedView;
UIButton *greyOutTop;
UIButton *greyOutMain;
NSString *category;

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
        withQuestions:(Questions *)inputQuestions
             category:(NSString *)inputCategory
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        category = inputCategory;
        questions = inputQuestions;
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
    
    [self.navigationController setTitle:@"Back"];
    [self setTitle:category];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [searchBar setPlaceholder:@"What are you shy about?"];
    [cardScrollView addSubview:searchBar];
    [cardScrollView setContentSize:(CGSizeMake(320, 1000))];
    
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(testDataPull) userInfo:nil repeats:NO];
    [self createCards];
}

- (void)createCards {
    for (int i = 0; i<[questions numberOfQuestions]; i++) {
        QuestionSticker *qsv = [[QuestionSticker alloc] initWithQuestion:[questions getQuestionWithIndex:i] withIndex:i];
        
        [qsv addTarget:self action:@selector(tapDown:) forControlEvents:UIControlEventTouchDown];
        [qsv addTarget:self action:@selector(tapUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [qsv addTarget:self action:@selector(tapUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
        [qsv addTarget:self action:@selector(tapUpOutside:) forControlEvents:UIControlEventTouchDragOutside];
        // TODO - this means if dragging inside it's 'deselected' - is this expected/desired behaviour?
        [qsv addTarget:self action:@selector(tapUpOutside:) forControlEvents:UIControlEventTouchDragInside];
        
        [cardScrollView addSubview:qsv];
        qsv = nil;
    }
}

-(void)tapDown:(id)selector {
    Question *abc = [[Question alloc] initWithUid:99 question:@"QQ" answer:@"AA" internalKeywords:@"" externalKeywords:@"" targets:@"" ageRange:@"14-18" numberOfVotes:799];
    [questions addQuestion:abc];
    
    QuestionSticker *temp = selector;
    [temp tapDown];
}

-(void)tapUpInside:(id)selector {
    QuestionSticker *temp = selector;
    [temp setBackgroundColor:[UIColor blueColor]];
    
    
    Question *questionToUse = [temp getQuestion];
//    NSLog(@"%d", [[temp getQuestion] uid]);
//    NSLog(@"");

    QuestionSticker *expanded = [[QuestionSticker alloc] initWithQuestion:questionToUse withIndex:-1];
    CGRect frameInUIView = [temp getFrameInUIView];
    [expanded setFrame:frameInUIView];
    [expanded setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:expanded];
    [temp setHidden:TRUE];
    
    [self greyOutBackground];
    [temp tapUpInside];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
