//
//  Themes.h
//  glueme
//
//  Created by apple1 on 9/21/11.
//  Copyright 2011 openxcek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "Bump.h"
#import "gluemeAppDelegate.h"
#import "CustomCalloutMapViewViewController.h"
#import "meetingpointview.h"
#import "login.h"

@class WhoGlueViewController,Bump,gluemeAppDelegate;
@interface Themes : UIViewController {

    gluemeAppDelegate *appDelegateObj;
    login *ObjLogin;
    Bump *bumpObj;
    WhoGlueViewController *whoGlueVwObj;
	NSMutableArray *arrThemes;
	IBOutlet UIButton *btnFAQ;
	IBOutlet UIButton *btnMap;
    listwhoglued *listVwObj;
	IBOutlet UITableView *tblThemes;
    UIImageView *topbarImg;
}

//@property (nonatomic, retain) login *ObjLogin;

-(IBAction)onFAQ:(id)sender;
-(IBAction)onMap:(id)sender;
-(IBAction)setmeeting;
-(void)Bump;
@end
