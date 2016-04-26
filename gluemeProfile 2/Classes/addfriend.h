//
//  addfriend.h
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "Bump.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h> 
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMessageComposeViewController.h>
#import "CustomCalloutMapViewViewController.h"
#import "meetingpointview.h"

@class listwhoglued,WhoGlueViewController,Bump,gluemeAppDelegate;
@interface addfriend : UIViewController <MFMessageComposeViewControllerDelegate,UITableViewDelegate,UITableViewDataSource>{

    gluemeAppDelegate *appDelegateObj;
    Bump *bumpObj;
	WhoGlueViewController *whoGlueVwObj;
	IBOutlet UISegmentedControl *mysegment;
	NSMutableString *selectFrnd;
	IBOutlet UITableView *gluemecontacttbl;
	NSMutableArray *Contname;
	IBOutlet UITableView *phncontacttbl;
	IBOutlet UIButton *btnMap;
    IBOutlet UIButton *btnFAQ;
    listwhoglued *listVwObj;
   // NSMutableArray *PhoneBookArray;
    BOOL IsselectFrnd;
    NSMutableArray *contactArray;
    NSMutableArray *contactname;
    NSMutableArray *contactnum;
    NSMutableArray *contactemail;
    
    NSMutableDictionary *phoneDic;
    NSMutableArray *phonAry;
    UIImageView *topbarImg;

	
}
@property (nonatomic,retain) NSMutableDictionary *phoneDic;
@property (nonatomic,retain)NSMutableArray *phonAry;

@property (nonatomic, retain)NSMutableArray *Contname;
@property (nonatomic)BOOL IsselectFrnd;
@property (nonatomic, retain)NSMutableString *selectFrnd;
-(IBAction)onMap:(id)sender;
-(IBAction)segmentedControlIndexChanged;
-(void)Back;
-(IBAction)onFAQ:(id)sender;
-(IBAction)setmeeting;
-(void)Bump;
-(void)datafatch:(NSDictionary*)dictionary;
-(void)reloadMyTbl;
-(void)GetUserList;
-(void)GetPhoneContact;


@end
