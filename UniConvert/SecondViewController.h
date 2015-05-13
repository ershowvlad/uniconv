//
//  SecondViewController.h
//  UniConvert
//
//  Created by admin on 12.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController{
    NSInteger tempIndex;
    float currentFieldValue;
}
- (IBAction)exSwitchChanged:(UISwitch*)sender;
- (IBAction)infoButtonPress:(id)sender;
- (IBAction)tempSelect:(id)sender;
- (IBAction)tempSliderChanged:(id)sender;
- (IBAction)tempDown:(id)sender;

@property (retain, nonatomic) IBOutlet UILabel *editingLabel;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *editingIndicator;
@property (retain, nonatomic) IBOutlet UISlider *tempSlider;
@property (retain, nonatomic) IBOutlet UILabel *tFiedLabel;
@property (retain, nonatomic) IBOutlet UITextField *tempField;
@property (retain, nonatomic) IBOutlet UILabel *cLabel;
@property (retain, nonatomic) IBOutlet UILabel *fLabel;
@property (retain, nonatomic) IBOutlet UILabel *kLabel;
@property (retain, nonatomic) IBOutlet UILabel *rLabel;
@property (retain, nonatomic) IBOutlet UILabel *R;//Reaumur
@property (retain, nonatomic) IBOutlet UILabel *dLabel;
@property (retain, nonatomic) IBOutlet UILabel *D;//Delisle
@property (retain, nonatomic) IBOutlet UILabel *lLabel;
@property (retain, nonatomic) IBOutlet UILabel *L;//Leiden

-(void)initialize;
-(void)animationStart;
-(void)animationStop;
-(void)temperature:( float ) tValue:( int ) tIndex;

@end
