//
//  Connection Model.h
//  Ugo jersey
//
//  Created by Debasish Pal on 09/08/13.
//  Copyright (c) 2013 Debasish Pal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"

@protocol connectionDidReceiveResponse <NSObject>
@required
-(void)connectionDidReceiveResponse:(ASIHTTPRequest*)response;
-(void)connectionDidFailedResponse:(ASIHTTPRequest*)response;
@end

@interface ConnectionModel : NSObject
{
    ASIFormDataRequest *request;
    id <connectionDidReceiveResponse>delegate;
}
@property (nonatomic, strong) id <connectionDidReceiveResponse>delegate;
@property (nonatomic, strong)ASIFormDataRequest *request;

-(void)startResquestForLogin:(NSMutableDictionary*)dict;
-(void)startResquestForLogout:(NSMutableDictionary*)dict;
-(void)startResquestForForgotPass:(NSMutableDictionary*)dict;
-(void)startResquestForEmailActivation:(NSMutableDictionary*)dict;
-(void)startResquestForEmailVerification:(NSMutableDictionary*)dict;

-(void)startResquestForRecentContacts:(NSMutableDictionary*)dict;
-(void)startResquestForMyContacts:(NSMutableDictionary*)dict;
-(void)startResquestForContactDetail:(NSMutableDictionary*)dict;
-(void)startResquestForContactDropDownList:(NSMutableDictionary*)dict;
-(void)startResquestForSearchMyContacts:(NSMutableDictionary*)dict;
-(void)startResquestForContactStateList:(NSMutableDictionary*)dict;
-(void)startResquestForAddContact:(NSMutableDictionary*)dict;
-(void)startResquestForEditContact:(NSMutableDictionary*)dict;
-(void)startResquestForContactDelete:(NSMutableDictionary*)dict;

-(void)startResquestForMyTask:(NSMutableDictionary*)dict;
-(void)startResquestForOverdueTask:(NSMutableDictionary*)dict;
-(void)startResquestForCompletedTask:(NSMutableDictionary*)dict;
-(void)startResquestForTaskNotifyToDropDownList:(NSMutableDictionary*)dict;
-(void)startResquestForTaskRelToDropDownList:(NSMutableDictionary*)dict;
-(void)startResquestForAddTask:(NSMutableDictionary*)dict;
-(void)startResquestForTaskDetails:(NSMutableDictionary*)dict;
-(void)startResquestForEditTask:(NSMutableDictionary*)dict;
-(void)startResquestForTaskDelete:(NSMutableDictionary*)dict;

-(void)startResquestForRecentLeads:(NSMutableDictionary*)dict;
-(void)startResquestForOpenLeads:(NSMutableDictionary*)dict;
-(void)startResquestForLeadsDetail:(NSMutableDictionary*)dict;
-(void)startResquestForAddLeads:(NSMutableDictionary*)dict;
-(void)startResquestForEditLeads:(NSMutableDictionary*)dict;
-(void)startResquestForSearchLeads:(NSMutableDictionary*)dict;
-(void)startResquestForLeadsDelete:(NSMutableDictionary*)dict;

-(void)startResquestForRecentOpportunity:(NSMutableDictionary*)dict;
-(void)startResquestForSearchOpportunity:(NSMutableDictionary*)dict;
-(void)startResquestForOppurtunityDropDownList:(NSMutableDictionary*)dict;
-(void)startResquestForAddOppurtunity:(NSMutableDictionary*)dict;
-(void)startResquestForEditOppurtunity:(NSMutableDictionary*)dict;
-(void)startResquestForOppurtunityDetail:(NSMutableDictionary*)dict;
-(void)startResquestForOppurtunityDelete:(NSMutableDictionary*)dict;
-(void)startResquestForOppurContDropDownList:(NSMutableDictionary*)dict;

-(void)startResquestForRecentFiles:(NSMutableDictionary*)dict;
-(void)startResquestForSearchFiles:(NSMutableDictionary*)dict;
-(void)startResquestForContactRecentFiles:(NSMutableDictionary*)dict;
-(void)startResquestForContactSearchFiles:(NSMutableDictionary*)dict;
-(void)startResquestForFileDetails:(NSMutableDictionary*)dict;
-(void)startResquestForShareFileList:(NSMutableDictionary*)dict;
-(void)startResquestForShareFile:(NSMutableDictionary*)dict;
-(void)startResquestForAddFiles:(NSMutableDictionary*)dict withImage:(UIImage *)img;
-(void)startResquestForEditFiles:(NSMutableDictionary*)dict withImage:(UIImage *)img;
-(void)startResquestForFileDelete:(NSMutableDictionary*)dict;

-(void)startResquestForNoteList:(NSMutableDictionary*)dict;
-(void)startResquestForSearchNoteList:(NSMutableDictionary*)dict;
-(void)startResquestForNoteDetails:(NSMutableDictionary*)dict;
-(void)startResquestForNoteDDL:(NSMutableDictionary*)dict;
-(void)startResquestForNoteDelete:(NSMutableDictionary*)dict;
-(void)startResquestForAddNote:(NSMutableDictionary*)dict;
-(void)startResquestForEditNote:(NSMutableDictionary*)dict;

-(void)startResquestForGetSalesTrackList:(NSMutableDictionary*)dict;
-(void)startResquestForAddSalesTrack:(NSMutableDictionary*)dict;
-(void)startResquestForDetailsSalesTrack:(NSMutableDictionary*)dict;
-(void)startResquestForCheckinSalesTrack:(NSMutableDictionary*)dict;
-(void)startResquestForCheckOutSalesTrack:(NSMutableDictionary*)dict;
-(void)startResquestForSearchSalesTrack:(NSMutableDictionary*)dict;

@end
