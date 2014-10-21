//
//  MenuViewController.m
//  DoctorApp
//
//  Created by Debasish on 07/09/14.
//  Copyright (c) 2014 Debasish. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuTableViewCell.h"
#import "ContactOfficeViewController.h"
#import "VisitOfficeViewController.h"
#import "FindOfficeViewController.h"
#import "MeetTeamViewController.h"
@interface MenuViewController ()

@end

@implementation MenuViewController

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
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    self.menuTitle = @[@"Meet Our Team",@"Visit Our Website", @"Find Our Office",@"Discover Our Clinic",@"Contact Our Office",@"Get Our Treatments"];
    self.menuImage=@[@"team@2x.png",@"world@2x.png",@"compass@2x.png",@"films@2x.png",@"phone@2x.png",@"box@2x.png"];
    
    if (iphoneTallScreen())
    {
    }
    else
    {
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.1"))
        {
            self.tblVwMenu.frame = CGRectMake(self.tblVwMenu.frame.origin.x,75.0,self.tblVwMenu.frame.size.width,self.tblVwMenu.frame.size.height);
        }
        else if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
        {
        }
        else
        {
            self.tblVwMenu.frame = CGRectMake(self.tblVwMenu.frame.origin.x,75.0,self.tblVwMenu.frame.size.width,self.tblVwMenu.frame.size.height);

        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView
 willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2==0)
    {
          [cell setBackgroundColor:[UIColor colorWithRed:104.0/255.0f green:143.0/255.0f blue:161.0/255.0f alpha:1.0f]];
    }
    else
    {
        [cell setBackgroundColor:[UIColor colorWithRed:135.0/255.0f green:163.0/255.0f blue:176.0/255.0f alpha:1.0f]];
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuTitle.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell=nil;
    NSArray *nib=nil;
    
    nib=[[ NSBundle  mainBundle]loadNibNamed:@"MenuTableViewCell" owner:self options:nil];
    
    cell=(MenuTableViewCell*)[nib objectAtIndex:0];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell.lblTitle.text=[self.menuTitle objectAtIndex:indexPath.row];
    cell.imgVw.image=[UIImage imageNamed:[self.menuImage objectAtIndex:indexPath.row]];
    
    if(indexPath.row != self.menuTitle.count)
    {
        UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 59, 320, 1)];
        line.backgroundColor = [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0];
        [cell addSubview:line];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        MeetTeamViewController *detContactVC=[[MeetTeamViewController alloc] initWithNibName:@"MeetTeamViewController" bundle:nil];
        
        [self.navigationController pushViewController:detContactVC animated:YES];

    }
    else  if(indexPath.row==1)
    {
        VisitOfficeViewController *detContactVC=[[VisitOfficeViewController alloc] initWithNibName:@"VisitOfficeViewController" bundle:nil];
        
        [self.navigationController pushViewController:detContactVC animated:YES];
  
    }

    else if(indexPath.row==2)
    {
        FindOfficeViewController *detContactVC=[[FindOfficeViewController alloc] initWithNibName:@"FindOfficeViewController" bundle:nil];
 
        [self.navigationController pushViewController:detContactVC animated:YES];
    }
    else if(indexPath.row==3)
    {
    }

    else if(indexPath.row==4)
    {
        ContactOfficeViewController *detContactVC=[[ContactOfficeViewController alloc] initWithNibName:@"ContactOfficeViewController" bundle:nil];
        
        [self.navigationController pushViewController:detContactVC animated:YES];
    }

   else if(indexPath.row==5)
    {
        
    }

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (IBAction)btnActionHome:(id)sender
{
    
}
- (IBAction)btnActionPatient:(id)sender
{
    
}
@end
