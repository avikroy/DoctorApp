//
//  AppToolBox.m
//  SigmaBioMedical
//
//  Created by Avik Roy on 05/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppToolBox.h"
#import <QuartzCore/QuartzCore.h>

@implementation AppToolBox

#pragma mark -
#pragma mark <create label>

+ (void)setLabel:(UILabel *)theLabel
{
	theLabel.backgroundColor = [UIColor clearColor];
	theLabel.textColor=[UIColor blackColor];
    theLabel.autoresizingMask=UIViewAutoresizingNone;

#ifdef __IPHONE_6_0
    theLabel.lineBreakMode = NSLineBreakByWordWrapping;
	theLabel.textAlignment = NSTextAlignmentLeft;
#else
    theLabel.lineBreakMode = UILineBreakModeWordWrap;
    theLabel.textAlignment = UITextAlignmentLeft;
#endif
	theLabel.numberOfLines=0;
	theLabel.font=[UIFont systemFontOfSize:20];
}

#pragma mark -
#pragma mark <create text box>

+ (void)setTextField:(UITextField *)textField
{
    textField.backgroundColor=[UIColor whiteColor];
    textField.layer.borderWidth=1.0;
#ifdef __IPHONE_6_0
	textField.textAlignment = NSTextAlignmentLeft;
#else
    textField.textAlignment = UITextAlignmentLeft;
#endif
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	textField.autocorrectionType=UITextAutocorrectionTypeNo;
    textField.font=[UIFont systemFontOfSize:18];
	textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    [textField.layer setBorderColor: [[UIColor grayColor] CGColor]];
//    textField.layer.MasksToBounds = false;
//    textField.layer.shadowOpacity=1.0;
//    textField.layer.shadowRadius =3.0;
//    textField.layer.shadowColor = [UIColor blackColor].CGColor;
//    textField.layer.shadowOffset = CGSizeMake(0.0,0.0);
}

#pragma mark -
#pragma mark <create text view>

+ (void)setTextView:(CustomTextView *)textView
{
	textView.editable = YES;
	//textView.layer.cornerRadius=10.0;
    [textView.layer setBorderColor: [[UIColor grayColor] CGColor]];
//    textView.layer.MasksToBounds = false;
//    textView.layer.shadowOpacity=1.0;
//    textView.layer.shadowRadius =3.0;
//    textView.layer.shadowColor = [UIColor blackColor].CGColor;
//    textView.layer.shadowOffset = CGSizeMake(0.0,0.0);
	textView.autocorrectionType=UITextAutocorrectionTypeNo;
	textView.font=[UIFont systemFontOfSize:18];
	textView.layer.borderWidth=1.0;
    //textView.clipsToBounds = YES;
}

#pragma mark -
#pragma mark <create image button>

+(UIButton *)createImgButtonWithFrame:(CGRect)frame withImages:(NSArray *)array
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom] ;
    button.frame = frame;
    button.showsTouchWhenHighlighted=YES;
	
	if([array count]!=0)
	{	
		[button setBackgroundImage:[UIImage imageNamed:[array objectAtIndex:0]] forState:UIControlStateNormal];	
	}
	
	if([array count]==2)
	{	
		[button setBackgroundImage:[UIImage imageNamed:[array objectAtIndex:1]] forState:UIControlStateSelected];
	}
	
	return button;
	
}

#pragma mark -
#pragma mark <create rounded button>

+(UIButton *)createRoundedButtonWithFrame:(CGRect)frame withText:(NSString *)text 
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    button.frame = frame;
	[button setTitle:text forState:UIControlStateNormal];
	return button;
	
}

#pragma mark -
#pragma mark <get application images from bundle>

+ (UIImage *)getImageFromAppBundle : (NSString *) imgName 
{
    UIImage *image= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imgName ofType:@"png"]];
    return image;
}

#pragma mark -
#pragma mark <get height for text>

+ (CGFloat) heightForText:(NSString*) theText withFont:(UIFont*) theFont LineBreakMode:(NSLineBreakMode)lbm maxSize:(CGSize)size
{
	CGSize maximumLabelSize = size;
	
	CGSize expectedLabelSize = [theText sizeWithFont:theFont
                                   constrainedToSize:maximumLabelSize
                                       lineBreakMode:lbm];
	
	return expectedLabelSize.height;
}

#pragma mark -
#pragma mark - trim white space 

+ (NSString *)trimWhiteSpace:(NSString *)str
{
    NSString *trimmedString = [str stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];
    return trimmedString;
}

#pragma mark -
#pragma mark <create Tableview>

+ (UITableView *) createTableViewWithFrame:(CGRect)frame
{
    UITableView  *tableView= [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    [tableView setSeparatorColor:[UIColor grayColor]];
    tableView.backgroundColor=[UIColor clearColor];
    tableView.scrollEnabled = NO;
    return tableView;
}

- (BOOL)checkDeviceVersioForiOS_6
{
#ifdef __IPHONE_6_0 
    return YES;
#endif
    return NO;
}

#pragma mark - set date format

- (NSString *)getFormattedDateFromString:(NSString *)str
{
    NSArray *arr=[str componentsSeparatedByString:@" "];
    NSString *dateString = [arr objectAtIndex:0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:dateString];
    
    [dateFormatter setDateFormat:@"dd.MM.yy"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    
    [dateFormatter release];
    return strDate;
}

- (NSString *)calculateTwitterDate:(NSString *)strDate
{
    NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
    [df setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    NSDate *date = [df dateFromString:strDate];
    NSTimeInterval secondsBetween = [[NSDate date] timeIntervalSinceDate:date];
	if(secondsBetween<60)
    {
        return [NSString stringWithFormat:@"%d Second",(int)secondsBetween];
    }
    else
    {
        int numberOfMins = secondsBetween / 60;
        if(numberOfMins<60)
        {
            return [NSString stringWithFormat:@"%d Min",numberOfMins];
        }
        else
        {
            int numberOfHrs = numberOfMins / 60;
            if(numberOfHrs<24)
            {
                return [NSString stringWithFormat:@"%d Hrs",numberOfHrs];
            }
            else
            {
                int numberOfDays = numberOfHrs / 24;
                return [NSString stringWithFormat:@"%d Day",numberOfDays];
            }
            
        }
    }
    
    return @"";
}

#pragma mark - set status bar

+ (void)showStatusBar:(BOOL)bShow
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [[UIApplication sharedApplication] setStatusBarHidden:(!bShow)];
}

#pragma mark - get scroll view of webview

+ (UIScrollView *)getScrollOfWebview:(UIWebView *)aWebView
{
    UIScrollView *scrollView = nil;
    if ([aWebView respondsToSelector:@selector(scrollView)])//iOS 5+
    {
        
        scrollView = aWebView.scrollView;
        
    }
    else //iOS 4-
    {
        for(UIView *view in aWebView.subviews)
        {
            if([view isKindOfClass:[UIScrollView class] ])
            {
                scrollView = (UIScrollView *) view;
                break;
            }
        }
    }
    return scrollView;
}

+ (NSString *)getEncodedStringFromString:(NSString *)str
{
    NSString *encodedString = [str stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    return encodedString;
}

+ (BOOL)isDeviceiPhone5
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
#ifdef DEBUG
            //NSLog(@"iPhone CLASSIC");
#endif
            return NO;
        }
        if(result.height == 568)
        {
#ifdef DEBUG
            //NSLog(@"iPhone 5");
#endif
            return YES;
        }
    }
    return NO;
}

+(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width
{
    float oldWidth = sourceImage.size.width;
    float scaleFactor = i_width / oldWidth;
    
    float newHeight = sourceImage.size.height * scaleFactor;
    float newWidth = oldWidth * scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/*
 Animate using block
 ----------------------------------- 
 [UIView animateWithDuration:0.5
 
 animations:^{ 
 [self.view viewWithTag:3].alpha = 0.0; 
 [[self.view viewWithTag:3] removeFromSuperview];
 
 }
 
 completion:^(BOOL  completed){
 [self createToolBarActivity];
 }
 ];
 
 */
/*
 Changing device orientation forcefully
 ---------------------------------------------------------------
  [[UIDevice currentDevice] performSelector:@selector(setOrientation:) withObject:(id)UIInterfaceOrientationLandscapeRight];
 */

@end
