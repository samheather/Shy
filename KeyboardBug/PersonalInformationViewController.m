//
//  BUGKeyViewController.m
//  KeyboardBug
//

#import "PersonalInformationViewController.h"

@interface PersonalInformationViewController () {
    NSArray *_pickerData;
}

@end

@implementation PersonalInformationViewController

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
    // Do any additional setup after loading the view from its nib.
    [self setupInterface];
    
}

-(void)setupInterface {
    _pickerData = @[@"Straight", @"Gay", @"Lesbian", @"Transgender", @"Bi-sexual", @"Queer"];
    [sexualityPicker setDelegate:self];
    [sexualityPicker setDataSource:self];
    
    [maleFemale setSelectedSegmentIndex:0];
    [maleFemale addTarget:self action:@selector(sexChanged:) forControlEvents:UIControlEventValueChanged];
    
    [age addTarget:self action:@selector(setAge) forControlEvents:UIControlEventEditingDidEnd];
}

// Sexuality Picker

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Changed sexuality");
}

// Sex picker

- (void)sexChanged:(UISegmentedControl *)segment {
    if(segment.selectedSegmentIndex == 0) {
        NSLog(@" Female ");
    }else if(segment.selectedSegmentIndex == 1){
        NSLog(@" Male ");
    }
}

// Age

- (void)setAge {
    NSLog(@"Age changed");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}



@end
