//
//  MakeCall.m
//  directory_app
//
//  Created by Sanjit Shaw on 16/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MakeCall.h"


@implementation MakeCall

@synthesize strtelno;

-(void)MakeCalltoNumber:(NSString*)phonenumber
{
	self.strtelno = [[NSString alloc] initWithFormat:@"tel:%@",phonenumber];
	//strtelno = [NSString stringWithFormat:@"tel:%@",phonenumber];//&acirc; = â
	
	/*if ([self.strtelno length]>0)
	{
		UIAlertView *alert = [[UIAlertView alloc] init];
		[alert setTitle:nil];
		[alert setMessage:@"Would you like to call now?"];
		[alert setDelegate:self];
		alert.tag=1;
		[alert addButtonWithTitle:@"Yes"];
		[alert addButtonWithTitle:@"No"];
		[alert show];
		[alert release];
	}	*/
	
	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:strtelno]];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0){
		//International_Contact *aInternational_Contact=[arrGroup objectAtIndex:0];
		if (alertView.tag==1) 
		{			
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.strtelno]];
		}
	}
}


@end
