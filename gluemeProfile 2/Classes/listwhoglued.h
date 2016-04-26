//
//  listwhoglued.h
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "whogluedmap.h"
#import "WhoGlueViewController.h"
#import "Bump.h"
#import "gluemeAppDelegate.h"
#import "CustomCalloutMapViewViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "meetingpointview.h"

@class WhoGlueViewController,Bump,gluemeAppDelegate;
@interface listwhoglued : UIViewController <UITableViewDelegate , UITableViewDataSource,CLLocationManagerDelegate>{

    gluemeAppDelegate *appDelegateObj;
    Bump *bumpObj;
    CLLocationManager *locationManager;
    NSMutableArray *nameArray;
    NSMutableArray *arremail;
    NSMutableArray *uidArray;
    NSMutableArray *timeArray;
    NSMutableDictionary *uidDic;
	WhoGlueViewController *whoGlueVwObj;
	IBOutlet UITableView *tbl;
     NSMutableDictionary *dic;
	IBOutlet UIButton *btnMap;
    IBOutlet UIButton *btnFAQ;
    UIImageView *topbarImg;
}

@property (nonatomic, retain)NSMutableDictionary *uidDic;
@property (nonatomic, retain)NSMutableArray *uidArray;
@property (nonatomic, retain) NSMutableArray *timeArray;
@property (nonatomic, retain) NSMutableDictionary *dic;
@property(nonatomic, retain)NSMutableArray *nameArray;
-(IBAction)onMap:(id)sender;
-(void)Back;
-(IBAction)onFAQ:(id)sender;
-(void)Bump;
-(void)getReqCount;
@end
