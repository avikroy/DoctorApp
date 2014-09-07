//
//  MainViewController.h
//  DoctorApp
//
//  Created by Debasish on 04/09/14.
//  Copyright (c) 2014 Debasish. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface MainViewController : BaseViewController
{
    CLLocationManager *locationManager;
}
- (IBAction)btnActionSlide:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnSlide;

@end
