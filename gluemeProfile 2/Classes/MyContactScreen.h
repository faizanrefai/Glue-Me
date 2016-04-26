//
//  MyContactScreen.h
//  glueme
//
//  Created by APPLE  on 9/21/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactDetailView.h"
#import "phoneBookDetail.h"
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "Bump.h"
#import "JSON.h"
#import "JSONParser.h"
#import "SBJsonParser.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h> 
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMessageComposeViewController.h>
#import "gluemeAppDelegate.h"
#import "CustomCalloutMapViewViewController.h"
#import "meetingpointview.h"

@class ContactDetailView, phoneBookDetail,WhoGlueViewController,listwhoglued,Bump,gluemeAppDelegates;
@interface MyContactScreen : UIViewController <UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate,MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate,
ABPeoplePickerNavigationControllerDelegate,UIActionSheetDelegate>{
    
    gluemeAppDelegate *appDelegateObj;
    ABPeoplePickerNavigationController *picker1;
    Bump *bumpObj;
    WhoGlueViewController *whoGlueObj;
    IBOutlet UITableViewCell *phonebookcell;
    phoneBookDetail *phonebookdetailObj;
    ContactDetailView *contactVwDetail;
    IBOutlet UISearchBar *searchbar;
    IBOutlet UITableView *SearchTbl;
    IBOutlet UITableView *GlueContactTbl;
    IBOutlet UITableView *PhonebookTbl;
    NSMutableDictionary *dic;
    NSMutableArray *Contname;
//    NSMutableArray *emails;
//    NSMutableArray *PhoneBookArray;
    NSMutableArray *searchNameArray;
    NSMutableArray *contactArray;
    NSMutableArray *dataSource;
    IBOutlet UISegmentedControl *contactSegment;
    IBOutlet UIButton *btnMap;
    IBOutlet UIButton *btnFAQ;
    listwhoglued *listVwObj;
    int selectedRow;
    NSMutableArray *names;
    
    NSMutableArray *nameArray2;
    NSMutableArray *phoneArray2;
    NSMutableArray *contactname;
    NSMutableArray *BdayArray;
    NSMutableArray *contactnum;
    
    NSMutableArray *contactemail;
    
    NSMutableArray *number;
    NSMutableArray *email;
    NSMutableArray *bdate;
    NSMutableArray *SearchUserId;
    NSMutableArray *searchEmailList;
    NSMutableArray *searchPhnNo;
    NSMutableArray *searchBdate;
     
    NSMutableDictionary *phoneDic;
    NSMutableArray *phonAry;
    
    UIImageView *topbarImg;
    
}
@property (nonatomic, retain) NSMutableDictionary *phoneDic;
@property (nonatomic, retain) NSMutableArray *phonAry;
@property (nonatomic, retain) NSMutableArray *BdayArray;
@property (nonatomic, retain) NSMutableArray *searchBdate;
@property (nonatomic, retain)NSMutableArray *searchEmailList;
@property (nonatomic, retain)NSMutableArray *searchPhnNo;
@property (nonatomic, retain)NSMutableArray *SearchUserId;
@property (nonatomic, retain)NSMutableArray *Contname;
@property (nonatomic, retain)NSMutableArray *phoneArray2;
@property (nonatomic, retain) NSMutableArray *nameArray2;
@property (nonatomic) int selectedRow;
@property (nonatomic, retain) UITableViewCell *phonebookcell;
@property (nonatomic, retain)  UIButton *dltBtn;
@property (nonatomic, retain) UIButton *lblBtn;
//@property (nonatomic, retain)  NSMutableArray *PhoneBookArray;
@property (nonatomic, retain) NSMutableArray *searchNameArray;
@property (nonatomic, retain) UITableView *PhonebookTbl;
@property (nonatomic, retain) UITableView *GlueContactTbl;
@property (nonatomic, retain) NSMutableArray *contactArray;
@property (nonatomic, retain) UITableView *SearchTbl;
@property (nonatomic, retain) UISearchBar *searchbar;
@property (nonatomic, retain) UISegmentedControl *contactSegment;
-(IBAction)onMap:(id)sender;
-(IBAction)onFAQ:(id)sender;
-(IBAction)setmeeting;
-(void)Bump;
-(void)chooseContacts;
-(void)reloadMyTbl;
-(void)GetPhoneContact;
-(void)getRegisteredUserForSearch;
@end
