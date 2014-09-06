//
//  LeftViewController.h
//  PPRevealSideViewController
//
//  Created by Marian PAUL on 16/02/12.
//  Copyright (c) 2012 Marian PAUL aka ipodishima — iPuP SARL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "MainViewController.h"
#import "MBProgressHUD.h"

@interface TableViewController : UITableViewController<MBProgressHUDDelegate>

@property (nonatomic, strong) NSArray *menuTitle;
@property (nonatomic, strong) NSArray *menuImage;
@property (retain,nonatomic) MBProgressHUD *HUD;
@property(strong,nonatomic)UINavigationController *n12;
@end
