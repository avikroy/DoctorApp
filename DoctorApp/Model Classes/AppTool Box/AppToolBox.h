//
//  AppToolBox.h
//  SigmaBioMedical
//

//  Created by Avik Roy on 05/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomTextView.h"

@interface AppToolBox : NSObject<UITextViewDelegate> 
{

}

+ (void)setLabel:(UILabel *)theLabel;
+ (void)setTextField:(UITextField *)textField;
+ (void)setTextView:(CustomTextView *)textView;

+ (UIButton *)createImgButtonWithFrame:(CGRect)frame withImages:(NSArray *)array;
+ (UIButton *)createRoundedButtonWithFrame:(CGRect)frame withText:(NSString *)text;
+ (UIImage *)getImageFromAppBundle : (NSString *) imgName ;
+ (CGFloat)heightForText:(NSString*) theText withFont:(UIFont*) theFont LineBreakMode:(NSLineBreakMode)lbm maxSize:(CGSize)size;
+ (NSString *)trimWhiteSpace:(NSString *)str;
+ (UITableView *) createTableViewWithFrame:(CGRect)frame;
+ (void)showStatusBar:(BOOL)bShow;
+ (UIScrollView *)getScrollOfWebview:(UIWebView *)aWebView;
+ (NSString *)getEncodedStringFromString:(NSString *)str;
+ (BOOL)isDeviceiPhone5;

+(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width;
@end
