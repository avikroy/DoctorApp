//
//  BaseViewController.h
//  Write Right
//
//  Created by F9 Mac 2 on 25/06/13.
//  Copyright (c) 2013 Sourish Ghosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "ConnectionModel.h"
#import "Global.h"
#import <CoreLocation/CoreLocation.h>
typedef enum {
	iPhone5 = 0,
    iPhone,
    iPad
} Devicefamily;

@interface BaseViewController : UIViewController<MBProgressHUDDelegate,connectionDidReceiveResponse>
{
    BOOL isLogout;
}
@property (retain,nonatomic) MBProgressHUD *HUD;
Devicefamily thisDeviceFamily();
-(void)createHUD;
-(void)showHUD;
-(void)hideHUD;
-(void)createNavigationView:(NSString*)strHeading;
-(void)createNavigationSlideView:(NSString*)strHeading;
-(void)createNavigationAddView:(NSString*)strHeading;
-(void)createNavigationSlideDetailView:(NSString*)strHeading;
BOOL isNetworkAvailable ();
BOOL iphoneTallScreen ();
-(BOOL)validateEmail:(NSString *)str;
-(void)createAlertView:(NSString *)alrtTitle withAlertMessage:(NSString *)alrtMsg withAlertTag:(int)alrtTag;
-(NSString *)convertToCorrectDate:(NSString *)strTransDate;
-(NSString *)convertToDate:(NSString *)strDate;
-(NSString *)convertToFileDate:(NSString *)strDate;
-(NSString*)convertToCapital:(NSString *)strInput;
- (UIViewController *)backViewController;
- (CLLocationCoordinate2D) geoCodeUsingAddress:(NSString *)address;
-(NSString*)monthName:(NSString *)monthVal;
- (BOOL) validateUrl: (NSString *) candidate;
@end
