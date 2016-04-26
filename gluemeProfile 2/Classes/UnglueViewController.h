//
//  UnglueViewController.h
//  glueme
//
//  Created by OPENXCELL TECHNOLABS on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "Bump.h"
#import "gluemeAppDelegate.h"
#import "CustomCalloutMapViewViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "meetingpointview.h"

@class WhoGlueViewController,listwhoglued,Bump,gluemeAppDelegate;
@interface UnglueViewController : UIViewController<UIAlertViewDelegate,CLLocationManagerDelegate> {

    CLLocationManager *locationManager;
    WhoGlueViewController *whoGlueObj;
	IBOutlet UITableView *tlb;
	NSArray *arrFriends;
	NSInteger flag;
	IBOutlet UIButton *faq;
	IBOutlet UIButton *btnMap;
    IBOutlet UIButton *btnFAQ;
    listwhoglued *listVwObj;
    Bump *bumpObj;
    gluemeAppDelegate *appDelegateObj;
    NSMutableArray *nameArray;
    NSMutableArray *uidArray;
    NSMutableDictionary *uidDic;
    NSMutableDictionary *dic;
    UIImageView *topbarImg;
	
}

@property (nonatomic, retain)NSMutableDictionary *uidDic;
@property (nonatomic, retain)NSMutableArray *uidArray;
@property (nonatomic, retain) NSMutableArray *nameArray;
@property (nonatomic, retain) NSMutableDictionary *dic;


-(IBAction)onFAQ:(id)sender;
-(IBAction)onMap:(id)sender;
-(IBAction)setmeeting;
@end
