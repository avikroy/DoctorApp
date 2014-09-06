//
//  Connection Model.m
//  Ugo jersey
//
//  Created by Debasish Pal on 09/08/13.
//  Copyright (c) 2013 Debasish Pal. All rights reserved.
//

#import "ConnectionModel.h"
#import "Constant.h"

@implementation ConnectionModel

@synthesize delegate,request;

-(ASIFormDataRequest*)initiateRequestWithURL:(NSURL*)url
{
    ASIFormDataRequest *_request = [ASIFormDataRequest requestWithURL:url];
    [_request setUseKeychainPersistence:YES];
    [_request setTimeOutSeconds:60];
    [_request setDelegate:self];
    _request.shouldAttemptPersistentConnection   = NO;
    return _request;
}
-(void)startResquestForLogin:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
 /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
   // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/
    
    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
  
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"username"] forKey:@"username"];
    [self.request setPostValue:[dict objectForKey:@"password"] forKey:@"password"];
    [self.request setPostValue:[dict objectForKey:@"customdomain"] forKey:@"customdomain"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    
     [request setUsername:@"login"];
    [self.request startAsynchronous];
}
-(void)startResquestForLogout:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"deviceid"] forKey:@"deviceid"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    
    [request setUsername:@"logout"];
    [self.request startAsynchronous];
}


-(void)startResquestForForgotPass:(NSMutableDictionary*)dict
{
    NSString *strDomainNm=[dict objectForKey:@"customdomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"email"] forKey:@"email"];
    [self.request setPostValue:[dict objectForKey:@"customdomain"] forKey:@"customdomain"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    
    [request setUsername:@"forgotpassword"];
    [self.request startAsynchronous];
}


-(void)startResquestForEmailActivation:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"email"] forKey:@"email"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"username"] forKey:@"username"];
    [self.request setPostValue:[dict objectForKey:@"deviceid"] forKey:@"deviceid"];
    
    [request setUsername:@"emailactivation"];
    [self.request startAsynchronous];
}
-(void)startResquestForEmailVerification:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"code"] forKey:@"code"];
    [self.request setPostValue:[dict objectForKey:@"deviceid"] forKey:@"deviceid"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"devicetype"] forKey:@"devicetype"];

    [request setUsername:@"emailverification"];
    [self.request startAsynchronous];
}

-(void)startResquestForRecentContacts:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/
    
    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"top_rows"] forKey:@"top_rows"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    
    [request setUsername:@"recentcontacts"];
    [self.request startAsynchronous];
}

-(void)startResquestForMyContacts:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"top_rows"] forKey:@"top_rows"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    
    [request setUsername:@"mycontacts"];
    [self.request startAsynchronous];
}

-(void)startResquestForContactDetail:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"contactid"] forKey:@"contactid"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    
    [request setUsername:@"contactdetail"];
    [self.request startAsynchronous];
}

-(void)startResquestForContactDropDownList:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
     [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    
    [request setUsername:@"contactdropdownlist"];
    [self.request startAsynchronous];
}
-(void)startResquestForTaskNotifyToDropDownList:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"top_rows"] forKey:@"top_rows"];

    [request setUsername:@"tasknotifyTodropdownlist"];
    [self.request startAsynchronous];
}
-(void)startResquestForTaskRelToDropDownList:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"reltype"] forKey:@"reltype"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
     [self.request setPostValue:[dict objectForKey:@"searchKey"] forKey:@"searchKey"];
    
    [request setUsername:@"taskRelTodropdownlist"];
    [self.request startAsynchronous];
}

-(void)startResquestForSearchMyContacts:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"top_rows"] forKey:@"top_rows"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"searchkey"] forKey:@"searchkey"];
    
    [request setUsername:@"SEARCHMYCONTACTS"];
    [self.request startAsynchronous];
}


-(void)startResquestForContactStateList:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"countryid"] forKey:@"countryid"];
    
    [request setUsername:@"STATELISTBYCOUNTRY"];
    [self.request startAsynchronous];
}

-(void)startResquestForAddContact:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"firstname"] forKey:@"firstname"];
    [self.request setPostValue:[dict objectForKey:@"lastname"] forKey:@"lastname"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"companyname"] forKey:@"companyname"];
    [self.request setPostValue:[dict objectForKey:@"leadsource"] forKey:@"leadsource"];
    [self.request setPostValue:[dict objectForKey:@"email"] forKey:@"email"];
    [self.request setPostValue:[dict objectForKey:@"designation"] forKey:@"designation"];
    [self.request setPostValue:[dict objectForKey:@"category"] forKey:@"category"];
    [self.request setPostValue:[dict objectForKey:@"rank"] forKey:@"rank"];
    [self.request setPostValue:[dict objectForKey:@"phonetype"] forKey:@"phonetype"];
    [self.request setPostValue:[dict objectForKey:@"phone"] forKey:@"phone"];
    [self.request setPostValue:[dict objectForKey:@"phonetype2"] forKey:@"phonetype2"];
    [self.request setPostValue:[dict objectForKey:@"phone2"] forKey:@"phone2"];
    [self.request setPostValue:[dict objectForKey:@"web"] forKey:@"web"];
    
    [self.request setPostValue:[dict objectForKey:@"BillingInfo"] forKey:@"BillingInfo"];
    [self.request setPostValue:[dict objectForKey:@"ShippingInfo"] forKey:@"ShippingInfo"];
    [self.request setPostValue:[dict objectForKey:@"OtherInfo"] forKey:@"OtherInfo"];
    [self.request setPostValue:[dict objectForKey:@"customerTags"] forKey:@"customerTags"];
    
    [request setUsername:@"AddContact"];
    [self.request startAsynchronous];
}

-(void)startResquestForEditContact:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"contactid"] forKey:@"contactid"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"firstname"] forKey:@"firstname"];
    [self.request setPostValue:[dict objectForKey:@"lastname"] forKey:@"lastname"];
    [self.request setPostValue:[dict objectForKey:@"companyname"] forKey:@"companyname"];
    [self.request setPostValue:[dict objectForKey:@"leadsource"] forKey:@"leadsource"];
    [self.request setPostValue:[dict objectForKey:@"email"] forKey:@"email"];
    [self.request setPostValue:[dict objectForKey:@"designation"] forKey:@"designation"];
    [self.request setPostValue:[dict objectForKey:@"category"] forKey:@"category"];
    [self.request setPostValue:[dict objectForKey:@"rank"] forKey:@"rank"];
    [self.request setPostValue:[dict objectForKey:@"phonetype"] forKey:@"phonetype"];
    [self.request setPostValue:[dict objectForKey:@"phone"] forKey:@"phone"];
    [self.request setPostValue:[dict objectForKey:@"phonetype2"] forKey:@"phonetype2"];
    [self.request setPostValue:[dict objectForKey:@"phone2"] forKey:@"phone2"];
    [self.request setPostValue:[dict objectForKey:@"web"] forKey:@"web"];
    
    
    [self.request setPostValue:[dict objectForKey:@"BillingInfo"] forKey:@"BillingInfo"];
    [self.request setPostValue:[dict objectForKey:@"ShippingInfo"] forKey:@"ShippingInfo"];
    [self.request setPostValue:[dict objectForKey:@"OtherInfo"] forKey:@"OtherInfo"];
    [self.request setPostValue:[dict objectForKey:@"customerTags"] forKey:@"customerTags"];

    [request setUsername:@"EditContact"];
    [self.request startAsynchronous];
}
-(void)startResquestForContactDelete:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
     [self.request setPostValue:[dict objectForKey:@"contactid"] forKey:@"contactid"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    
    [request setUsername:@"ContactDelete"];
    [self.request startAsynchronous];
}

-(void)startResquestForMyTask:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"top_rows"] forKey:@"top_rows"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"isOverDue"] forKey:@"isOverDue"];
    [self.request setPostValue:[dict objectForKey:@"tasktype"] forKey:@"tasktype"];

    if([dict objectForKey:@"refid"])
    {
        [self.request setPostValue:[dict objectForKey:@"refid"] forKey:@"refid"];
    }

    if([dict objectForKey:@"reltype"])
    {
        [self.request setPostValue:[dict objectForKey:@"reltype"] forKey:@"reltype"];
    }

    [request setUsername:@"MyTaskList"];
    [self.request startAsynchronous];
}
-(void)startResquestForOverdueTask:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"top_rows"] forKey:@"top_rows"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"isOverDue"] forKey:@"isOverDue"];
    [self.request setPostValue:[dict objectForKey:@"tasktype"] forKey:@"tasktype"];
    
    if([dict objectForKey:@"refid"])
    {
        [self.request setPostValue:[dict objectForKey:@"refid"] forKey:@"refid"];
    }
    
    if([dict objectForKey:@"reltype"])
    {
        [self.request setPostValue:[dict objectForKey:@"reltype"] forKey:@"reltype"];
    }

    [request setUsername:@"OverdueTaskList"];
    [self.request startAsynchronous];
}

-(void)startResquestForCompletedTask:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];

    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"taskid"] forKey:@"taskid"];
    [self.request setPostValue:[dict objectForKey:@"tasktype"] forKey:@"tasktype"];
    [self.request setPostValue:[dict objectForKey:@"status"] forKey:@"status"];
//    [self.request setPostValue:[dict objectForKey:@"completedate"] forKey:@"completedate"];
//    [self.request setPostValue:[dict objectForKey:@"completetime"] forKey:@"completetime"];

    [request setUsername:@"CompletedTask"];
    [self.request startAsynchronous];
}

-(void)startResquestForAddTask:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"tasktype"] forKey:@"tasktype"];
    [self.request setPostValue:[dict objectForKey:@"reltype"] forKey:@"reltype"];
    [self.request setPostValue:[dict objectForKey:@"refid"] forKey:@"refid"];
    [self.request setPostValue:[dict objectForKey:@"title"] forKey:@"title"];
    [self.request setPostValue:[dict objectForKey:@"note"] forKey:@"note"];
    [self.request setPostValue:[dict objectForKey:@"assignto"] forKey:@"assignto"];
    [self.request setPostValue:[dict objectForKey:@"startdate"] forKey:@"startdate"];
    [self.request setPostValue:[dict objectForKey:@"starttime"] forKey:@"starttime"];
    [self.request setPostValue:[dict objectForKey:@"enddate"] forKey:@"enddate"];
    [self.request setPostValue:[dict objectForKey:@"endtime"] forKey:@"endtime"];
    [self.request setPostValue:[dict objectForKey:@"sendperosnal"] forKey:@"sendperosnal"];
    [self.request setPostValue:[dict objectForKey:@"sendcopy"] forKey:@"sendcopy"];
    [self.request setPostValue:[dict objectForKey:@"remindertime"] forKey:@"remindertime"];
    [self.request setPostValue:[dict objectForKey:@"notifyto"] forKey:@"notifyto"];
    
    [request setUsername:@"AddTask"];
    [self.request startAsynchronous];
}
-(void)startResquestForEditTask:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"taskid"] forKey:@"taskid"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"tasktype"] forKey:@"tasktype"];
    [self.request setPostValue:[dict objectForKey:@"reltype"] forKey:@"reltype"];
    [self.request setPostValue:[dict objectForKey:@"refid"] forKey:@"refid"];
    [self.request setPostValue:[dict objectForKey:@"title"] forKey:@"title"];
    [self.request setPostValue:[dict objectForKey:@"note"] forKey:@"note"];
    [self.request setPostValue:[dict objectForKey:@"assignto"] forKey:@"assignto"];
    [self.request setPostValue:[dict objectForKey:@"startdate"] forKey:@"startdate"];
    [self.request setPostValue:[dict objectForKey:@"starttime"] forKey:@"starttime"];
    [self.request setPostValue:[dict objectForKey:@"enddate"] forKey:@"enddate"];
    [self.request setPostValue:[dict objectForKey:@"endtime"] forKey:@"endtime"];
    [self.request setPostValue:[dict objectForKey:@"sendperosnal"] forKey:@"sendperosnal"];
    [self.request setPostValue:[dict objectForKey:@"sendcopy"] forKey:@"sendcopy"];
    [self.request setPostValue:[dict objectForKey:@"remindertime"] forKey:@"remindertime"];
    [self.request setPostValue:[dict objectForKey:@"notifyto"] forKey:@"notifyto"];
    [self.request setPostValue:[dict objectForKey:@"taskStatus"] forKey:@"taskStatus"];
    
    [request setUsername:@"EditTask"];
    [self.request startAsynchronous];
}


-(void)startResquestForTaskDetails:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);

    self.request = [self initiateRequestWithURL:url];

    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"tasktype"] forKey:@"tasktype"];
    [self.request setPostValue:[dict objectForKey:@"taskid"] forKey:@"taskid"];
  
    [request setUsername:@"TaskDetail"];
    [self.request startAsynchronous];
}
-(void)startResquestForTaskDelete:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"tasktype"] forKey:@"tasktype"];
    [self.request setPostValue:[dict objectForKey:@"taskid"] forKey:@"taskid"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];

    [request setUsername:@"TaskDelete"];
    [self.request startAsynchronous];
}

-(void)startResquestForRecentLeads:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"top_rows"] forKey:@"top_rows"];
    [self.request setPostValue:[dict objectForKey:@"isopen"] forKey:@"isopen"];
    [self.request setPostValue:[dict objectForKey:@"isrecent"] forKey:@"isrecent"];

    [request setUsername:@"RecentLeads"];
    [self.request startAsynchronous];
}
-(void)startResquestForOpenLeads:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"top_rows"] forKey:@"top_rows"];
    [self.request setPostValue:[dict objectForKey:@"isopen"] forKey:@"isopen"];
    [self.request setPostValue:[dict objectForKey:@"isrecent"] forKey:@"isrecent"];
    
    [request setUsername:@"OpenLeads"];
    [self.request startAsynchronous];
}
-(void)startResquestForLeadsDetail:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"leadid"] forKey:@"leadid"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];

    
    [request setUsername:@"LeadDetail"];
    [self.request startAsynchronous];
}

-(void)startResquestForSearchLeads:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"top_rows"] forKey:@"top_rows"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"searchkey"] forKey:@"searchkey"];
    
    [request setUsername:@"searchLeads"];
    [self.request startAsynchronous];
}


-(void)startResquestForAddLeads:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"title"] forKey:@"title"];
    [self.request setPostValue:[dict objectForKey:@"firstname"] forKey:@"firstname"];
    [self.request setPostValue:[dict objectForKey:@"lastname"] forKey:@"lastname"];
    [self.request setPostValue:[dict objectForKey:@"companyname"] forKey:@"companyname"];
    [self.request setPostValue:[dict objectForKey:@"jobtitle"] forKey:@"jobtitle"];
    [self.request setPostValue:[dict objectForKey:@"leadsource"] forKey:@"leadsource"];
    [self.request setPostValue:[dict objectForKey:@"leadsourceid"] forKey:@"leadsourceid"];
    
    [self.request setPostValue:[dict objectForKey:@"leadstatus"] forKey:@"leadstatus"];
    [self.request setPostValue:[dict objectForKey:@"leadcategory"] forKey:@"leadcategory"];
    [self.request setPostValue:[dict objectForKey:@"rank"] forKey:@"rank"];
    [self.request setPostValue:[dict objectForKey:@"owner"] forKey:@"owner"];
    [self.request setPostValue:[dict objectForKey:@"phonetype"] forKey:@"phonetype"];
    [self.request setPostValue:[dict objectForKey:@"phone"] forKey:@"phone"];
    [self.request setPostValue:[dict objectForKey:@"phonetype2"] forKey:@"phonetype2"];
    [self.request setPostValue:[dict objectForKey:@"phone2"] forKey:@"phone2"];
    [self.request setPostValue:[dict objectForKey:@"web"] forKey:@"web"];
    [self.request setPostValue:[dict objectForKey:@"email"] forKey:@"email"];

    
    [self.request setPostValue:[dict objectForKey:@"street1"] forKey:@"street1"];
    [self.request setPostValue:[dict objectForKey:@"street2"] forKey:@"street2"];
    [self.request setPostValue:[dict objectForKey:@"country"] forKey:@"country"];
    [self.request setPostValue:[dict objectForKey:@"state"] forKey:@"state"];
    [self.request setPostValue:[dict objectForKey:@"city"] forKey:@"city"];
    [self.request setPostValue:[dict objectForKey:@"postcode1"] forKey:@"postcode1"];
    [self.request setPostValue:[dict objectForKey:@"postcode2"] forKey:@"postcode2"];

    [request setUsername:@"AddLeads"];
    [self.request startAsynchronous];
}
-(void)startResquestForEditLeads:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"leadid"] forKey:@"leadid"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"title"] forKey:@"title"];
    [self.request setPostValue:[dict objectForKey:@"firstname"] forKey:@"firstname"];
    [self.request setPostValue:[dict objectForKey:@"lastname"] forKey:@"lastname"];
    [self.request setPostValue:[dict objectForKey:@"companyname"] forKey:@"companyname"];
    [self.request setPostValue:[dict objectForKey:@"jobtitle"] forKey:@"jobtitle"];
    [self.request setPostValue:[dict objectForKey:@"leadsource"] forKey:@"leadsource"];
    [self.request setPostValue:[dict objectForKey:@"leadsourceid"] forKey:@"leadsourceid"];

    [self.request setPostValue:[dict objectForKey:@"leadstatus"] forKey:@"leadstatus"];
    [self.request setPostValue:[dict objectForKey:@"leadcategory"] forKey:@"leadcategory"];
    [self.request setPostValue:[dict objectForKey:@"rank"] forKey:@"rank"];
    [self.request setPostValue:[dict objectForKey:@"owner"] forKey:@"owner"];
    [self.request setPostValue:[dict objectForKey:@"phonetype"] forKey:@"phonetype"];
    [self.request setPostValue:[dict objectForKey:@"phone"] forKey:@"phone"];
    [self.request setPostValue:[dict objectForKey:@"phonetype2"] forKey:@"phonetype2"];
    [self.request setPostValue:[dict objectForKey:@"phone2"] forKey:@"phone2"];
    [self.request setPostValue:[dict objectForKey:@"web"] forKey:@"web"];
    [self.request setPostValue:[dict objectForKey:@"email"] forKey:@"email"];
    
    
    [self.request setPostValue:[dict objectForKey:@"street1"] forKey:@"street1"];
    [self.request setPostValue:[dict objectForKey:@"street2"] forKey:@"street2"];
    [self.request setPostValue:[dict objectForKey:@"country"] forKey:@"country"];
    [self.request setPostValue:[dict objectForKey:@"state"] forKey:@"state"];
    [self.request setPostValue:[dict objectForKey:@"city"] forKey:@"city"];
    [self.request setPostValue:[dict objectForKey:@"postcode1"] forKey:@"postcode1"];
    [self.request setPostValue:[dict objectForKey:@"postcode2"] forKey:@"postcode2"];
    
    [request setUsername:@"EditLeads"];
    [self.request startAsynchronous];
}
-(void)startResquestForLeadsDelete:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"leadid"] forKey:@"leadid"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    
    [request setUsername:@"LeadsDelete"];
    [self.request startAsynchronous];
}

-(void)startResquestForRecentOpportunity:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"toprows"] forKey:@"toprows"];
     [self.request setPostValue:[dict objectForKey:@"isRecent"] forKey:@"isRecent"];
    
    if([dict objectForKey:@"refid"])
    {
    [self.request setPostValue:[dict objectForKey:@"refid"] forKey:@"refid"];
    }
    [request setUsername:@"RecentOppurtunity"];
    [self.request startAsynchronous];
}

-(void)startResquestForSearchOpportunity:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"toprows"] forKey:@"toprows"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"searchkey"] forKey:@"searchkey"];
    if([dict objectForKey:@"refid"])
    {
        [self.request setPostValue:[dict objectForKey:@"refid"] forKey:@"refid"];
    }

    [request setUsername:@"searchOppurtunity"];
    [self.request startAsynchronous];
}

-(void)startResquestForOppurtunityDropDownList:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    
    [request setUsername:@"oppurtunitydropdownlist"];
    [self.request startAsynchronous];
}
-(void)startResquestForAddOppurtunity:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"oppname"] forKey:@"oppname"];
    [self.request setPostValue:[dict objectForKey:@"type"] forKey:@"type"];
    [self.request setPostValue:[dict objectForKey:@"leadcontact"] forKey:@"leadcontact"];
    [self.request setPostValue:[dict objectForKey:@"campsource"] forKey:@"campsource"];
    [self.request setPostValue:[dict objectForKey:@"leadsource"] forKey:@"leadsource"];
    [self.request setPostValue:[dict objectForKey:@"note"] forKey:@"note"];
    [self.request setPostValue:[dict objectForKey:@"owner"] forKey:@"owner"];

    [self.request setPostValue:[dict objectForKey:@"closedate"] forKey:@"closedate"];
    [self.request setPostValue:[dict objectForKey:@"stage"] forKey:@"stage"];
     [self.request setPostValue:[dict objectForKey:@"stageid"] forKey:@"stageid"];
    
    [self.request setPostValue:[dict objectForKey:@"probability"] forKey:@"probability"];
    [self.request setPostValue:[dict objectForKey:@"amt"] forKey:@"amt"];

    [self.request setPostValue:[dict objectForKey:@"nextstep"] forKey:@"nextstep"];
    [self.request setPostValue:[dict objectForKey:@"nextstepdate"] forKey:@"nextstepdate"];
    [self.request setPostValue:[dict objectForKey:@"nextnote"] forKey:@"nextnote"];
    [self.request setPostValue:[dict objectForKey:@"tags"] forKey:@"tags"];
    [self.request setPostValue:[dict objectForKey:@"currencyID"] forKey:@"currencyID"];

    [request setUsername:@"AddOppurtunity"];
    [self.request startAsynchronous];
}

-(void)startResquestForEditOppurtunity:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"opportunityid"] forKey:@"opportunityid"];
    [self.request setPostValue:[dict objectForKey:@"oppname"] forKey:@"oppname"];
    [self.request setPostValue:[dict objectForKey:@"type"] forKey:@"type"];
    [self.request setPostValue:[dict objectForKey:@"leadcontact"] forKey:@"leadcontact"];
    [self.request setPostValue:[dict objectForKey:@"campsource"] forKey:@"campsource"];
    [self.request setPostValue:[dict objectForKey:@"leadsource"] forKey:@"leadsource"];
    [self.request setPostValue:[dict objectForKey:@"note"] forKey:@"note"];
    [self.request setPostValue:[dict objectForKey:@"owner"] forKey:@"owner"];
    
    [self.request setPostValue:[dict objectForKey:@"closedate"] forKey:@"closedate"];
    [self.request setPostValue:[dict objectForKey:@"stage"] forKey:@"stage"];
    [self.request setPostValue:[dict objectForKey:@"stageid"] forKey:@"stageid"];
    [self.request setPostValue:[dict objectForKey:@"probability"] forKey:@"probability"];
    [self.request setPostValue:[dict objectForKey:@"amt"] forKey:@"amt"];
    
    [self.request setPostValue:[dict objectForKey:@"nextstep"] forKey:@"nextstep"];
    [self.request setPostValue:[dict objectForKey:@"nextstepdate"] forKey:@"nextstepdate"];
    [self.request setPostValue:[dict objectForKey:@"nextnote"] forKey:@"nextnote"];
    [self.request setPostValue:[dict objectForKey:@"tags"] forKey:@"tags"];
     [self.request setPostValue:[dict objectForKey:@"taskid"] forKey:@"taskid"];
     [self.request setPostValue:[dict objectForKey:@"currencyID"] forKey:@"currencyID"];
    
    [request setUsername:@"EditOppurtunity"];
    [self.request startAsynchronous];
}

-(void)startResquestForOppurtunityDetail:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"opportunityid"] forKey:@"opportunityid"];
    
    [request setUsername:@"OppurtunityDetail"];
    [self.request startAsynchronous];
}
-(void)startResquestForOppurtunityDelete:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"opportunityid"] forKey:@"opportunityid"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    
    [request setUsername:@"OppurtunityDelete"];
    [self.request startAsynchronous];
}

-(void)startResquestForOppurContDropDownList:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"searchKey"] forKey:@"searchKey"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    
    [request setUsername:@"OppurtunityContDropDown"];
    [self.request startAsynchronous];
}

-(void)startResquestForRecentFiles:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"toprows"] forKey:@"toprows"];
    [self.request setPostValue:[dict objectForKey:@"isRecent"] forKey:@"isRecent"];
    
    [request setUsername:@"RecentFiles"];
    [self.request startAsynchronous];
}

-(void)startResquestForSearchFiles:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"toprows"] forKey:@"toprows"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"searchkey"] forKey:@"searchkey"];
    
    [request setUsername:@"searchFiles"];
    [self.request startAsynchronous];
}
-(void)startResquestForContactRecentFiles:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"toprows"] forKey:@"toprows"];
    [self.request setPostValue:[dict objectForKey:@"refid"] forKey:@"refid"];
    
    [request setUsername:@"RecentFiles"];
    [self.request startAsynchronous];
}

-(void)startResquestForContactSearchFiles:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"toprows"] forKey:@"toprows"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"searchKey"] forKey:@"searchKey"];
    [self.request setPostValue:[dict objectForKey:@"refid"] forKey:@"refid"];

    [request setUsername:@"searchFiles"];
    [self.request startAsynchronous];
}

-(void)startResquestForFileDetails:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"sharetypeid"] forKey:@"sharetypeid"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    
    [request setUsername:@"FileDetails"];
    [self.request startAsynchronous];
}
-(void)startResquestForShareFileList:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
     [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"top_rows"] forKey:@"top_rows"];
 
    [request setUsername:@"ShareFileList"];
    [self.request startAsynchronous];
}
-(void)startResquestForShareFile:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"docid"] forKey:@"docid"];
    [self.request setPostValue:[dict objectForKey:@"shareids"] forKey:@"shareids"];
 
    [request setUsername:@"ShareFile"];
    [self.request startAsynchronous];
}
-(void)startResquestForAddFiles:(NSMutableDictionary*)dict withImage:(UIImage *)img
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
      
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"filename"] forKey:@"filename"];
    [self.request setPostValue:[dict objectForKey:@"filedesc"] forKey:@"filedesc"];
    
    [self.request addData:UIImageJPEGRepresentation(img, 1.0) withFileName:@"img.png" andContentType:@"image/png" forKey:@"image"];
    [request setUsername:@"AddFile"];
    
    [self.request startAsynchronous];
}
-(void)startResquestForEditFiles:(NSMutableDictionary*)dict withImage:(UIImage *)img
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"docid"] forKey:@"docid"];
    [self.request setPostValue:[dict objectForKey:@"filename"] forKey:@"filename"];
    [self.request setPostValue:[dict objectForKey:@"filedesc"] forKey:@"filedesc"];
    [self.request setPostValue:[dict objectForKey:@"option"] forKey:@"option"];

    if(![[dict objectForKey:@"option"] isEqualToString:@"0"])
    {
    [self.request addData:UIImageJPEGRepresentation(img, 1.0) withFileName:@"img.png" andContentType:@"image/png" forKey:@"image"];
    }
    [request setUsername:@"EditFile"];
    
    [self.request startAsynchronous];
}


-(void)startResquestForFileDelete:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl:%@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"sharetypeid"] forKey:@"sharetypeid"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    
    [request setUsername:@"FileDelete"];
    [self.request startAsynchronous];
}

-(void)startResquestForNoteList:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"customerid"] forKey:@"customerid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"toprows"] forKey:@"toprows"];
    [self.request setPostValue:[dict objectForKey:@"isRecent"] forKey:@"isRecent"];
    
    
    [request setUsername:@"notelist"];
    [self.request startAsynchronous];
}

-(void)startResquestForSearchNoteList:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"customerid"] forKey:@"customerid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"toprows"] forKey:@"toprows"];
    [self.request setPostValue:[dict objectForKey:@"searchkey"] forKey:@"searchkey"];
    
    
    [request setUsername:@"searchnotelist"];
    [self.request startAsynchronous];
}


-(void)startResquestForNoteDetails:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"noteid"] forKey:@"noteid"];
    
    [request setUsername:@"NOTEDETAILS"];
    [self.request startAsynchronous];
}

-(void)startResquestForNoteDDL:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
      
    [request setUsername:@"NOTESDDL"];
    [self.request startAsynchronous];
}

-(void)startResquestForNoteDelete:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"noteid"] forKey:@"noteid"];
    
    [request setUsername:@"DELETENOTE"];
    [self.request startAsynchronous];
}


-(void)startResquestForAddNote:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"assignTo"] forKey:@"assignTo"];
    [self.request setPostValue:[dict objectForKey:@"template"] forKey:@"template"];
    [self.request setPostValue:[dict objectForKey:@"title"] forKey:@"title"];
    [self.request setPostValue:[dict objectForKey:@"note"] forKey:@"note"];
    [self.request setPostValue:[dict objectForKey:@"notetype"] forKey:@"notetype"];
    [self.request setPostValue:[dict objectForKey:@"custtype"] forKey:@"custtype"];
    [self.request setPostValue:[dict objectForKey:@"custid"] forKey:@"custid"];
    [self.request setPostValue:[dict objectForKey:@"issendcopy"] forKey:@"issendcopy"];
    [self.request setPostValue:[dict objectForKey:@"notifylist"] forKey:@"notifylist"];
    
    [request setUsername:@"ADDNOTE"];
    [self.request startAsynchronous];
}


-(void)startResquestForEditNote:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"noteid"] forKey:@"noteid"];
    [self.request setPostValue:[dict objectForKey:@"assignTo"] forKey:@"assignTo"];
    [self.request setPostValue:[dict objectForKey:@"template"] forKey:@"template"];
    [self.request setPostValue:[dict objectForKey:@"title"] forKey:@"title"];
    [self.request setPostValue:[dict objectForKey:@"note"] forKey:@"note"];
    [self.request setPostValue:[dict objectForKey:@"notetype"] forKey:@"notetype"];
    [self.request setPostValue:[dict objectForKey:@"custtype"] forKey:@"custtype"];
    [self.request setPostValue:[dict objectForKey:@"custid"] forKey:@"custid"];
    [self.request setPostValue:[dict objectForKey:@"issendcopy"] forKey:@"issendcopy"];
    [self.request setPostValue:[dict objectForKey:@"notifylist"] forKey:@"notifylist"];
    
    [request setUsername:@"EDITNOTE"];
    [self.request startAsynchronous];
}
-(void)startResquestForGetSalesTrackList:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"toprows"] forKey:@"toprows"];

    [request setUsername:@"SalesTrackList"];
    [self.request startAsynchronous];
}
-(void)startResquestForAddSalesTrack:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"CompanyID"] forKey:@"CompanyID"];
    [self.request setPostValue:[dict objectForKey:@"EmployeeID"] forKey:@"EmployeeID"];
    [self.request setPostValue:[dict objectForKey:@"JobTitle"] forKey:@"JobTitle"];
    [self.request setPostValue:[dict objectForKey:@"JobDescription"] forKey:@"JobDescription"];
    [self.request setPostValue:[dict objectForKey:@"CustomerName"] forKey:@"CustomerName"];
    [self.request setPostValue:[dict objectForKey:@"CustomerInfo"] forKey:@"CustomerInfo"];
    
    [self.request setPostValue:[dict objectForKey:@"CustomerLocation"] forKey:@"CustomerLocation"];
    [self.request setPostValue:[dict objectForKey:@"CustomerContact"] forKey:@"CustomerContact"];
    [self.request setPostValue:[dict objectForKey:@"Latitude"] forKey:@"Latitude"];
    [self.request setPostValue:[dict objectForKey:@"Longitude"] forKey:@"Longitude"];
    [self.request setPostValue:[dict objectForKey:@"CustomerEmail"] forKey:@"CustomerEmail"];
    [self.request setPostValue:[dict objectForKey:@"CustomerCompany"] forKey:@"CustomerCompany"];
    [self.request setPostValue:[dict objectForKey:@"customerid"] forKey:@"customerid"];

    [request setUsername:@"AddSalesTrack"];
    [self.request startAsynchronous];
}
-(void)startResquestForDetailsSalesTrack:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
 
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"JobID"] forKey:@"JobID"];
    
    [request setUsername:@"SalesTrackDetails"];
    [self.request startAsynchronous];
}
-(void)startResquestForCheckinSalesTrack:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
   
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"JobID"] forKey:@"JobID"];
    [self.request setPostValue:[dict objectForKey:@"EmployeeID"] forKey:@"EmployeeID"];

    [request setUsername:@"SalesTrackCheckIn"];
    [self.request startAsynchronous];
}
-(void)startResquestForCheckOutSalesTrack:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"CompanyID"] forKey:@"CompanyID"];
    [self.request setPostValue:[dict objectForKey:@"JobID"] forKey:@"JobID"];
    [self.request setPostValue:[dict objectForKey:@"EmployeeID"] forKey:@"EmployeeID"];
    
    
    [self.request setPostValue:[dict objectForKey:@"TimeDuration"] forKey:@"TimeDuration"];
    [self.request setPostValue:[dict objectForKey:@"Purpose"] forKey:@"Purpose"];
    [self.request setPostValue:[dict objectForKey:@"AdditionalRemarks"] forKey:@"AdditionalRemarks"];
    
    [self.request setPostValue:[dict objectForKey:@"ClosedSales"] forKey:@"ClosedSales"];
    [self.request setPostValue:[dict objectForKey:@"CollectedFunds"] forKey:@"CollectedFunds"];
    [self.request setPostValue:[dict objectForKey:@"BuiltRelationship"] forKey:@"BuiltRelationship"];
    [self.request setPostValue:[dict objectForKey:@"CreatedAwarness"] forKey:@"CreatedAwarness"];
    [self.request setPostValue:[dict objectForKey:@"TotalSales"] forKey:@"TotalSales"];
    [self.request setPostValue:[dict objectForKey:@"TotalCollection"] forKey:@"TotalCollection"];
    
    [self.request setPostValue:[dict objectForKey:@"salesCurrencyID"] forKey:@"salesCurrencyID"];
    [self.request setPostValue:[dict objectForKey:@"collectionCurrencyID"] forKey:@"collectionCurrencyID"];

    [request setUsername:@"CheckOutSalesTrack"];
    [self.request startAsynchronous];
}

-(void)startResquestForSearchSalesTrack:(NSMutableDictionary*)dict
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
    // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
    NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@%@%@",BASE_HOST_URL,strDomainNm,BASE_URL_2];
    
    /*   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
     NSString *strDomainNm=[defaults objectForKey:@"CustomDomain"];
     // NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@",BASE_URL];
     NSString *tmpStr = [[NSString alloc] initWithFormat:@"%@/connector/crmappservice.aspx",strDomainNm];*/

    NSURL *url = [NSURL  URLWithString:[tmpStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"requrl: %@",url);
    
    self.request = [self initiateRequestWithURL:url];
    
    [self.request setPostValue:[dict objectForKey:@"op"] forKey:@"op"];
    [self.request setPostValue:[dict objectForKey:@"token"] forKey:@"token"];
    [self.request setPostValue:[dict objectForKey:@"userid"] forKey:@"userid"];
    [self.request setPostValue:[dict objectForKey:@"start_indx"] forKey:@"start_indx"];
    [self.request setPostValue:[dict objectForKey:@"toprows"] forKey:@"toprows"];
    [self.request setPostValue:[dict objectForKey:@"searchkey"] forKey:@"searchkey"];

    [request setUsername:@"SalesTrackSearch"];
    [self.request startAsynchronous];
}


#pragma mark - ASIFormDataRequest delegates
-(void)receivedData:(ASIHTTPRequest*) response
{
    NSLog(@"Received data");
}
- (void)requestFinished:(ASIHTTPRequest *)response
{
    [self.delegate connectionDidReceiveResponse:response];
    self.request = nil;
}
- (void)requestFailed:(ASIHTTPRequest *)response
{
    [self.delegate connectionDidFailedResponse:response];
    self.request = nil;
    
    NSLog(@"Connection failed");
}
@end

