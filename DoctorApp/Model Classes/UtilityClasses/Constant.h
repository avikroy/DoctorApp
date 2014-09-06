//
//  Constant.h
//  BubbleBing
//
//  Created by Debasish Pal on 25/05/12.
//  Copyright (c) 2012 ObjectSol Technologies. All rights reserved.
//
#define BASE_URL @"http://myteamconnector.com/connector/crmappservice.aspx"
#define BASE_HOST_URL @"https://myteamconnector.com/"
#define BASE_URL_2 @"/crmappservice.aspx"

#define App_Delegate_Instance (AppDelegate *)[[UIApplication sharedApplication]delegate]
#define User_Defaults [NSUserDefaults standardUserDefaults]

#define SectionHeaderHeight_iPhone 20
#define SectionHeaderHeight_iPad 40

#define ConnectionUnavailable @"The Internet Connection appears to be Offline.Please Try again later."
//#define ConnectionSlow @"The Internet Connection appears to be very slow.Please Try again later."
#define ConnectionSlow @"This is not responding right now. Please try again after somewhile."

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
