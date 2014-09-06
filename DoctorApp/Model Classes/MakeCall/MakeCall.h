//
//  MakeCall.h
//  directory_app
//
//  Created by Sanjit Shaw on 16/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MakeCall : NSObject {
	
	NSString *strtelno;

}
@property(nonatomic,retain) NSString *strtelno;

-(void)MakeCalltoNumber:(NSString*)phonenumber;

@end
