//
//  ContactOfficeViewController.m
//  DoctorApp
//
//  Created by Debasish on 06/10/14.
//  Copyright (c) 2014 Debasish. All rights reserved.
//

#import "ContactOfficeViewController.h"

@interface ContactOfficeViewController ()

@end

@implementation ContactOfficeViewController

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
            self.btnOK.frame = CGRectMake(self.btnOK.frame.origin.x,440.0,self.btnOK.frame.size.width,self.btnOK.frame.size.height);
        }
        else if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
        {
        }
        else
        {
            self.btnOK.frame = CGRectMake(self.btnOK.frame.origin.x,440.0,self.btnOK.frame.size.width,self.btnOK.frame.size.height);
        }
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

- (IBAction)btnActionCall:(id)sender {
}

- (IBAction)btnActionCompass:(id)sender {
}

- (IBAction)btnActionGlobe:(id)sender {
}

- (IBAction)btnActionOK:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}
@end
