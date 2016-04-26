//
//  gluemeAppDelegate.h
//  glueme
//
//  Created by apple on 9/19/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h> 
#import "login.h"

@class listwhoglued,login;
@interface gluemeAppDelegate : NSObject <UIApplicationDelegate,ABPeoplePickerNavigationControllerDelegate> {
    
	listwhoglued *parentlist_obj;
    login *objLogin;
    int tabbarIndCnt;
    int GluedCnt;
    UIWindow *window;
    IBOutlet UIImageView *backGroundImg;
    UINavigationController *navigationController;
    BOOL islogin;
    BOOL isregister;
    BOOL isdeleteHistory;
    BOOL isReGlued;
	NSMutableDictionary *phoneBkDict;
    NSMutableDictionary *EmailDict;
    NSString *strid;
    
    NSString *latitude;
    NSString *longitude;
    NSString *mylatitude;
    NSString *mylongitude;
    
    NSMutableArray *emails;
    NSMutableArray *PhoneBookArray;
    
    int userID;
    
    NSString *selectpage;
      NSString *contactnum;
    NSString *contactname;  
    NSString *contactemail;
    
    NSMutableString *placeString;
    NSMutableString *selectedFrnd;
    
    UIImage *userProfImg;
    NSString *emailStr;
    NSString *phnStr;
    NSString *NameStr;
    NSString *bdateStr;
    NSString *AddStr;
    NSString *addedFrnd;
    BOOL isaddfrnd;
    int count;
    SEL mySelector;
    NSObject *myobject;
    
    NSString *strtolatuser;
    NSString *strtolonguser;
    NSString *strfromlatuser;
    NSString *strfromlonguser;
    
    NSMutableArray *ImgArray;
    
    NSString *stremailselect;
    NSString *stremaillist;
      NSString *stremailselect0;
    NSString *strIdSelect;
    NSString *strIdList;
    NSString *strIdsel0;
    
      NSString *lname;
     NSString *selectedUser;
    NSString *SelectedEmail;
    NSString *SelectedPhnNo;
    NSString *currentUserName;
    NSString *userEmail;
    
    NSString *selectedBdate;
    NSMutableArray *meetingPPlArray;
    
    NSString *strDeviceID;
    
    NSString *histName;
    NSString *histLastGlOn;
    NSString *histLastGLTime;
    int HistoryId;
    BOOL isViewDirection;
    
    BOOL isthemechanged;
    
    NSString *meetingLat;
    NSString *meetingLong;
    
}
@property (nonatomic)int GluedCnt;
@property (nonatomic) BOOL isthemechanged;
@property (nonatomic) int tabbarIndCnt;
@property (nonatomic, retain) login *objLogin;
@property (nonatomic,retain)listwhoglued *parentlist_obj;
@property (nonatomic,retain)NSString *meetingLat;
@property (nonatomic, retain) UIImageView *backGroundImg;
@property (nonatomic,retain)NSString *meetingLong;
@property (nonatomic, retain) NSString *AddStr;
@property (nonatomic, retain)NSString *histName;
@property (nonatomic, retain)NSString *histLastGlOn;
@property (nonatomic, retain)NSString *histLastGLTime;
@property (nonatomic, retain) NSString *strIdSelect;
@property (nonatomic, retain)NSString *strIdList;
@property (nonatomic, retain)NSString *strIdsel0;
@property (nonatomic)int HistoryId;
@property (nonatomic, retain) NSString *strDeviceID;
@property (nonatomic) BOOL isViewDirection;
@property (nonatomic, retain) UIImage *userProfImg;
@property (nonatomic, retain)NSMutableArray *ImgArray;
@property (nonatomic, retain)  NSString *selectedBdate;
@property (nonatomic, retain)NSString *SelectedEmail;
@property (nonatomic, retain)NSString *SelectedPhnNo;
@property (nonatomic, retain) NSString *selectedUser;
@property (nonatomic, retain) NSMutableArray *meetingPPlArray;
@property (nonatomic, retain)NSString *stremaillist;
@property (nonatomic, retain) NSString *currentUserName;
@property (nonatomic, retain)NSString *userEmail;

@property (nonatomic, retain)NSString *strtolatuser;
@property (nonatomic, retain)NSString *strtolonguser;
@property (nonatomic, retain)NSString *strfromlatuser;
@property (nonatomic, retain)NSString *strfromlonguser;

@property (nonatomic, retain)NSString *stremailselect;
@property (nonatomic, retain)NSString *stremailselect0;
@property (nonatomic, retain)NSString *lname;


@property (nonatomic) int count;
@property (nonatomic)SEL mySelector;
@property (nonatomic, retain)NSObject *myobject;
@property (nonatomic, retain)NSString *addedFrnd;
@property (nonatomic)BOOL isaddfrnd;
@property (nonatomic, retain)NSMutableString *selectedFrnd;
@property (nonatomic, retain)NSMutableString *placeString;
@property (nonatomic, retain)NSString *emailStr;
@property (nonatomic, retain)NSString *phnStr;
@property (nonatomic, retain)NSString *NameStr;
@property (nonatomic, retain)NSString *bdateStr;

@property (nonatomic) int userID;
@property (nonatomic, retain)NSString *contactnum;
@property (nonatomic, retain)NSString *contactname;
@property (nonatomic, retain)NSString *contactemail;
@property (nonatomic, retain)NSMutableArray *PhoneBookArray;
@property (nonatomic, retain)NSMutableArray *emails;
@property (nonatomic, retain)NSString *latitude;
@property (nonatomic, retain)NSString *longitude;
@property (nonatomic, retain)NSString *mylatitude;
@property (nonatomic, retain)NSString *mylongitude;

@property (nonatomic, retain)NSString *strid;
@property (nonatomic, retain)NSString *selectpage;

@property (nonatomic, retain)NSMutableDictionary *EmailDict;
@property (nonatomic, retain)NSMutableDictionary *phoneBkDict;
@property (nonatomic) BOOL isdeleteHistory;
@property (nonatomic) BOOL isReGlued;
@property (nonatomic) BOOL isregister;
@property (nonatomic)  BOOL islogin;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
-(IBAction)onMap:(id)sender;
-(void)getContacts;
-(void)getReqCount;
-(void)getGluedCount;
-(void)Countdatafatch:(NSDictionary*)dictionary;

@end

