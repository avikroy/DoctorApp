//
//  AppDelegate.h
//  DoctorApp
//
//  Created by Debasish on 04/09/14.
//  Copyright (c) 2014 Debasish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,PPRevealSideViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic)MainViewController *mainVC;

@property(nonatomic,strong)UINavigationController *navigation;
@property (strong, nonatomic) PPRevealSideViewController *revealSideViewController;


@end
