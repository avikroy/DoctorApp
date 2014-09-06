//
//  CustomCell.h
//  PPRevealSideViewController
//
//  Created by Marian PAUL on 17/02/12.
//  Copyright (c) 2012 Marian PAUL aka ipodishima — iPuP SARL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    UIButton *_disclosureButton;
}

@property (nonatomic, retain) UILabel *myLabel;
@property (nonatomic, retain) UIImageView *myImage;
@property (nonatomic, retain) UIView *myView;
@end
