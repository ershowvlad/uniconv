//
//  SecondViewController.m
//  UniConvert
//
//  Created by admin on 12.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize editingLabel;
@synthesize editingIndicator;
@synthesize tempSlider;
@synthesize tFiedLabel;
@synthesize tempField;
@synthesize cLabel;
@synthesize fLabel;
@synthesize kLabel;
@synthesize rLabel;
@synthesize R;
@synthesize dLabel;
@synthesize D;
@synthesize lLabel;
@synthesize L;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Temperature", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
	
-(void)temperature:( float ) tValue:( int ) tIndex{
    currentFieldValue = tValue;
    tempField.text = [[ NSString alloc] initWithFormat:@ "%.f", tValue];
    switch (tIndex) {
        case 0:
            tValue = tValue;
            tFiedLabel.text =@"C";
            break;
        case 1:
            tValue = tValue-273;
            tFiedLabel.text =@"K";
            break;
        case 2:
            tValue = (tValue-32)*0.55;
            tFiedLabel.text =@"F";
            break;
        default:
            break;
    }
    cLabel.text = [[ NSString alloc] initWithFormat:@ "%.f", tValue];
    fLabel.text = [[ NSString alloc] initWithFormat:@ "%.1f", tValue*1.8+32];
    kLabel.text = [[ NSString alloc] initWithFormat:@ "%.f", tValue+273];
    rLabel.text = [[ NSString alloc] initWithFormat:@ "%.1f", tValue*0.8];
    dLabel.text = [[ NSString alloc] initWithFormat:@ "%.1f", (100-tValue)*1.5];
    lLabel.text = [[ NSString alloc] initWithFormat:@ "%.1f",tValue+253];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self initialize];
    editingIndicator.hidesWhenStopped = TRUE;
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)tempSliderChanged:(id)sender {
    UISlider *slider = (UISlider *) sender;
    [self temperature:(float)slider.value :tempIndex];
}

- (IBAction)tempDown:(id)sender {
    [self animationStart];
    [self performSelector:@selector(animationStop) withObject:self afterDelay:1.5];
}

-(void)animationStop {
    editingLabel.hidden = TRUE;
    [editingIndicator stopAnimating];
}

-(void)animationStart {
    editingLabel.hidden = FALSE;
    [editingIndicator startAnimating];
}
    
-(void)initialize{
    tempIndex = 0;
    tempSlider.minimumValue = 0;
    tempSlider.maximumValue = 100;
    [self temperature:tempSlider.value = (tempSlider.maximumValue-tempSlider.minimumValue)*0.5:tempIndex];
}

- (void)viewDidUnload
{
    [self setCLabel:nil];
    [self setFLabel:nil];
    [self setKLabel:nil];
    [self setRLabel:nil];
    [self setR:nil];
    [self setDLabel:nil];
    [self setD:nil];
    [self setLLabel:nil];
    [self setL:nil];
    [self setTempField:nil];
    [self setTFiedLabel:nil];
    [self setTempSlider:nil];
    [self setEditingIndicator:nil];
    [self setEditingLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)exSwitchChanged:(UISwitch*)sender {
    if (sender.on){
        rLabel.hidden = FALSE;
        R.hidden = FALSE;
        dLabel.hidden = FALSE;
        D.hidden = FALSE;
        lLabel.hidden = FALSE;
        L.hidden = FALSE;
    }
    else{
        rLabel.hidden = TRUE;
        R.hidden = TRUE;
        dLabel.hidden = TRUE;
        D.hidden = TRUE;
        lLabel.hidden = TRUE;
        L.hidden = TRUE;
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

- (IBAction)tempSelect:(id)sender {
    tempIndex = [sender selectedSegmentIndex];
    [self temperature:currentFieldValue :tempIndex];
}

- (void)dealloc {
    [cLabel release];
    [fLabel release];
    [kLabel release];
    [rLabel release];
    [R release];
    [dLabel release];
    [D release];
    [lLabel release];
    [L release];
    [tempField release];
    [tFiedLabel release];
    [tempSlider release];
    [editingIndicator release];
    [editingLabel release];
    [super dealloc];
}
@end
