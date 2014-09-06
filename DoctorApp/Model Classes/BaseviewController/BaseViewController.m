//
//  BaseViewController.m
//  Write Right
//
//  Created by F9 Mac 2 on 25/06/13.
//  Copyright (c) 2013 Sourish Ghosh. All rights reserved.
//

#import "BaseViewController.h"
#import "JSON.h"
#import "SBJSON.h"
#import "Reachability.h"
@interface BaseViewController ()
{
    ConnectionModel *conModel;
}

@end

@implementation BaseViewController
@synthesize HUD;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
-(void) viewWillAppear:(BOOL)animated
{
     [self.presentingViewController beginAppearanceTransition:YES animated: animated];
}
-(void) viewDidAppear:(BOOL)animated
{
    [self.presentingViewController endAppearanceTransition];
}
-(void) viewWillDisappear:(BOOL)animated
{
    [self.presentingViewController beginAppearanceTransition: NO animated: animated];
}
-(void) viewDidDisappear:(BOOL)animated
{
    [self.presentingViewController endAppearanceTransition];
}

#pragma mark - Create HUD
-(void)createHUD
{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.delegate = self;
    HUD.labelText = @"Please wait...";
    //HUD.detailsLabelText = @"Please wait...";
    HUD.square = YES;
}
-(void)showHUD
{
    self.view.userInteractionEnabled=NO;
     [self.HUD show:YES];

}
-(void)hideHUD
{
    [self.HUD hide:YES];
    self.view.userInteractionEnabled=YES;
}

#pragma mark - Create NavigationView
-(void)createNavigationView:(NSString*)strHeading
{
    for(UIView* view in self.navigationController.navigationBar.subviews)
    {
        if ([view isKindOfClass:[UILabel class]])
        {
            [view removeFromSuperview];
        }
        if ([view isKindOfClass:[UIButton class]])
        {
            [view removeFromSuperview];
        }
    }
    
    UILabel *lblHeading=[[UILabel alloc] initWithFrame:CGRectMake(60, 6, 160,32)];
    lblHeading.textAlignment=NSTextAlignmentCenter;
    lblHeading.text=strHeading;
    lblHeading.textColor=[UIColor blackColor];
    lblHeading.font=[UIFont systemFontOfSize:18];
    [lblHeading setBackgroundColor:[UIColor clearColor]];
    self.navigationItem.titleView=lblHeading;
}

-(void)createNavigationSlideView:(NSString*)strHeading
{
    for(UIView* view in self.navigationController.navigationBar.subviews)
    {
        if ([view isKindOfClass:[UILabel class]])
        {
            [view removeFromSuperview];
        }
        if ([view isKindOfClass:[UIButton class]])
        {
            [view removeFromSuperview];
        }
    }
    
    for(UIView* view in self.navigationController.view.subviews)
    {
        if(view.tag == 100 )
        {
            [view removeFromSuperview];
        }
    }

    UIButton *btnLeft=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnLeft setImage:[UIImage imageNamed:@"listing_icon.png"]  forState:UIControlStateNormal ];
    [btnLeft addTarget:self action:@selector(showLeft) forControlEvents:UIControlEventTouchUpInside];
    [btnLeft setFrame:CGRectMake(0, 0, 22, 12) ];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnLeft];
    
    UILabel *lblHeading=[[UILabel alloc] initWithFrame:CGRectMake(60, 6, 160,32)];
    lblHeading.textAlignment=NSTextAlignmentCenter;
    lblHeading.text=strHeading;
    lblHeading.textColor=[UIColor blackColor];
    lblHeading.font=[UIFont systemFontOfSize:18];
    [lblHeading setBackgroundColor:[UIColor clearColor]];
    self.navigationItem.titleView=lblHeading;
  }
-(void)createNavigationSlideDetailView:(NSString*)strHeading
{
    for(UIView* view in self.navigationController.navigationBar.subviews)
    {
        if ([view isKindOfClass:[UILabel class]])
        {
            [view removeFromSuperview];
        }
        if ([view isKindOfClass:[UIButton class]])
        {
            [view removeFromSuperview];
        }
    }
    
    for(UIView* view in self.navigationController.view.subviews)
    {
        if(view.tag == 100 )
        {
            [view removeFromSuperview];
        }
    }
    
    UIButton *btnLeft=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnLeft setImage:[UIImage imageNamed:@"listing_icon.png"]  forState:UIControlStateNormal ];
    [btnLeft addTarget:self action:@selector(showLeft) forControlEvents:UIControlEventTouchUpInside];
    [btnLeft setFrame:CGRectMake(0, 0, 22, 12) ];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnLeft];
    
    UIButton *btnRight=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnRight setImage:[UIImage imageNamed:@"btngoback.png"]  forState:UIControlStateNormal ];
    [btnRight addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [btnRight setFrame:CGRectMake(0, 0, 63, 28) ];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnRight];
  
    UILabel *lblHeading=[[UILabel alloc] initWithFrame:CGRectMake(60, 6, 160,32)];
    lblHeading.textAlignment=NSTextAlignmentCenter;
    lblHeading.text=strHeading;
    lblHeading.textColor=[UIColor blackColor];
    lblHeading.font=[UIFont systemFontOfSize:18];
    [lblHeading setBackgroundColor:[UIColor clearColor]];
    self.navigationItem.titleView=lblHeading;
}


-(void)createNavigationAddView:(NSString*)strHeading
{
    for(UIView* view in self.navigationController.navigationBar.subviews)
    {
        if ([view isKindOfClass:[UILabel class]])
        {
            [view removeFromSuperview];
        }
        if ([view isKindOfClass:[UIButton class]])
        {
            [view removeFromSuperview];
        }
    }
    
    for(UIView* view in self.navigationController.view.subviews)
    {
       if(view.tag == 100 )
       {
            [view removeFromSuperview];
        }
    }
    
    UIBarButtonItem* btnLeft = [[UIBarButtonItem alloc] initWithTitle: @"Save"
                                                               style: UIBarButtonItemStylePlain
                                                              target: self
                                                              action: @selector(save)];
   self.navigationItem.leftBarButtonItem = btnLeft;
    
    UIBarButtonItem* btnRight= [[UIBarButtonItem alloc] initWithTitle: @"Cancel"
                                                                style: UIBarButtonItemStylePlain
                                                               target: self
                                                               action: @selector(cancel)];
    self.navigationItem.rightBarButtonItem = btnRight;

    UILabel *lblHeading=[[UILabel alloc] initWithFrame:CGRectMake(60, 6, 160,32)];
    lblHeading.textAlignment=NSTextAlignmentCenter;
    lblHeading.text=strHeading;
    lblHeading.textColor=[UIColor blackColor];
    lblHeading.font=[UIFont systemFontOfSize:18];
    [lblHeading setBackgroundColor:[UIColor clearColor]];
    self.navigationItem.titleView=lblHeading;
}

#pragma mark - Check network rechability
 BOOL isNetworkAvailable ()
{
    BOOL isInternet=NO;
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN))
       isInternet=NO;
    else
       isInternet=YES;
    
    return isInternet;
}
#pragma mark - Check iPhone ScreenSize
BOOL iphoneTallScreen ()
{
    BOOL isChecked= NO;
    
    if ([UIScreen mainScreen].scale == 2.0f)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        CGFloat scale = [UIScreen mainScreen].scale;
        result = CGSizeMake(result.width * scale, result.height * scale);
        if(result.height == 1136)
        {
            isChecked=YES;
        }
    }
    return isChecked;
}
#pragma mark - Check Device types
Devicefamily thisDeviceFamily()
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        if (iphoneTallScreen()) return iPhone5;
        else return iPhone;
    }
    else return iPad;
}

-(BOOL)validateEmail:(NSString *)str
{
	BOOL stricterFilter = YES;
	NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
	NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	return [emailTest evaluateWithObject:str];
}

#pragma mark - Keyboard resign First responder on anywhere tap
/*-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion:nil];
    [self.view endEditing:YES];
}*/

-(void)createAlertView:(NSString *)alrtTitle withAlertMessage:(NSString *)alrtMsg withAlertTag:(int)alrtTag
{
    UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:alrtTitle
                                                      message:alrtMsg
                                                     delegate:self
                                            cancelButtonTitle:nil
                                            otherButtonTitles:@"OK", nil];
    myAlert.tag=alrtTag;
    [myAlert show];
}

-(NSString *)convertToCorrectDate:(NSString *)strTransDate
{
    NSArray *arrDateTime=[strTransDate componentsSeparatedByString:@" "];
    NSString *strDate=[arrDateTime objectAtIndex:0];
    NSArray *arrDate=[strDate componentsSeparatedByString:@"-"];
    NSString *stryyyy=[arrDate objectAtIndex:0];
    NSString *strMM=[arrDate objectAtIndex:1];
    NSString *strdd=[arrDate objectAtIndex:2];
    
    NSString *strFinalDate=[NSString stringWithFormat:@"%@.%@.%@",strdd,strMM,stryyyy];
    return strFinalDate;
}

-(NSString *)convertToDate:(NSString *)strDate
{
    NSArray *arrDate=[strDate componentsSeparatedByString:@"/"];
    
    //NSString *stryyyy=[arrDate objectAtIndex:0];
    NSString *strMM=[arrDate objectAtIndex:1];
    NSString *strMonthNm=[self monthName:strMM];
    NSString *strdd=[arrDate objectAtIndex:2];
    NSString *strFinalDate=[NSString stringWithFormat:@"%@ %@",strMonthNm,strdd];
 
    return strFinalDate;
}
-(NSString *)convertToFileDate:(NSString *)strDate
{
    NSArray *arrDate=[strDate componentsSeparatedByString:@"/"];
    
    //NSString *stryyyy=[arrDate objectAtIndex:0];
    NSString *strMM=[arrDate objectAtIndex:0];
    NSString *strMonthNm=[self monthName:strMM];
    NSString *strdd=[arrDate objectAtIndex:1];
    NSString *strFinalDate=[NSString stringWithFormat:@"%@ %@",strMonthNm,strdd];
    
    return strFinalDate;
}


-(NSString*)monthName:(NSString *)monthVal
{
    if([monthVal isEqualToString:@"01"])
        return  @"Jan";
        //return  @"January";
    
    if([monthVal isEqualToString:@"02"])
        return   @"Feb";
       // return   @"February";
    
    if([monthVal isEqualToString:@"03"])
         return  @"Mar";
        //return  @"March";
    
    if([monthVal isEqualToString:@"04"])
          return @"Apr";
       // return @"April";
    
    if([monthVal isEqualToString:@"05"])
        return @"May";
    
    if([monthVal isEqualToString:@"06"])
        return @"June";
    
    if([monthVal isEqualToString:@"07"])
        return   @"July";
    
    if([monthVal isEqualToString:@"08"])
        return  @"Aug";
        //return  @"August";
    
    if([monthVal isEqualToString:@"09"])
        return @"Sept";
        //return @"September";
    
    if([monthVal isEqualToString:@"10"])
        return @"Oct";
        //return @"October";
    
    if([monthVal isEqualToString:@"11"])
        return @"Nov";
        //return @"November";
    
    if([monthVal isEqualToString:@"12"])
        return @"Dec";
        //return @"December";
    
    return nil;
}

-(NSString*)convertToCapital:(NSString *)strInput
{
    NSString *firstCapChar = [[strInput substringToIndex:1] capitalizedString];
    NSString *cappedStr = [strInput stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:firstCapChar];
 
    return cappedStr;
}
- (UIViewController *)backViewController
{
    NSInteger numberOfViewControllers = self.navigationController.viewControllers.count;
    
    if (numberOfViewControllers < 2)
        return nil;
    else
        return [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 2];
}
- (CLLocationCoordinate2D) geoCodeUsingAddress:(NSString *)address
{
    double latitude = 0, longitude = 0;
    NSString *esc_addr =  [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\" :" intoString:nil] && [scanner scanString:@"\"lat\" :" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"\"lng\" :" intoString:nil] && [scanner scanString:@"\"lng\" :" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
    }
    CLLocationCoordinate2D center;
    center.latitude = latitude;
    center.longitude = longitude;
    return center;
}
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (BOOL) validateUrl: (NSString *) candidate {
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:candidate];
}
@end
