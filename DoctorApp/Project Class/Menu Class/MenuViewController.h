//
//  MenuViewController.h
//  DoctorApp
//
//  Created by Debasish on 07/09/14.
//  Copyright (c) 2014 Debasish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : BaseViewController
- (IBAction)btnActionHome:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnHome;
- (IBAction)btnActionPatient:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnPatient;
@property (weak, nonatomic) IBOutlet UITableView *tblVwMenu;

@property (nonatomic, strong) NSArray *menuTitle;
@property (nonatomic, strong) NSArray *menuImage;

@end
