//
//  BUGKeyViewController.m
//  KeyboardBug
//

#import "PersonalInformationViewController.h"

@interface PersonalInformationViewController () {
    NSArray *_pickerData;
    NSUserDefaults *defaults;
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
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // Set white text style of titleBar, add Panda
    self.navigationController.navigationBar.barTintColor =
    [UIColor colorWithRed:0 green:0.149 blue:0.314 alpha:1];
    // TODO can remove below line?
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = FALSE;
    
//    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0.149 blue:0.314 alpha:1]]; /*#002650*/
    
    [self setupInterface];
    
}

// TODO Move this data to a UserInformation object, use NSUserDefaults on this object.
-(void)setupInterface {
    defaults = [NSUserDefaults standardUserDefaults];
    
    _pickerData = @[@"Lesbian", @"Gay", @"Straight", /*@"Transgender", */@"Bi-sexual", @"Queer"];
    [sexualityPicker setDelegate:self];
    [sexualityPicker setDataSource:self];
    
    [maleFemale setSelectedSegmentIndex:0];
    [maleFemale addTarget:self action:@selector(sexChanged:) forControlEvents:UIControlEventValueChanged];
    
    // Load from NSUSerDefaults
    [sexualityPicker selectRow:[defaults integerForKey:@"sexualityPicker"] inComponent:0 animated:NO];
    [maleFemale setSelectedSegmentIndex:[defaults integerForKey:@"sex"]];
    [age setText:[NSString stringWithFormat:@"%d", (int)[defaults integerForKey:@"age"]]];
}

// Sexuality Picker
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Changed sexuality");
    [defaults setInteger:row forKey:@"sexualityPicker"];
    [defaults synchronize];
}

// Sex picker
- (void)sexChanged:(UISegmentedControl *)segment {
    if(segment.selectedSegmentIndex == 0) {
        NSLog(@" Female ");
    }else if(segment.selectedSegmentIndex == 1){
        NSLog(@" Male ");
    }
    [defaults setInteger:segment.selectedSegmentIndex forKey:@"sex"];
    [defaults synchronize];
}

// Age
- (IBAction)changedAge {
    [age resignFirstResponder];
    [defaults setInteger:[[age text] intValue] forKey:@"age"];
    [defaults synchronize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}



@end
