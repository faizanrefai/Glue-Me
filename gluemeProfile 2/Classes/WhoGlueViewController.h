//
//  WhoGlueViewController.h
//  glueme
//
//  Created by OPENXCELL TECHNOLABS on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Place.h"
#import "PlaceMark.h"
#import <MapKit/MapKit.h>
#import "listwhoglued.h"
#import "ContactDetailView.h"
#import "gluemeAppDelegate.h"
#import "profileClass.h"
#import <CoreLocation/CoreLocation.h>
#import "listwhoglued.h"
#import "iCodeBlogAnnotation.h"
#import "iCodeBlogAnnotationView.h"
#import "Bump.h"
#import "JSON.h"
#import "JSONParser.h"
#import "SBJsonParser.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMessageComposeViewController.h>
#import "MapWithRoutesViewController.h"
#import "EGOImageView.h"
#import "meetingpointview.h"

@class gluemeAppDelegate,ContactDetailView,profileClass,MKMapView,Place,PlaceMark,Bump;
@interface WhoGlueViewController : UIViewController <CLLocationManagerDelegate, MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate,MKMapViewDelegate,CLLocationManagerDelegate,UIWebViewDelegate,MKAnnotation>{
    
    EGOImageView *imageViewPro;
    
    profileClass *profileclassObj;
    gluemeAppDelegate *appDelegateObj;
    Place *home;
    PlaceMark* from;
    MKMapView *ImgMapViewHome;
    MKMapView *ImgMapView;
    MKMapView *ImgMapViewHome3;
    MKPinAnnotationView *annView;
    listwhoglued *listVwObj;
    NSMutableDictionary *dic;
    NSMutableArray *contactnum;
    NSMutableArray *contactemail;
    //IBOutlet UITableView *tableview;
	//IBOutlet MKMapView *mapView;
	//IBOutlet UIImageView *shadowImage;
    NSMutableArray *arrlist;
    
    NSMutableArray *latArray;
    NSMutableArray *longArray;
    
    NSMutableArray *nameArray;
    NSMutableArray *bdateArray;
    NSMutableArray *annTypeArray;
    NSMutableArray *Lnamearray;
    
    IBOutlet UIButton *directBtn;
    IBOutlet UIButton *MeetBtn;
    IBOutlet UIButton *callBtn;
    IBOutlet UIButton *msgBtn;
    IBOutlet UIButton *mailBtn;
    IBOutlet UIButton *removeMet;
    
    IBOutlet UILabel *LblName;
    IBOutlet UILabel *LblAdd;
    IBOutlet UILabel *MeetingAdd;
    IBOutlet UILabel *MeetingTime;
//    IBOutlet UILabel *LblPhone;
    NSInteger *temp;
    
    CLLocation *currentLocation;
	IBOutlet MKMapView *mapView;
	NSMutableArray *mapAnnotations;
	IBOutlet UIView *userProfileVw;
	IBOutlet UIButton *btnwhoglued;
    IBOutlet UIButton *btnFAQ;
    IBOutlet UIImageView *profImg;
    NSString *Address;
	NSUserDefaults *prefs;
    int cnt;
    UIButton *profImgBtn;
    Bump *bumpObj;
    int tag;
	NSMutableArray *pinArray;
	CLLocationManager *locationManager;
    NSURLConnection *conn1;
    NSMutableData *webData;
    int latCnt;
    NSMutableArray *AddArray;
    
    NSMutableArray *startDateTime;
    NSMutableArray *EndDateTime;
    
    NSMutableArray *meetingLatArray;
    NSMutableArray *meetingLongArray;
    NSMutableDictionary *CatDic;
    NSMutableArray *CatFinalArray;
    int MetTag;
    int MetDataCnt;
    int Met;
    int AddCount;
    int c;
    int cn;
    NSMutableDictionary *CatDic2 ;
    NSMutableArray *UserAddress;
    
    NSMutableArray *tempmyarr;
    
     NSMutableArray *titleArray;
    NSMutableArray *MeetingUId;
    int meetUid;
    int meetId;
    BOOL isMetDeleted;
    NSMutableArray *GmMeetId;
    UIImageView *topbarImg;
   
}
@property (nonatomic, retain) NSMutableArray *GmMeetId;
@property (nonatomic) BOOL isMetDeleted;
@property (nonatomic, retain)  UIButton *removeMet;
@property (nonatomic)  int meetUid;
@property (nonatomic) int meetId;
@property (nonatomic, retain) NSMutableArray *MeetingUId;
@property (nonatomic, retain)  UIButton *directBtn;
@property (nonatomic, retain)  UIButton *MeetBtn;
@property (nonatomic, retain) UIButton *callBtn;
@property (nonatomic, retain) UIButton *msgBtn;
@property (nonatomic, retain) UIButton *mailBtn;

@property (nonatomic, retain)UILabel *MeetingAdd;
@property (nonatomic, retain) UILabel *MeetingTime;

@property (nonatomic, retain)NSMutableArray *startDateTime;
@property (nonatomic, retain)NSMutableArray *EndDateTime;

@property (nonatomic)int cn;
@property (nonatomic, retain)NSMutableArray *UserAddress;
@property (nonatomic,retain) NSMutableArray *titleArray;
@property (nonatomic,retain)NSMutableArray *tempmyarr;
@property (nonatomic,retain)NSMutableDictionary *CatDic2 ;
@property (nonatomic, retain)NSMutableArray *CatFinalArray;
@property (nonatomic, retain) NSMutableDictionary *CatDic;
@property (nonatomic, retain) NSMutableArray *meetingLatArray;
@property (nonatomic, retain) NSMutableArray *meetingLongArray;
@property (nonatomic) int MetTag;
@property (nonatomic)int MetDataCnt;
@property (nonatomic, retain)NSMutableArray *AddArray;
@property (nonatomic)int AddCount;
@property (nonatomic)int Met;
@property (nonatomic)int latCnt;
@property (nonatomic, retain)  UIImageView *profImg;
@property (nonatomic) int tag;
@property (nonatomic, retain) NSMutableArray *pinArray;
@property (nonatomic, retain)NSMutableArray *annTypeArray;
@property (nonatomic, retain)NSMutableArray *bdateArray;
@property (nonatomic, retain)NSMutableArray *nameArray;
@property (nonatomic, retain)UILabel *LblName;
@property (nonatomic, retain)UILabel *LblAdd;
//@property (nonatomic, retain) UILabel *LblPhone;

@property (nonatomic, retain) NSMutableArray *contactemail;
@property (nonatomic, retain)NSMutableArray *contactnum;
@property (nonatomic, retain) NSMutableDictionary *dic;
//@property (nonatomic, retain) IBOutlet UITableView *tableview;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
//@property (nonatomic, retain) IBOutlet UIImageView *shadowImage;



@property (nonatomic, retain)UIButton *profImgBtn;
@property (nonatomic)int cnt;
@property (nonatomic, retain)NSMutableArray *latArray;
@property (nonatomic, retain) NSMutableArray *longArray;
@property(nonatomic, retain)UIView *userProfileVw;
//@property (nonatomic, retain)MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *mapAnnotations;
@property (nonatomic, retain) MKMapView *ImgMapViewHome;
@property (nonatomic, retain)MKMapView *ImgMapView;
@property (nonatomic, retain)MKMapView *ImgMapViewHome3;
@property (nonatomic, retain)MKPinAnnotationView *annView;
@property (nonatomic, retain)NSString *Address;

+ (CGFloat)annotationPadding;
+ (CGFloat)calloutHeight;
-(void)setLoadImageg:(NSString*)loadimage;
-(void)displayMyMap;
-(IBAction)btnwhoglued_clicked;
-(IBAction)onFAQ:(id)sender;
-(void)btnViewMapclicked:(id)sender;
-(IBAction)ClickNext;
-(void)ButtonPressed:(id)sender;
-(void)showView:(int)sender;
-(IBAction)setmeeting;
-(void)setMapViewPoint;
-(void)loadOurAnnotations;
-(void)PassData;
-(void)getAddress:(NSString *)Lat:(NSString*)Long;
-(IBAction)RemoveMeeting:(id)sender;

-(IBAction)call:(id)sender;
-(IBAction)email:(id)sender;
-(IBAction)direction:(id)sender;
-(void)directionForMeeting:(int)sender;
-(IBAction)message:(id)sender;
-(void)Back;



@end
