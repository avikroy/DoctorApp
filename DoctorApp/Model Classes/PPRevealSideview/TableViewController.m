//
//  LeftViewController.m
//  PPRevealSideViewController
//
//  Created by Marian PAUL on 16/02/12.
//  Copyright (c) 2012 Marian PAUL aka ipodishima — iPuP SARL. All rights reserved.
//

#import "TableViewController.h"
#import "UIImageView+PhotoFrame.h"
//#import <SDWebImage/UIImageView+WebCache.h>
/*#import "DashboardViewController.h"
#import "FileViewController.h"
#import "TaskViewController.h"
#import "AppointmentViewController.h"
#import "OppurtunityViewController.h"
#import "LeadsViewController.h"
#import "ContactViewController.h"
#import "SettingsViewController.h"
#import "HelpViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "SalesTrackViewController.h"*/
@implementation TableViewController
{
    ConnectionModel *conModel;
    NSUserDefaults *user_defaults;
}
@synthesize HUD,n12;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    @try {
        [self.tableView removeObserver:self forKeyPath:@"revealSideInset"];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    [super didReceiveMemoryWarning];
 }

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone ];
    [self.tableView addObserver:self forKeyPath:@"revealSideInset" options:NSKeyValueObservingOptionNew context:NULL];
    self.view.backgroundColor = [UIColor colorWithRed:5.0f/255.0f green:81.0f/255.0f blue:100.0f/255.0f alpha:1.0];
    user_defaults=[NSUserDefaults standardUserDefaults];
   
self.menuTitle = @[@"Dashboard",@"File", @"Task",@"Appointment",@"Opportunities",@"Leads",@"Contacts",@"Sales Tracker",@"Settings",@"Help",@"Logout"];
self.menuImage=@[@"icon_dashboard@2x",@"icon_file@2x",@"task_icon@2x",@"icon_appoitment@2x",@"icon_opportunities@2x",@"icon_leads@2x",@"icon_contacts@2x",@"salestrackericon",@"icon_settings@2x",@"icon_help@2x",@"icon_logout@2x"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self.tableView removeObserver:self forKeyPath:@"revealSideInset"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"revealSideInset"]) {
        UIEdgeInsets newInset = self.tableView.contentInset;
        newInset.top = self.tableView.revealSideInset.top;
        newInset.bottom = self.tableView.revealSideInset.bottom;
        self.tableView.contentInset = newInset;
    }
    else
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

- (void) dealloc 
{
    @try{
        [self.tableView removeObserver:self forKeyPath:@"revealSideInset"];
    }@catch(id anException){
        //do nothing, obviously it wasn't attached because an exception was thrown
    }
}

#pragma mark - Table view data source
-(void)tableView:(UITableView *)tableView
 willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
      return 30.0f;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat) tableView: (UITableView *) tableView heightForRowAtIndexPath: (NSIndexPath *) indexPath{
    return 50.0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuTitle.count;
 }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      static NSString *CellIdentifier = @"Cell";
    
    CustomCell *cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
//    UIView *myBackView = [[UIView alloc] initWithFrame:cell.frame];
//    myBackView.backgroundColor = [UIColor colorWithRed:9.0/255.0 green:96.0/255.0 blue:117.0/255.0 alpha:1.0];
//    cell.selectedBackgroundView = myBackView;
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.myLabel.text=[self.menuTitle objectAtIndex:indexPath.row];

    cell.myImage.image=[UIImage imageNamed:[self.menuImage objectAtIndex:indexPath.row]];
   
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.revealSideInset = self.tableView.revealSideInset;
    cell.accessoryType=UITableViewCellAccessoryNone;
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell.contentView.subviews enumerateObjectsUsingBlock:^(id obj , NSUInteger idx,BOOL *stop){
    
        if ([[cell.contentView.subviews objectAtIndex:idx] isKindOfClass:[UILabel class]]) {
            
            UILabel *label = (UILabel *)[cell.contentView.subviews objectAtIndex:idx];
            label.textColor = [UIColor colorWithRed:225.0f/255.0f green:225.0f/255.0f blue:225.0f/255.0f alpha:1.0];
        }
    }];
   /* switch (indexPath.row) {
        case 0:
        {
            DashboardViewController *dashboard = [[DashboardViewController alloc]initWithNibName:@"DashboardViewController" bundle:nil];
            //UINavigationController *n12 = [[UINavigationController alloc] initWithRootViewController:dashboard];
            self.n12 = [[UINavigationController alloc] initWithRootViewController:dashboard];

            [self.revealSideViewController popViewControllerWithNewCenterController:n12 animated:YES];
        }
        case 1:
        {
            FileViewController *file = [[FileViewController alloc]initWithNibName:@"FileViewController" bundle:nil];
             file.navStatus=@"other";
           // UINavigationController *n12 = [[UINavigationController alloc] initWithRootViewController:file];
            self.n12 = [[UINavigationController alloc] initWithRootViewController:file];

            [self.revealSideViewController popViewControllerWithNewCenterController:n12 animated:YES];
        }
        break;
        case 2:
        {
            TaskViewController *task = [[TaskViewController alloc]initWithNibName:@"TaskViewController" bundle:nil];
             task.navStatus=@"other";
            //UINavigationController *n12 = [[UINavigationController alloc] initWithRootViewController:task];
            self.n12 = [[UINavigationController alloc] initWithRootViewController:task];
            [self.revealSideViewController popViewControllerWithNewCenterController:n12 animated:YES];
        }
        break;
        case 3:
        {
            AppointmentViewController *appointment = [[AppointmentViewController alloc]initWithNibName:@"AppointmentViewController" bundle:nil];
             appointment.navStatus=@"other";
            //UINavigationController *n12 = [[UINavigationController alloc] initWithRootViewController:appointment];
            self.n12 = [[UINavigationController alloc] initWithRootViewController:appointment];
            [self.revealSideViewController popViewControllerWithNewCenterController:n12 animated:YES];
        }
        break; 
        case 4:
        {
            OppurtunityViewController *oppurtunity = [[OppurtunityViewController alloc]initWithNibName:@"OppurtunityViewController" bundle:nil];
             oppurtunity.navStatus=@"other";
           // UINavigationController *n12 = [[UINavigationController alloc] initWithRootViewController:oppurtunity];
            self.n12 = [[UINavigationController alloc] initWithRootViewController:oppurtunity];
            [self.revealSideViewController popViewControllerWithNewCenterController:n12 animated:YES];
        }
        break;
        case 5:
        {
            LeadsViewController *leads = [[LeadsViewController alloc]initWithNibName:@"LeadsViewController" bundle:nil];
          //  UINavigationController *n12 = [[UINavigationController alloc] initWithRootViewController:leads];
            self.n12 = [[UINavigationController alloc] initWithRootViewController:leads];
            [self.revealSideViewController popViewControllerWithNewCenterController:n12 animated:YES];
        }
        break;
        case 6:
        {
            ContactViewController *contact = [[ContactViewController alloc]initWithNibName:@"ContactViewController" bundle:nil];
            //UINavigationController *n12 = [[UINavigationController alloc] initWithRootViewController:contact];
            self.n12 = [[UINavigationController alloc] initWithRootViewController:contact];
            [self.revealSideViewController popViewControllerWithNewCenterController:n12 animated:YES];
        }
        break;
        case 7:
        {
            SalesTrackViewController *sales = [[SalesTrackViewController alloc]initWithNibName:@"SalesTrackViewController" bundle:nil];
            // UINavigationController *n12 = [[UINavigationController alloc] initWithRootViewController:sales];
            self.n12 = [[UINavigationController alloc] initWithRootViewController:sales];
            [self.revealSideViewController popViewControllerWithNewCenterController:n12 animated:YES];

        }
            break;
        case 8:
        {
            SettingsViewController *settings = [[SettingsViewController alloc]initWithNibName:@"SettingsViewController" bundle:nil];
            //UINavigationController *n12 = [[UINavigationController alloc] initWithRootViewController:settings];
            self.n12 = [[UINavigationController alloc] initWithRootViewController:settings];
            [self.revealSideViewController popViewControllerWithNewCenterController:n12 animated:YES];

             }
            break;
        case 9:
        {
            HelpViewController *help = [[HelpViewController alloc]initWithNibName:@"HelpViewController" bundle:nil];
            //UINavigationController *n12 = [[UINavigationController alloc] initWithRootViewController:help];
            self.n12 = [[UINavigationController alloc] initWithRootViewController:help];
            [self.revealSideViewController popViewControllerWithNewCenterController:n12 animated:YES];

          }
            break;

        case 10:
        {
            if (isNetworkAvailable())
            {
                [self createConnectionLogout];
            }
            else
            {
           //     [self createAlertView:@"Alert" withAlertMessage:ConnectionUnavailable withAlertTag:3];
            }
        }
            break;

           default:
        break;
    }*/
}
/*#pragma mark - createConnectionLogout Method
-(void)createConnectionLogout
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
 

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
  
    [request setPostValue:@"LOGOUT" forKey:@"op"];
     [request setPostValue:[user_defaults stringForKey:@"UserID"] forKey:@"userid"];
    [request setPostValue:[user_defaults stringForKey:@"DeviceID"] forKey:@"deviceid"];
    [request setPostValue:@"HOST123456" forKey:@"token"];
    
    [request setUsername:@"logout"];
    [request setDelegate:self];
    [request startAsynchronous];
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view.window];
    [self.view.window addSubview:HUD];
    
    HUD.delegate = self;
    HUD.labelText = @"Please wait...";
    //HUD.detailsLabelText = @"Please wait...";
    HUD.square = YES;
    [self.HUD show:YES];

  }
#pragma mark - Request Delegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
    [self.HUD hide:YES];
    if ([request.username isEqualToString:@"logout"])
    {
      	NSData *responseData = [request responseData];
        NSString *resp = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSLog(@"RESSTRING:%@",resp);
        
        id finalDict = [resp  JSONValue];
        NSLog(@"Dict value:%@",finalDict);
        
        NSString *status=[finalDict objectForKey:@"Status"];
        NSString *message=[finalDict objectForKey:@"Message"];
        
        if([status intValue]==0)
        {
            //  [self createAlertView:@"" withAlertMessage:message withAlertTag:2];
            [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"isLogin"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"isFirstLogin"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [user_defaults setObject:@"" forKey:@"UserID"];
            [user_defaults setObject:@"" forKey:@"Username"];
            [user_defaults setObject:@"" forKey:@"Email"];
            [user_defaults synchronize];
            
            AppDelegate *appDel=(AppDelegate *)[[UIApplication sharedApplication]delegate];
            [appDel callLogin];

        }
        else if([status intValue]==1)
        {
            [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"isLogin"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"isFirstLogin"];
            [[NSUserDefaults standardUserDefaults] synchronize];

            [user_defaults setObject:@"" forKey:@"UserID"];
            [user_defaults setObject:@"" forKey:@"Username"];
            [user_defaults setObject:@"" forKey:@"Email"];
            [user_defaults synchronize];
            
            AppDelegate *appDel=(AppDelegate *)[[UIApplication sharedApplication]delegate];
            [appDel callLogin];
        }
    }
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"REQUEST_ERROR:%@",[error localizedDescription]);
    
  [self.HUD hide:YES];
 //   [self createAlertView:@"Alert" withAlertMessage:ConnectionSlow withAlertTag:3];
}*/


@end
