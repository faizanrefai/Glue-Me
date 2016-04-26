//
//  forgetpassword.h
//  glueme
//
//  Created by apple on 9/19/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "gluemeAppDelegate.h"
#import "CustomCalloutMapViewViewController.h"
#import "meetingpointview.h"

@class WhoGlueViewController,listwhoglued,gluemeAppDelegate;
@interface forgetpassword : UIViewController {

    gluemeAppDelegate *appDelegateObj;
	WhoGlueViewController *whoGlueVwObj;
	IBOutlet UITextField *emailtext;
	IBOutlet UITextField *numbertext;
	IBOutlet UIButton *btnMap;
    IBOutlet UIButton *btnFAQ;
    listwhoglued *listVwObj;
    CGFloat animatedDistance;
    UIImageView *topbarImg;
}
-(IBAction)setmeeting;
-(IBAction)onMap:(id)sender;
-(void)PassData;
@end
