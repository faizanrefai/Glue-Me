//
//  ManageSound.h
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

@class WhoGlueViewController,listwhoglued,Bump,gluemeAppDelegate;
@interface ManageSound : UIViewController {

    WhoGlueViewController *whoGlueVwObj;
    Bump *bumpObj;
    gluemeAppDelegate *appDelegateObj;
	UIView *viewSounds;
	IBOutlet UITableView *tblSounds;
	NSMutableArray *arrSounds;
	IBOutlet UIButton *btnFAQ;
	IBOutlet UIButton *btnMap;
    listwhoglued *listVwObj;
    UIImageView *topbarImg;
}
-(IBAction)setmeeting;
-(IBAction)onFAQ:(id)sender;
-(IBAction)onMap:(id)sender;
-(void)Bump;
@end
