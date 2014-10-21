//
//  MeetTeamViewController.m
//  DoctorApp
//
//  Created by Debasish on 14/10/14.
//  Copyright (c) 2014 Debasish. All rights reserved.
//

#import "MeetTeamViewController.h"
#import "DDPageControl.h"
#define ARC4RANDOM_MAX	0x100000000
@interface MeetTeamViewController ()

@end

@implementation MeetTeamViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.arrImgSlides=[[NSMutableArray alloc]initWithObjects:@"Dentist650x400.jpg",@"dental-assistant.jpg", @"secretary.jpg",nil];
    self.arrLblTitleSlides=[[NSMutableArray alloc]initWithObjects:@"Dr. Olivier EMERY",@"Cynthia AMARA", @"Jeanne Leclerc",nil];
    self.arrLblSubTitleSlides=[[NSMutableArray alloc]initWithObjects:@"Endodontist",@"Dental Assistant", @"Secrétaire",nil];
    self.arrLblDescSlides=[[NSMutableArray alloc]initWithObjects:@"Dr. Olivier Emery is a well known Paris endodontist. He received a B.A. and D.D.S. from the University of Paris before earning his Hospital Dentistry and General Practice Residency certification from the prestigious and world-renowned Cedar Sinai Medical Center in Los Angeles.  He then attended the highly exclusive Albert Einstein Medical Center (AEMC) for further specialization and certification in endodontics.  It was at AEMC that Dr. Emery received his expertise and training in the subspecialty of microsurgery.  He is a board eligible member of the American Association of Endodontist and maintains membership with the American Dental Association, the French Dental Association and the Paris Dental Society. Dr. Emery has lectured to a multitude of dental clinicians and is active in developing new and innovative techniques and instruments for the dental field.  He has served on many committees for the advancement of dentistry. Dr. Emery has been given several honors by many institutions throughout his prolific career. He speaks several languages among which are Spanish and French.",@"Cynthia AMARA is a Dental Assistant who graduated from Everest Institute in 2011. She is originally from Brazil and has resided in Paris for 12 years. She has a passion for dentistry and the field of work she has chosen. Cynthia has a very upbeat and enthusiastic attitude and takes pride in helping patients feel comfortable and relaxed during procedures. In September she returns to school for a degree in Dentistry. In her free time, Cynthia takes care of a 6 year-old special needs child and enjoys traveling with her family.", @"Ms. Leclerc has been working at our dental endodontic office for 3 years. She graduated from Madison Park School and has earned certificates as a Child Care Provider, in CPR and First Aid. One focus of Jeanne’s responsibility is processing pre-treatments to the insurance companies on the patient’s behalf. She is an essential member of the team. She is in charge of providing patients with the correct treatment plan, and coordinating necessary work with our lab technicians to ensure that patients get the best treatment offered. Jeanne acts also as treatment plan coordinator for all patients. In her free time, Jeanne enjoys traveling, spending time with her family and her 3 year old daughter.",nil];

    [self arrangeScrollImage];

    [self layoutViews];
    // Do any additional setup after loading the view from its nib.
  }

#pragma mark- Layout Views Method
-(void)layoutViews
{
    if (iphoneTallScreen())
    {
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.1"))
        {
        }
        else if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
        {
        }
        else
        {
            self.scrollVwBG.frame = CGRectMake(self.scrollVwBG.frame.origin.x,self.scrollVwBG.frame.origin.y+64.0,self.scrollVwBG.frame.size.width,self.scrollVwBG.frame.size.height);
        }
    }
    else
    {
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.1"))
        {
            self.scrollVwBG.frame = CGRectMake(self.scrollVwBG.frame.origin.x,self.scrollVwBG.frame.origin.y,self.scrollVwBG.frame.size.width,self.scrollVwBG.frame.size.height-88.0);

        }
        else if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
        {
            self.scrollVwBG.frame = CGRectMake(self.scrollVwBG.frame.origin.x,self.scrollVwBG.frame.origin.y,self.scrollVwBG.frame.size.width,self.scrollVwBG.frame.size.height-88.0);

        }
        else
        {
            self.scrollVwBG.frame = CGRectMake(self.scrollVwBG.frame.origin.x,self.scrollVwBG.frame.origin.y+64.0,self.scrollVwBG.frame.size.width,self.scrollVwBG.frame.size.height-88.0);
        }
    }
}

#pragma mark- Create ScrollImageView
- (void)arrangeScrollImage
{
    int cx=0;
    for (int i=0; i<[self.arrImgSlides count]; i++)
    {
        UILabel  *lblCellTitle = [[UILabel alloc] init];
        if (iphoneTallScreen())
        {
           lblCellTitle.frame=CGRectMake(cx+40, 45, 241, 27);
        }
        else
        {
            if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.1"))
            {
                lblCellTitle.frame=CGRectMake(cx+40, 40, 241, 27);
            }
            else if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
            {
            }
            else
            {
               lblCellTitle.frame=CGRectMake(cx+40, 40, 241, 27);
            }
        }
        lblCellTitle.backgroundColor = [UIColor clearColor];
        lblCellTitle.textAlignment = NSTextAlignmentCenter;
        lblCellTitle.numberOfLines=1;
        lblCellTitle.textColor=[UIColor whiteColor];
        lblCellTitle.text = [self.arrLblTitleSlides objectAtIndex:i];
        lblCellTitle.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0];
        [self.scrollVwBG addSubview:lblCellTitle];

        UILabel  * lblCellSubTitle = [[UILabel alloc] init];
        if (iphoneTallScreen())
        {
           lblCellSubTitle.frame=CGRectMake(cx+26, 75, 268, 21);
        }
        else
        {
            if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.1"))
            {
               lblCellSubTitle.frame=CGRectMake(cx+26, 68, 268, 21);
            }
            else if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
            {
            }
            else
            {
              lblCellSubTitle.frame=CGRectMake(cx+26, 70, 268, 21);
            }
        }
        lblCellSubTitle.backgroundColor = [UIColor clearColor];
        lblCellSubTitle.textAlignment = NSTextAlignmentCenter;
        lblCellSubTitle.numberOfLines=1;
        lblCellSubTitle.textColor=[UIColor whiteColor];
        lblCellSubTitle.text = [self.arrLblSubTitleSlides objectAtIndex:i];
        lblCellSubTitle.font=[UIFont fontWithName:@"HelveticaNeue-Thin" size:15.0];
        [self.scrollVwBG addSubview:lblCellSubTitle];

        UITextView *txtView = [[UITextView alloc] init ];
       if (iphoneTallScreen())
       {
           txtView.frame=CGRectMake(cx+38, 307, 245, 173);
       }
       else
       {
           if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.1"))
           {
               txtView.frame = CGRectMake(cx+38,250.0,245,173);
           }
           else if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
           {
           }
           else
           {
               txtView.frame = CGRectMake(cx+38,250.0,245,173);
           }
       }
        [txtView setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:12.0]];
        txtView.backgroundColor = [UIColor clearColor];
        txtView.text = [self.arrLblDescSlides objectAtIndex:i];
       // txtView.userInteractionEnabled = NO;
        txtView.alpha=0.7;
        txtView.textColor=[UIColor whiteColor];
        txtView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
        [self.scrollVwBG addSubview:txtView];
        
        UIImageView *imgCell=[[UIImageView alloc] init];
        if (iphoneTallScreen())
        {
            imgCell.frame=CGRectMake(cx+0,110, 320, 187);
        }
        else
        {
            imgCell.frame=CGRectMake(cx+40,88, 240, 151);
        }
        
        imgCell.image=[UIImage imageNamed:[self.arrImgSlides objectAtIndex:i]];
        imgCell.backgroundColor=[UIColor clearColor];
        
        cx+=320;
        [self.scrollVwBG addSubview:imgCell];
    }

    
    int numberOfPages = [self.arrImgSlides count];
    // programmatically add the page control
	pageControl = [[DDPageControl alloc] init] ;
    //	[pageControl setCenter: CGPointMake(self.contentView.center.x, self.contentView.bounds.size.height-30.0f)] ;
    if (iphoneTallScreen())
    {
        [pageControl setCenter: CGPointMake(150, 505)] ;
    }
    else
    {
        [pageControl setCenter: CGPointMake(150, 445)] ;
    }
    
  	[pageControl setNumberOfPages: numberOfPages] ;
	[pageControl setCurrentPage: 0] ;
	[pageControl addTarget: self action: @selector(pageControlClicked:) forControlEvents: UIControlEventValueChanged] ;
	[pageControl setDefersCurrentPageDisplay: YES] ;
	[pageControl setType: DDPageControlTypeOnFullOffEmpty] ;
	[pageControl setOnColor: [UIColor colorWithRed:255.0/255.0f green:255.0/255.0f blue:255.0/255.0f alpha:1.0f]] ;
	[pageControl setOffColor: [UIColor colorWithRed:255.0/255.0f green:255.0/255.0f blue:255.0/255.0f alpha: 1.0f]] ;
	[pageControl setIndicatorDiameter: 12.0f] ;
	[pageControl setIndicatorSpace: 12.0f] ;
	[self.view addSubview: pageControl] ;
    
    CGRect pageFrame ;
    
    for (int i = 0 ; i < numberOfPages ; i++)
	{
		// determine the frame of the current page
		pageFrame = CGRectMake(i * self.scrollVwBG.bounds.size.width, 0.0f, self.scrollVwBG.bounds.size.width, self.scrollVwBG.bounds.size.height) ;
    }
    
    if (iphoneTallScreen())
    {
        self.scrollVwBG.contentSize=CGSizeMake(cx, 370);
    }
    else
    {
        self.scrollVwBG.contentSize=CGSizeMake(cx, 278);
    }
}

#pragma mark - DDPageControl triggered action
- (void)pageControlClicked:(id)sender
{
	DDPageControl *thePageControl = (DDPageControl *)sender ;
	
	// we need to scroll to the new index
	[self.scrollVwBG setContentOffset: CGPointMake(self.scrollVwBG.bounds.size.width * thePageControl.currentPage, self.scrollVwBG.contentOffset.y) animated: YES] ;
    [pageControl setCurrentPage: thePageControl.currentPage] ;
    [pageControl setOnColor: [UIColor colorWithRed:255.0/255.0f green:255.0/255.0f blue:255.0/255.0f alpha:1.0f]] ;
	[pageControl setOffColor: [UIColor colorWithRed:255.0/255.0f green:255.0/255.0f blue:255.0/255.0f alpha: 1.0f]] ;
}


#pragma mark - UIScrollView delegate methods
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
	CGFloat pageWidth = self.scrollVwBG.bounds.size.width ;
    float fractionalPage = self.scrollVwBG.contentOffset.x / pageWidth ;
	NSInteger nearestNumber = lround(fractionalPage) ;
    
    
	if (pageControl.currentPage != nearestNumber)
	{
		pageControl.currentPage = nearestNumber ;
		
		// if we are dragging, we want to update the page control directly during the drag
		if (self.scrollVwBG.dragging)
			[pageControl updateCurrentPageDisplay] ;
	}
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)aScrollView
{
	// 	[pageControl updateCurrentPageDisplay] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
