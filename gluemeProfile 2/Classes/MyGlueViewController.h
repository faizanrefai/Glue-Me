//
//  MyGlueViewController.h
//  glueme
//
//  Created by OPENXCELL TECHNOLABS on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineRequest.h"
#import "MyHistory.h"
#import "SettingViewController.h"
#import "login.h"
#import "gluemeAppDelegate.h"
#import "MyContactScreen.h"
#import "WhoGlueViewController.h"
#import "MyContactScreen.h"
#import "listwhoglued.h"
#import "Bump.h"
#import "JSONParser.h"
#import "CustomCalloutMapViewViewController.h"
#import <CoreLocation/CoreLocation.h>

@class WhoGlueViewController,listwhoglued,Bump;
@class MineRequest,MyHistory,SettingViewController,login,gluemeAppDelegate,MyContactScreen;
@interface MyGlueViewController : UIViewController <CLLocationManagerDelegate>{

    CLLocationManager *locationManager;
    Bump *bumpObj;
    listwhoglued *listVwObj;
    WhoGlueViewController *whoGlueObj;
    MyContactScreen *mycontactScreenObj;
    gluemeAppDelegate *GlueAppDelegateObj;
    login *loginObj;
    MineRequest *minerequestObj;
    MyHistory *myhistoryObj;
	IBOutlet UIButton *btnSettings;
	IBOutlet UIButton *btnMap;
    IBOutlet UIButton *btnFAQ;
   
    UIImageView *topbarImg;
}
-(IBAction)onSettings:(id)sender;
-(IBAction)onMap:(id)sender;
-(IBAction)onProfile:(id)sender;
-(IBAction)LogOutClick;
-(IBAction)onFAQ:(id)sender;
-(IBAction)setmeeting;
@property (nonatomic, retain) MineRequest *minerequestObj;


@end
