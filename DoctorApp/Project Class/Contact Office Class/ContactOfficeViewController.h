//
//  ContactOfficeViewController.h
//  DoctorApp
//
//  Created by Debasish on 06/10/14.
//  Copyright (c) 2014 Debasish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactOfficeViewController : UIViewController
- (IBAction)btnActionMessage:(id)sender;
- (IBAction)btnActionCall:(id)sender;
- (IBAction)btnActionCompass:(id)sender;
- (IBAction)btnActionGlobe:(id)sender;
- (IBAction)btnActionOK:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnOK;

@end
