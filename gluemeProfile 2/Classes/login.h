//
//  login.h
//  glueme
//
//  Created by apple on 9/19/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "forgetpassword.h"
#import "MyGlueViewController.h"
#import "gluemeAppDelegate.h"
#import <CoreLocation/CoreLocation.h>

@class gluemeAppDelegate;
@interface login : UIViewController <UITabBarControllerDelegate,CLLocationManagerDelegate>{

	gluemeAppDelegate *GlueAppDelegateObj;
	IBOutlet UITextField *idtext;
	IBOutlet UITextField *passwordtext;
	IBOutlet UIButton *btnFAQ;
	IBOutlet UIButton *rememberbtn;
	IBOutlet UIButton *forgetpassbtn;
	IBOutlet UIButton *loginbtn;
	IBOutlet UIButton *registermebtn;
	UIImage *i;
    BOOL select;
	CLLocationManager *locationManager;
	 NSString *strDeviceID;
    
    IBOutlet UIImageView *bkgroundImg;
	IBOutlet UITabBarController *tabBar;
}
@property (nonatomic, retain) UIImageView *bkgroundImg;
@property (nonatomic, retain)UIImage *i;
@property(nonatomic,retain)IBOutlet UITabBarController *tabBar;
@property (nonatomic, retain) NSString *strDeviceID;
-(IBAction)remembermebtn_clicked:(id)sender;
-(IBAction)forgetpassbtn_clicked:(id)sender;
-(IBAction)loginbtn_clicked:(id)sender;
-(IBAction)registerbtn_clicked:(id)sender;
-(void)PassData;
-(IBAction)loginbtn_clicked:(id)sender;
//- (void) drawPlaceholderInRect:(CGRect)rect;
-(void)getLogedIn;

@end
