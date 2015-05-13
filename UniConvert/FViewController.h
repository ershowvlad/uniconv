//
//  FViewController.h
//  UniConvert
//
//  Created by admin on 17.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FViewController : UIViewController{
    NSInteger factNumber;
}

- (IBAction)infoFButtonPress:(id)sender;
- (IBAction)factButtonPress:(id)sender;
- (IBAction)fstepperChanged:(UIStepper *)sender;
- (IBAction)infoButtonPress:(id)sender;

@property (retain, nonatomic) IBOutlet UIProgressView *factProgress;
@property (retain, nonatomic) IBOutlet UILabel *factResLabel;
@property (retain, nonatomic) IBOutlet UITextField *factNumField;
@property (retain, nonatomic) IBOutlet UITextView *infoFactView;
@end
