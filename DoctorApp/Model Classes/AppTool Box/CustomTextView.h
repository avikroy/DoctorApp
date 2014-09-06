//
//  CustomTextView.h
//  MEOC
//
//  Created by ASHIM SAMANTA on 26/11/11.
//  Copyright 2011 ObjectSol Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CustomTextView : UITextView
{
    NSString *placeholder;
    UIColor *placeholderColor;
    
@private
    UILabel *placeHolderLabel;
}
@property (nonatomic, strong) UILabel *placeHolderLabel;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;
@end
