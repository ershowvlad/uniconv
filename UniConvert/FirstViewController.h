//
//  FirstViewController.h
//  UniConvert
//
//  Created by admin on 12.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{
    CGFloat currency[4];
    CGFloat Rate;
    Byte sorcRow, destRow, editingAlertIndex;
}

@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSArray *dataSource;
@property (retain, nonatomic) IBOutlet UITextField *sField;
@property (retain, nonatomic) IBOutlet UITextField *dField;

- (IBAction)infoButtonPress:(id)sender;
- (IBAction)convertButtonPress:(id)sender;
- (IBAction)editButtonPress:(id)sender;
- (IBAction)editingDone:(id)sender;

-(CGFloat)Rate:( CGFloat ) src:( CGFloat ) dst;

@end
