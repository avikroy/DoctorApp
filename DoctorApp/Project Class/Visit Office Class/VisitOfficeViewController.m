//
//  VisitOfficeViewController.m
//  DoctorApp
//
//  Created by Debasish on 06/10/14.
//  Copyright (c) 2014 Debasish. All rights reserved.
//

#import "VisitOfficeViewController.h"

@interface VisitOfficeViewController ()

@end

@implementation VisitOfficeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (iphoneTallScreen())
    {
    }
    else
    {
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.1"))
        {
            self.vwMiddle.frame = CGRectMake(self.vwMiddle.frame.origin.x,self.vwMiddle.frame.origin.y-88.0,self.vwMiddle.frame.size.width,self.vwMiddle.frame.size.height);
             self.vwBottom.frame = CGRectMake(self.vwBottom.frame.origin.x,self.vwBottom.frame.origin.y-88.0,self.vwBottom.frame.size.width,self.vwBottom.frame.size.height);
        }
        else if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
        {
        }
        else
        {
            self.vwMiddle.frame = CGRectMake(self.vwMiddle.frame.origin.x,self.vwMiddle.frame.origin.y-88.0,self.vwMiddle.frame.size.width,self.vwMiddle.frame.size.height);
            self.vwBottom.frame = CGRectMake(self.vwBottom.frame.origin.x,self.vwBottom.frame.origin.y-88.0,self.vwBottom.frame.size.width,self.vwBottom.frame.size.height);        }
    }

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnActionMessage:(id)sender {
}

- (IBAction)btnActionMail:(id)sender {
}

- (IBAction)btnActionFacebook:(id)sender {
}

- (IBAction)btnActionTwitter:(id)sender {
}

- (IBAction)btnActionCancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
