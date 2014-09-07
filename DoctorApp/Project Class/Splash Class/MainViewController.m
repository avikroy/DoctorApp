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
    
    
    if (iphoneTallScreen())
    {
    }
    else
    {
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.1"))
        {
            self.btnSlide.frame = CGRectMake(self.btnSlide.frame.origin.x,self.btnSlide.frame.origin.y-28.0,self.btnSlide.frame.size.width,self.btnSlide.frame.size.height);
        }
        else if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
        {
        }
        else
        {
            self.btnSlide.frame = CGRectMake(self.btnSlide.frame.origin.x,self.btnSlide.frame.origin.y-28.0,self.btnSlide.frame.size.width,self.btnSlide.frame.size.height);

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
