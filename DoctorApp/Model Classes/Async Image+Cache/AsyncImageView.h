//
//  AsyncImageView.h
//  YellowJacket
//
//  Created by Wayne Cochran on 7/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//



#import <UIKit/UIKit.h>


@interface AsyncImageView : UIView {
    NSURLConnection *connection;
    NSMutableData *data;
    NSString *urlString; // key for image cache dictionary
}
@property (nonatomic, assign) BOOL needsResize;
@property (nonatomic, assign) BOOL imageCorp;

-(void)loadImageFromURL:(NSURL*)url;

@end
