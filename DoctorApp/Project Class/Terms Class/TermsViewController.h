//
//  TermsViewController.h
//  DoctorApp
//
//  Created by Debasish on 07/09/14.
//  Copyright (c) 2014 Debasish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TermsViewController : BaseViewController
- (IBAction)btnActionAgree:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnAgree;
- (IBAction)btnActionDontAgree:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnDontAgree;
@property (weak, nonatomic) IBOutlet UITextView *txtVwAgree;

@end
