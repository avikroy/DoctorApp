//
//  MeetTeamViewController.h
//  DoctorApp
//
//  Created by Debasish on 14/10/14.
//  Copyright (c) 2014 Debasish. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DDPageControl ;
@interface MeetTeamViewController : UIViewController
{
    DDPageControl *pageControl ;
    
}

@property(retain,nonatomic)NSMutableArray *arrImgSlides;
@property(retain,nonatomic)NSMutableArray *arrLblTitleSlides;
@property(retain,nonatomic)NSMutableArray *arrLblSubTitleSlides;
@property(retain,nonatomic)NSMutableArray *arrLblDescSlides;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollVwBG;
@property (weak, nonatomic) IBOutlet UIImageView *imgVw;
@property (weak, nonatomic) IBOutlet UITextView *txtVwDesc;

@end
