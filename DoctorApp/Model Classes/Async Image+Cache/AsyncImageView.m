//
//  AsyncImageView.m
//  YellowJacket
//
//  Created by Wayne Cochran on 7/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AsyncImageView.h"
#import "ImageCacheObject.h"
#import "ImageCache.h"

static ImageCache *imageCache = nil;

@implementation AsyncImageView
@synthesize needsResize,imageCorp;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)dealloc {
    [connection cancel];
    [connection release];
    [data release];
    [super dealloc];
}

-(void)loadImageFromURL:(NSURL*)url {
    if (connection != nil) {
        [connection cancel];
        [connection release];
        connection = nil;
    }
    if (data != nil) {
        [data release];
        data = nil;
    }
    
    if (imageCache == nil) // lazily create image cache
        imageCache = [[ImageCache alloc] initWithMaxSize:2*1024*1024];  // 2 MB Image cache
    
    [urlString release];
    urlString = [[url absoluteString] copy];
    UIImage *cachedImage = [imageCache imageForKey:urlString];
    if (cachedImage != nil) {
        if ([[self subviews] count] > 0) {
            [[[self subviews] objectAtIndex:0] removeFromSuperview];
        }
        UIImageView *imageView = [[[UIImageView alloc] initWithImage:cachedImage] autorelease];
        //imageView.contentMode = UIViewContentModeScaleAspectFit;
       imageView.autoresizingMask = 
            UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:imageView];
        imageView.frame = self.bounds;
        [imageView setNeedsLayout]; // is this necessary if superview gets setNeedsLayout?
        [self setNeedsLayout];
        return;
    }
    
#define SPINNY_TAG 5555   
    
    UIActivityIndicatorView *spinny = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinny.tag = SPINNY_TAG;
//    spinny.center = self.center;
    [spinny setCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0)];
    [spinny startAnimating];
    [self addSubview:spinny];
    [spinny release];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url 
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy 
                                         timeoutInterval:60.0];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection 
    didReceiveData:(NSData *)incrementalData {
    if (data==nil) {
        data = [[NSMutableData alloc] initWithCapacity:2048];
    }
    [data appendData:incrementalData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)aConnection {
    [connection release];
    connection = nil;
    
    UIView *spinny = [self viewWithTag:SPINNY_TAG];
    [spinny removeFromSuperview];
    
    if ([[self subviews] count] > 0) {
        [[[self subviews] objectAtIndex:0] removeFromSuperview];
    }
    
       
    UIImage *image = [UIImage imageWithData:data];
    
    [imageCache insertImage:image withSize:[data length] forKey:urlString];
    
    UIImageView *imageView = [[[UIImageView alloc] 
                               initWithImage:image] autorelease];
   // imageView.contentMode = UIViewContentModeScaleAspectFit;
   imageView.autoresizingMask = 
        UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:imageView];
    imageView.frame = self.bounds;
    [imageView setNeedsLayout]; // is this necessary if superview gets setNeedsLayout?
    [self setNeedsLayout];
    
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
    [data release];
    data = nil;
}

@end
