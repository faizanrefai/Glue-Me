//
//  profileClass.h
//  glueme
//
//  Created by APPLE  on 9/29/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "listwhoglued.h"
#import "Bump.h"
#import "WhoGlueViewController.h"
#import "gluemeAppDelegate.h"
#import "meetingpointview.h"

@class listwhoglued,Bump,WhoGlueViewController,gluemeAppDelegate;
@interface profileClass : UIViewController {
    IBOutlet UIButton *btnFAQ;
    WhoGlueViewController *whosGlueMap;
    listwhoglued *listVwObj;
    Bump *bumpObj;
    gluemeAppDelegate *appDelegateObj;

    IBOutlet UIImageView *userImg;
    IBOutlet UILabel *bdateLbl;
    IBOutlet UILabel *LblName;
    IBOutlet UILabel *LblEmail;
    IBOutlet UILabel *LblPhone;
    IBOutlet UILabel *LblLname;
    IBOutlet UILabel *lblabtme;
   
    IBOutlet UILabel *lblemailleft;
    IBOutlet UILabel *lblphoneleft;
    IBOutlet UILabel *lblbdateleft;
    UIImageView *topbarImg;
    
}
@property (nonatomic, retain)  UIImageView *userImg;
//@property (nonatomic, retain)UILabel *bdateLbl;
//@property (nonatomic, retain)UILabel *LblName;
@property (nonatomic, retain)WhoGlueViewController *whosGlueMap;
@property (nonatomic, retain)UILabel *LblEmail;
@property (nonatomic, retain) UILabel *LblPhone;

-(IBAction)onFAQ:(id)sender;
-(IBAction)setmeeting;
-(void)Bump;
@end
