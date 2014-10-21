//
//  TermsViewController.m
//  DoctorApp
//
//  Created by Debasish on 07/09/14.
//  Copyright (c) 2014 Debasish. All rights reserved.
//

#import "TermsViewController.h"
#import "MenuViewController.h"
@interface TermsViewController ()

@end

@implementation TermsViewController

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
     [self.navigationItem setHidesBackButton:YES animated:NO];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    _txtVwAgree.indicatorStyle = UIScrollViewIndicatorStyleWhite;
   
    if (iphoneTallScreen())
    {
    }
    else
    {
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.1"))
        {
            self.btnAgree.frame = CGRectMake(self.btnAgree.frame.origin.x,self.btnAgree.frame.origin.y-88.0,self.btnAgree.frame.size.width,self.btnAgree.frame.size.height);
            self.btnDontAgree.frame = CGRectMake(self.btnDontAgree.frame.origin.x,self.btnDontAgree.frame.origin.y-88.0,self.btnDontAgree.frame.size.width,self.btnDontAgree.frame.size.height);
            self.txtVwAgree.frame = CGRectMake(self.txtVwAgree.frame.origin.x,self.txtVwAgree.frame.origin.y,self.txtVwAgree.frame.size.width,self.txtVwAgree.frame.size.height-88.0);
        }
        else if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
        {
        }
        else
        {
            self.btnAgree.frame = CGRectMake(self.btnAgree.frame.origin.x,self.btnAgree.frame.origin.y-88.0,self.btnAgree.frame.size.width,self.btnAgree.frame.size.height);
            self.btnDontAgree.frame = CGRectMake(self.btnDontAgree.frame.origin.x,self.btnDontAgree.frame.origin.y-88.0,self.btnDontAgree.frame.size.width,self.btnDontAgree.frame.size.height-88.0);
            self.txtVwAgree.frame = CGRectMake(self.txtVwAgree.frame.origin.x,self.txtVwAgree.frame.origin.y,self.txtVwAgree.frame.size.width,self.txtVwAgree.frame.size.height-88.0);
        }
    }

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnActionAgree:(id)sender
{
    MenuViewController *menuVC=[[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    [self.navigationController pushViewController:menuVC animated:YES];
}
- (IBAction)btnActionDontAgree:(id)sender {
}
@end
