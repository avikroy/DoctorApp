//
//  AsyncImageView1.m
//  DesiSongStar
//
//  Created by Debasish Pal on 04/01/13.
//  Copyright (c) 2013 deb.pal2009@gmail.com. All rights reserved.
//

#import "AsyncImageView1.h"

@implementation AsyncImageView1
@synthesize needsResize,imageCorp;
- (void)dealloc
{
	[connection cancel]; 
	[connection release];
	[data release]; 
    [super dealloc];
}


- (void)loadImageFromURL:(NSURL*)url
{
	if (connection!=nil) 
	{ 
		[connection release]; 
	} 
	if (data!=nil)
	{ 
		[data release];
	}
	
	spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	[spinner setCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0)]; 
	[self addSubview:spinner];
    
	NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self]; 
}


- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData
{
	[spinner startAnimating];
	if (data==nil)
	{
		data = [[NSMutableData alloc] initWithCapacity:2048];
	} 
	[data appendData:incrementalData];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection 
{
	[connection release];
	connection=nil;
	if ([[self subviews] count]>0)
	{
		[[[self subviews] objectAtIndex:0] removeFromSuperview];
	}
	UIImageView* imageView = [[[UIImageView alloc] initWithImage:[UIImage imageWithData:data]] autorelease];
	[self addSubview:imageView];
	imageView.frame = self.bounds;
	[imageView setNeedsLayout];
	[self setNeedsLayout];
	
	[data release];
	data=nil;
    
    
    if(imageCorp)
	{
		UIImage *img = imageView.image;
        
		float orgwidth=self.frame.size.width;
		float orghight=self.frame.size.height;
		
		float imgx,imgwid,imghight,imgy;
		
		if((img.size.height<orghight)&&(img.size.width<orgwidth))
		{
			imghight=img.size.height;
			imgwid=img.size.width;
			imgx=(orgwidth-imgwid)/2;
			imgy=(orghight-imghight)/2;
		}
		else {
			if(img.size.height>img.size.width)
			{
				imghight=orghight;
				imgwid=(orghight*img.size.width)/img.size.height;
				
				if(imgwid<orgwidth)
				{
					imgy=0;
					imgx=(orgwidth-imgwid)/2;
				}
				else {
					//imgx=0;
					imghight=(orgwidth*img.size.height)/img.size.width;
					imgwid=orgwidth;
					imgx=0;
					
					if(imghight<orghight)
					{
						imgy=(orghight-imghight)/2;
					}
					else {
						imgy=0;
					}	
				}
				
			}
			else if(img.size.height<img.size.width){
				imgwid=orgwidth;
				
				imghight=(orgwidth*img.size.height)/img.size.width;
				if(imghight<orghight)
				{
					imgx=0;
					imgy=(orghight-imghight)/2;
				}
				else {
					//imgx=0;
					imgwid=(orghight*img.size.width)/img.size.height;
					imghight=orghight;
					imgy=0;
					
					if(imgwid<orgwidth)
					{
						imgx=(orgwidth-imgwid)/2;
					}
					else {
						imgx=0;
					}	
				}	
				
			}
			else {
				imghight=orghight;
				imgwid=(orghight*img.size.width)/img.size.height;
				
				if(imgwid<orgwidth)
				{
					imgy=0;
					imgx=(orgwidth-imgwid)/2;
				}
				else {
					//imgx=0;
					imghight=(orgwidth*img.size.height)/img.size.width;
					imgwid=orgwidth;
					imgx=0;
					
					if(imghight<orghight)
					{
						imgy=(orghight-imghight)/2;
					}
					else {
						imgy=0;
					}	
				}
				
			}
			
		}
        
		
        imageView.frame=CGRectMake(imgx, imgy, imgwid, imghight);
        
        
        
    }
	
	
	[imageView setNeedsLayout];
	[self setNeedsLayout];
    
    if(needsResize)
    {
        UIImage *sourceImage = imageView.image;
        UIImage *newImage = nil;        
        CGSize imageSize = sourceImage.size;
        CGFloat width = imageSize.width;
        CGFloat height = imageSize.height;
        CGFloat targetWidth = 48;
        CGSize targetSize=CGSizeMake(48.0,48.0);
        CGFloat targetHeight = targetSize.height;
        CGFloat scaleFactor = 0.0;
        CGFloat scaledWidth = targetWidth;
        CGFloat scaledHeight = targetHeight;
        CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
        
        if (CGSizeEqualToSize(imageSize, targetSize) == NO) 
        {
            CGFloat widthFactor = targetWidth / width;
            CGFloat heightFactor = targetHeight / height;
            
            if (widthFactor > heightFactor) 
                scaleFactor = widthFactor; // scale to fit height
            else
                scaleFactor = heightFactor; // scale to fit width
            scaledWidth  = width * scaleFactor;
            scaledHeight = height * scaleFactor;
            
            // center the image
            if (widthFactor > heightFactor)
            {
                thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; 
            }
            else 
                if (widthFactor < heightFactor)
                {
                    thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
                }
        }       
        
        UIGraphicsBeginImageContext(targetSize); // this will crop
        
        CGRect thumbnailRect = CGRectZero;
        thumbnailRect.origin = thumbnailPoint;
        thumbnailRect.size.width  = scaledWidth;
        thumbnailRect.size.height = scaledHeight;
        
        [sourceImage drawInRect:thumbnailRect];
        
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        if(newImage == nil) 
            NSLog(@"could not scale image");
        
        //pop the context to get back to the default
        UIGraphicsEndImageContext();
    }

    [spinner stopAnimating];
}

- (UIImage*) image 
{
	UIImageView* iv = [[self subviews] objectAtIndex:0];
	return [iv image];
}

@end