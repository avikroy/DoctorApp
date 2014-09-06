//
//  AsyncImageView1.h
//  DesiSongStar
//
//  Created by Debasish Pal on 04/01/13.
//  Copyright (c) 2013 deb.pal2009@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AsyncImageView1 : UIView
{
NSURLConnection* connection; //keep a reference to the connection so we can cancel download in dealloc
NSMutableData* data; //keep reference to the data so we can collect it as it downloads
UIActivityIndicatorView *spinner;
}
@property (nonatomic, assign) BOOL needsResize;
@property (nonatomic, assign) BOOL imageCorp;
- (void)loadImageFromURL:(NSURL*)url;
- (UIImage*) image;

@end
