//
//  FirstViewController.m
//  UniConvert
//
//  Created by admin on 12.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize sField;
@synthesize dField;
@synthesize pickerView;
@synthesize dataSource;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Currency", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (IBAction)editingDone:(id)sender{
    [sender resignFirstResponder];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView 
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView 
numberOfRowsInComponent:(NSInteger)component 
{
    return dataSource.count;
}

- (NSString *)pickerView:(UIPickerView *)thePickerView 
             titleForRow:(NSInteger)row 
            forComponent:(NSInteger)component 
{
    return [dataSource objectAtIndex:row];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    sorcRow=0;
    destRow=0;
    Rate = [self Rate: 0:0];
    self.dataSource = [NSArray arrayWithObjects:
                       @"USD", 
                       @"EUR",
                       @"RUB",
                       @"UAH",nil];
    currency[0] = 8.00;  // USD
    currency[1] = 10.00; // EUR
    currency[2] = 0.25;  // RUR
    currency[3] = 1.00;  // UAH
}

- (void)viewDidUnload
{
    [self setSField:nil];
    [self setDField:nil];
    [super viewDidUnload];
    self.pickerView = nil;
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)infoButtonPress:(id)sender {
    {
        UIAlertView *infoAlert = [[UIAlertView alloc] initWithTitle:@"About:" 
                                                            message:@"Universal Converter 1.0" 
                                                           delegate:self 
                                                  cancelButtonTitle:@"OK" 
                                                  otherButtonTitles:nil];
        [infoAlert show];
        [infoAlert release];
    }
}

- (void)pickerView:(UIPickerView *)pV didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if     (component == 0)
        sorcRow = row;
    else if(component == 1)
        destRow = row;
    else
        ;
    Rate = [self Rate: currency[sorcRow]:currency[destRow]];
}

-(CGFloat)Rate:( CGFloat ) src:( CGFloat ) dst{
    if (src == dst) {
        return 1;
    }else {
        return src/dst;
    }
}

- (void)convertError{
    {
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Warning!" 
                                                            message:@"Use only numbers and ." 
                                                           delegate:self 
                                                  cancelButtonTitle:@"OK" 
                                                  otherButtonTitles:nil];
        [errorAlert show];
        [errorAlert release];
    }
}

- (IBAction)convertButtonPress:(id)sender {
    dField.text = [[NSString alloc]initWithFormat:@"%.2f",[sField.text floatValue]*Rate];
}

- (IBAction)editButtonPress:(id)sender {
    UIActionSheet *rateSheet = [[UIActionSheet alloc] initWithTitle:@"Select currency:" 
                                                          delegate:(id)self 
                                                 cancelButtonTitle:nil 
                                            destructiveButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"USD", 
                                                                    @"EUR",
                                                                    @"RUB", nil];
    [rateSheet showInView:self.view];
    [rateSheet release];
}

-(void)actionSheet:(UIActionSheet *)rateSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != 0) {
        UIAlertView *editCurrent = [[UIAlertView alloc] initWithTitle:@"Please enter new value"
                                                        message:@"It must be proportional to UAH:"
                                                       delegate:self 
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"OK", nil];
        editCurrent.alertViewStyle = UIAlertViewStylePlainTextInput;
        [editCurrent show];
        editingAlertIndex = buttonIndex;
        [editCurrent release];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        currency[editingAlertIndex-1] = [[[alertView textFieldAtIndex:0] text] floatValue];
    }
}

- (void)dealloc {
    [sField release];
    [dField release];
    [super dealloc];
}
@end
