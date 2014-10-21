//
//  VisitOfficeViewController.h
//  DoctorApp
//
//  Created by Debasish on 06/10/14.
//  Copyright (c) 2014 Debasish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VisitOfficeViewController : UIViewController

- (IBAction)btnActionMessage:(id)sender;
- (IBAction)btnActionMail:(id)sender;
- (IBAction)btnActionFacebook:(id)sender;
- (IBAction)btnActionTwitter:(id)sender;
- (IBAction)btnActionCancel:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *vwMiddle;
@property (weak, nonatomic) IBOutlet UIView *vwBottom;

@end
