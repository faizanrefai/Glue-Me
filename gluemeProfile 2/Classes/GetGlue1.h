//
//  GetGlue1.h
//  glueme
//
//  Created by apple on 10/25/11.
//  Copyright 2011 354456. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONParser.h"
#import "whogluedmap.h"
#import "FAQHelp.h"
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "GetGlueViewController.h"
#import "gluemeAppDelegate.h"
#import "Bump.h"
#import "phoneBookDetail.h"
#import "ContactDetailView.h"
#import "CustomCalloutMapViewViewController.h"
#import <CoreLocation/CoreLocation.h>


@class ContactDetailView;
@interface GetGlue1 : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,CLLocationManagerDelegate> {
    NSMutableArray  *Contname;
    CLLocationManager *locationManager;
    ContactDetailView *contactVwDetail;
    NSMutableArray *contactArray;
    listwhoglued *listVwObj;
    WhoGlueViewController *whoGlueObj;
    GetGlueViewController *objglue;
    gluemeAppDelegate *appDelegateObj;
    NSMutableArray *contactname;
    Bump *bumpObj;
    IBOutlet UISegmentedControl *mysegment;
    NSMutableArray *contactnum;
    IBOutlet UITableView *gluemecontacttbl;
    IBOutlet UITableView *phncontacttbl;
    IBOutlet UITableView *searchTbl;
    
    NSMutableArray *searchArray;
    NSMutableArray *searchLname;
    NSMutableArray *SearchUserId;
    NSMutableArray *searchEmailList;
    NSMutableArray *searchPhnNo;
    NSMutableArray *searchBdate;
    
    NSMutableArray *contactemail;
    IBOutlet UISearchBar *searchbar;
    //NSMutableArray *phoneArray2;
    NSMutableArray *Name;
    NSMutableArray *phoneArray2;
    NSMutableArray *phnArray;
    
    NSMutableArray *lnamearray;
    NSMutableArray *bdate;
    phoneBookDetail *phonebookdetailObj;
    NSMutableArray *number;
    NSMutableArray *email;
    
    NSMutableDictionary *phoneDic;
    NSMutableArray *phonAry;
    UIImageView *topbarImg;
    
}

@property (nonatomic, retain) NSMutableDictionary *phoneDic;
@property (nonatomic, retain) NSMutableArray *phonAry;

@property (nonatomic, retain) NSMutableArray *searchLname;
@property (nonatomic, retain) NSMutableArray *searchBdate;
@property (nonatomic, retain)NSMutableArray *searchEmailList;
@property (nonatomic, retain)NSMutableArray *searchPhnNo;
@property (nonatomic, retain)NSMutableArray *SearchUserId;

@property (nonatomic, retain)NSMutableArray *searchArray;
@property (nonatomic, retain) UITableView *searchTbl;
//@property (nonatomic, retain)NSMutableArray *phnArray;
@property (nonatomic, retain)NSMutableArray *phoneArray2;
@property (nonatomic, retain)NSMutableArray *Name;
//@property (nonatomic, retain)NSMutableArray *phoneArray2;
@property (nonatomic, retain) UISearchBar *searchbar;
@property (nonatomic, retain) UISegmentedControl *mysegment;

-(IBAction)onMap:(id)sender;
-(IBAction)setmeeting;
-(IBAction)segmentedControlIndexChanged;
-(void)showPeoplePickerController;
-(void)GetPhoneContact;
@end
