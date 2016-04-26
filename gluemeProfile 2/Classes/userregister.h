//
//  userregister.h
//  glueme
//
//  Created by apple on 9/19/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gluemeAppDelegate.h"
#import "login.h"
#import <CoreLocation/CoreLocation.h>
#import "gluemeAppDelegate.h"
#import "CustomCalloutMapViewViewController.h"

@class gluemeAppDelegate;
@interface userregister : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,CLLocationManagerDelegate>{

    gluemeAppDelegate *appDelegateObj;
	login *loginObj;
	IBOutlet UIScrollView *scroll;
	
    
    CLLocationManager *locationManager;
    CLLocation *currentLocation;

    gluemeAppDelegate *objAppdel;
	
	NSString *fnametext;
	NSString *lnametext;
	NSString *emailtext;
	NSString *passwordtext;
	NSString *confirmpasstext;
	NSString *phntext;
	
    IBOutlet UITableView *registrationTbl;
    NSMutableArray *sectionArray;
    NSMutableArray *contentArray1;
    NSMutableArray *contentArray2;
    NSMutableArray *contentArray3;
    NSMutableDictionary *textArray;
    
	IBOutlet UIButton *registerbtn;
	IBOutlet UIButton *cancelbtn;
	IBOutlet UIButton *btnFAQ;
	CGFloat animatedDistance;
    
    BOOL istextfill;
    
    UITextField *Txt;
    UIImageView *topbarImg;
}

@property (nonatomic) BOOL istextfill;
@property (nonatomic, retain) UITableView *registrationTbl;
@property (nonatomic, retain) NSMutableArray *sectionArray;
@property (nonatomic, retain)  NSMutableArray *contentArray1;
@property (nonatomic, retain)  NSMutableArray *contentArray2;
@property (nonatomic, retain)  NSMutableArray *contentArray3;
@property (nonatomic, retain) NSMutableDictionary *textArray;
-(IBAction)cancelbtn_clicked;
-(IBAction)registerbtn_clicked;
-(void)PassData;
-(void)Back;
-(void)setParentObj:(login*)obj;
-(void)UpdateLocation;

@end
