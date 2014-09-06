//
//  UIImageView+PhotoFrame.m
//  KidsKard
//
//  Created by Debasish on 03/09/13.
//  Copyright (c) 2014 Dreamztech Solutions. All rights reserved.
//

#import "UIImageView+PhotoFrame.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImageView (PhotoFrame)

- (void)applyPhotoFrame:(BOOL)isBorder
{
    if(isBorder)
    {
    self.layer.borderColor=[[UIColor colorWithRed:223.0/255.0 green:223.0/255.0 blue:223.0/255.0 alpha:1.0] CGColor];
    self.layer.borderWidth =7.0f;
    self.layer.cornerRadius = 30.0f;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(-3, 4);
    self.layer.shadowOpacity = 0.9;
    self.layer.shadowRadius = 2;
    self.clipsToBounds = YES;
    }
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    CGPathRef maskPath = CGPathCreateWithEllipseInRect(self.bounds, NULL);
    maskLayer.bounds = self.bounds;
    [maskLayer setPath:maskPath];
    [maskLayer setFillColor:[[UIColor blackColor] CGColor]];
    maskLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    [self.layer setMask:maskLayer];
    [maskLayer release];
    CGPathRelease(maskPath);
    
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    CGPathRef maskPath1 = CGPathCreateWithEllipseInRect(self.bounds, NULL);
    maskLayer1.bounds = self.bounds;
    [maskLayer1 setPath:maskPath1];
    [maskLayer1 setFillColor:[[UIColor clearColor] CGColor]];
    maskLayer1.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    maskLayer1.strokeColor = [[UIColor whiteColor] CGColor];
    maskLayer1.lineWidth = 6.0;
    [self.layer addSublayer:maskLayer1];
    [maskLayer1 release];
    CGPathRelease(maskPath1);
 }



- (void)applyPhotoFrameRed:(BOOL)isBorder
{
    if(isBorder)
    {
        self.layer.borderColor=[[UIColor colorWithRed:210.0/255.0 green:10.0/255.0 blue:10.0/255.0 alpha:1.0] CGColor];
        self.layer.borderWidth =7.0f;
        self.layer.cornerRadius = 30.0f;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(-3, 4);
        self.layer.shadowOpacity = 0.9;
        self.layer.shadowRadius = 2;
        self.clipsToBounds = YES;
    }
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    CGPathRef maskPath = CGPathCreateWithEllipseInRect(self.bounds, NULL);
    maskLayer.bounds = self.bounds;
    [maskLayer setPath:maskPath];
    [maskLayer setFillColor:[[UIColor blackColor] CGColor]];
    maskLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    [self.layer setMask:maskLayer];
    [maskLayer release];
    CGPathRelease(maskPath);
    
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    CGPathRef maskPath1 = CGPathCreateWithEllipseInRect(self.bounds, NULL);
    maskLayer1.bounds = self.bounds;
    [maskLayer1 setPath:maskPath1];
    [maskLayer1 setFillColor:[[UIColor clearColor] CGColor]];
    maskLayer1.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    maskLayer1.strokeColor = [[UIColor whiteColor] CGColor];
    maskLayer1.lineWidth = 6.0;
    [self.layer addSublayer:maskLayer1];
    [maskLayer1 release];
    CGPathRelease(maskPath1);
}

- (void)cleanPhotoFrame {
    /*self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 0.0f;
    self.layer.cornerRadius = 0.0f;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, -3);
    self.layer.shadowOpacity = 0;
    self.layer.shadowRadius = 3;
    self.clipsToBounds = YES;*/
    
    [[self.layer sublayers] makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    self.layer.mask = nil;
}

@end
