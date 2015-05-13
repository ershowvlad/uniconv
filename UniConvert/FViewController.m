//
//  FViewController.m
//  UniConvert
//
//  Created by admin on 17.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FViewController.h"

@interface FViewController ()

@end

@implementation FViewController

@synthesize factProgress;
@synthesize factResLabel;
@synthesize factNumField;
@synthesize infoFactView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Factorial", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    factNumber = 0;
    factNumField.text = [NSString stringWithFormat:@"%d", factNumber];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setInfoFactView:nil];
    [self setFactNumField:nil];
    [self setFactResLabel:nil];
    [self setFactProgress:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)infoFButtonPress:(id)sender {
    infoFactView.hidden = FALSE;
}

- (IBAction)factButtonPress:(id)sender {
    factNumber = [factNumField.text floatValue];
    NSInteger fractValue = 1;
    for (NSInteger i = 1; i <= factNumber; i++) {
        fractValue *= i;
        factProgress.progress = (CGFloat)i/(factNumber);
    }
    factResLabel.text = [NSString stringWithFormat:@"%d", fractValue];
}

- (IBAction)fstepperChanged:(UIStepper *)sender {
    NSUInteger value = sender.value;
    factProgress.progress = 0;
    if (value == 10) {
        sender.value = value - 1;
        UIAlertView *infoAlert = [[UIAlertView alloc] initWithTitle:@"Warning!" 
                                                            message:@"Chosen value is too big!" 
                                                           delegate:self 
                                                  cancelButtonTitle:@"OK" 
                                                  otherButtonTitles:nil];
        [infoAlert show];
        [infoAlert release];
            } else {
                factNumField.text = [NSString stringWithFormat:@"%d",value];
                    }
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

- (void)dealloc {
    [infoFactView release];
    [factNumField release];
    [factResLabel release];
    [factProgress release];
    [super dealloc];
}
@end
