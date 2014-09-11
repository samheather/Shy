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
NSMutableArray *arrayOfQuestions;
//QuestionStickerView *expandedView;
UIButton *greyOutTop;
UIButton *greyOutMain;
NSString *category;
QuestionSticker *originalSticker;
QuestionSticker *expandedSticker;

// TODO PROTOTYPE DEMONSTRATION OF SEARCH ONLY
Questions *prototypeDemoQuestions;

UIButton *closeButton;

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
        withQuestions:(Questions *)inputQuestions
             category:(NSString *)inputCategory
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        category = inputCategory;
        arrayOfQuestions = [inputQuestions getQuestionsFromCategory:inputCategory];
        prototypeDemoQuestions = inputQuestions;
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
    self.navigationController.navigationBar.translucent = FALSE;
    
    [self.navigationController setTitle:@"Back"];
    [self setTitle:category];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [searchBar setPlaceholder:@"What are you shy about?"];
    searchBar.delegate = self;
    [cardScrollView addSubview:searchBar];
    [cardScrollView setContentSize:(CGSizeMake(320, (160*[arrayOfQuestions count])+140))];
    
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(testDataPull) userInfo:nil repeats:NO];
    [self createCards];
    
    [self setupGreyOutBackground];
    
    closeButton = [[UIButton alloc] initWithFrame:CGRectMake(120,26,80,20)];
    [closeButton setTitle:@"Close" forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeExpandedCard) forControlEvents:UIControlEventTouchUpInside];
    [greyOutMain addSubview:closeButton];
    [closeButton setHidden:TRUE];
}

- (void)createCards {
    for (int i = 0; i<[arrayOfQuestions count]; i++) {
        QuestionSticker *qsv = [[QuestionSticker alloc] initWithQuestion:[arrayOfQuestions objectAtIndex:i] withIndex:i];
        
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
    QuestionSticker *temp = selector;
    [temp tapDown];
}

-(void)tapUpInside:(id)selector {
    originalSticker = selector;
    
    Question *questionToUse = [originalSticker getQuestion];
    expandedSticker = [[QuestionSticker alloc] initWithQuestion:questionToUse withIndex:-1];
    CGRect frameInUIView = [originalSticker getFrameInUIView];
    // TODO - the below is a hacky fix for something I don't understand - views jumping.
    frameInUIView.origin.y = frameInUIView.origin.y-84;
    [expandedSticker setFrame:frameInUIView];
    [self.view addSubview:expandedSticker];
    [self.view bringSubviewToFront:expandedSticker];
    [originalSticker setHidden:TRUE];
    
    [expandedSticker expandAndGreyThis:greyOutTop andThis:greyOutMain];
    
    [self.view bringSubviewToFront:expandedSticker];
    
    [originalSticker tapUpInside];
    
    [closeButton setHidden:FALSE];
    [self.view bringSubviewToFront:closeButton];
}

-(void)tapUpOutside:(id)selector {
    QuestionSticker *temp = selector;
    [temp tapUpOutside];
}

-(void)setupGreyOutBackground {
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
}

-(void)closeExpandedCard {
    [expandedSticker contractAndUnGreyThis:greyOutTop andThis:greyOutMain];

    [originalSticker setHidden:FALSE];
    originalSticker = nil;
    
    [closeButton setHidden:TRUE];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
    [theSearchBar resignFirstResponder];
    
    // TODO PROTOTYPE DEMONSTRATION OF SEARCH ONLY
    CategoryViewController *categoryViewController = [[CategoryViewController alloc] initWithNibName:@"CategoryViewController"
                                                                                              bundle:nil
                                                                                       withQuestions:prototypeDemoQuestions
                                                                                            category:@"Rape"];
    [self.navigationController pushViewController:categoryViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
