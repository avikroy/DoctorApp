//
//  MainViewController.m
//  DoctorApp
//
//  Created by Debasish on 04/09/14.
//  Copyright (c) 2014 Debasish. All rights reserved.
//

#import "MainViewController.h"
#import "TermsViewController.h"
#import "AppDelegate.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
     [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager startUpdatingLocation];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    if (iphoneTallScreen())
    {
    }
    else
    {
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.1"))
        {
            self.btnSlide.frame = CGRectMake(self.btnSlide.frame.origin.x,self.btnSlide.frame.origin.y-58.0,self.btnSlide.frame.size.width,self.btnSlide.frame.size.height);
            self.lblTopName.frame = CGRectMake(self.lblTopName.frame.origin.x,self.lblTopName.frame.origin.y-28.0,self.lblTopName.frame.size.width,self.lblTopName.frame.size.height);
            self.lblDegree.frame = CGRectMake(self.lblDegree.frame.origin.x,self.lblDegree.frame.origin.y-28.0,self.lblDegree.frame.size.width,self.lblDegree.frame.size.height);
            self.lblMidName.frame = CGRectMake(self.lblMidName.frame.origin.x,self.lblMidName.frame.origin.y-33.0,self.lblMidName.frame.size.width,self.lblMidName.frame.size.height);
            self.lblBottomName.frame = CGRectMake(self.lblBottomName.frame.origin.x,self.lblBottomName.frame.origin.y-38.0,self.lblBottomName.frame.size.width,self.lblBottomName.frame.size.height);
            self.imgVwLogo.frame = CGRectMake(self.imgVwLogo.frame.origin.x,self.imgVwLogo.frame.origin.y-28.0,self.imgVwLogo.frame.size.width,self.imgVwLogo.frame.size.height);

        }
        else if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
        {
        }
        else
        {
            self.btnSlide.frame = CGRectMake(self.btnSlide.frame.origin.x,self.btnSlide.frame.origin.y-58.0,self.btnSlide.frame.size.width,self.btnSlide.frame.size.height);
            self.lblTopName.frame = CGRectMake(self.lblTopName.frame.origin.x,self.lblTopName.frame.origin.y-28.0,self.lblTopName.frame.size.width,self.lblTopName.frame.size.height);
            self.lblDegree.frame = CGRectMake(self.lblDegree.frame.origin.x,self.lblDegree.frame.origin.y-28.0,self.lblDegree.frame.size.width,self.lblDegree.frame.size.height);
            self.lblMidName.frame = CGRectMake(self.lblMidName.frame.origin.x,self.lblMidName.frame.origin.y-33.0,self.lblMidName.frame.size.width,self.lblMidName.frame.size.height);
            self.lblBottomName.frame = CGRectMake(self.lblBottomName.frame.origin.x,self.lblBottomName.frame.origin.y-38.0,self.lblBottomName.frame.size.width,self.lblBottomName.frame.size.height);
            self.imgVwLogo.frame = CGRectMake(self.imgVwLogo.frame.origin.x,self.imgVwLogo.frame.origin.y-28.0,self.imgVwLogo.frame.size.width,self.imgVwLogo.frame.size.height);

        }
    }

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnActionSlide:(id)sender
{
    TermsViewController *termsVC=[[TermsViewController alloc] initWithNibName:@"TermsViewController" bundle:nil];
    [self.navigationController pushViewController:termsVC animated:YES];
 
}
@end
