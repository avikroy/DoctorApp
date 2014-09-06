//
//  CustomCell.m
//  PPRevealSideViewController
//
//  Created by Marian PAUL on 17/02/12.
//  Copyright (c) 2012 Marian PAUL aka ipodishima — iPuP SARL. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize myLabel = _myLabel;
@synthesize myImage = _myImage;
@synthesize myView=_myView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
 
        self.textLabel.backgroundColor = [UIColor clearColor];
        
        _myView = [[UIView alloc] initWithFrame:CGRectZero];
        _myView.backgroundColor = [UIColor colorWithRed:8.0f/255.0f green:96.0f/255.0f blue:118.0f/255.0f alpha:1.0];
          [self.contentView addSubview:_myView];

        _myLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _myLabel.backgroundColor = [UIColor clearColor];
        _myLabel.numberOfLines = 1;
        _myLabel.textColor = [UIColor colorWithRed:242.0f/255.0f green:243.0f/255.0f blue:244.0f/255.0f alpha:1.0];
        [_myLabel setFont:[UIFont systemFontOfSize:17.0]];
         [self.contentView addSubview:_myLabel];
        
        _myImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        _myImage.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_myImage];
        
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];    

    _myImage.frame = CGRectMake(10,7,37,37);
    _myLabel.frame = CGRectMake(70,10,160,30);
    _myView.frame = CGRectMake(0,3,320,44);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) dealloc {
    self.myLabel = nil;
#if !PP_ARC_ENABLED
    [super dealloc];
#endif
}

@end
