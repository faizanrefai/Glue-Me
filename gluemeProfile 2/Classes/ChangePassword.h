//
//  ChangePassword.h
//  glueme
//
//  Created by apple1 on 9/21/11.
//  Copyright 2011 openxcek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "Bump.h"
#import "JSONParser.h"
#import "gluemeAppDelegate.h"
#import "CustomCalloutMapViewViewController.h"
#import "meetingpointview.h"

@class WhoGlueViewController,listwhoglued,Bump,gluemeAppDelegate;
@interface ChangePassword : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>{

    Bump *bumpObj;
    listwhoglued *listVwObj;
    WhoGlueViewController *whoGlueObj;
    gluemeAppDelegate *appDelegateObj;
	IBOutlet UIButton *btnMap;
    IBOutlet UIButton *btnFAQ;
    NSArray *contentArray1;
    UITextField *Txt1;
    UITextField *Txt2;
    UITextField *Txt3;
	IBOutlet UITableView *passwordTbl;
    NSMutableDictionary *pswdDic;
    NSString *oldPass;
    NSString *newPass;
    NSString *confPass;
    UIImageView *topbarImg;
}

@property (nonatomic, retain)UITextField *Txt1;
@property (nonatomic, retain)UITextField *Txt2;
@property (nonatomic, retain)UITextField *Txt3;
@property (nonatomic, retain)NSString *oldPass;
@property (nonatomic, retain)NSString *newPass;
@property (nonatomic, retain)NSString *confPass;
@property (nonatomic, retain)NSMutableDictionary *pswdDic;

-(IBAction)onMap:(id)sender;
-(IBAction)onFAQ:(id)sender;
-(IBAction)setmeeting;
-(void)Bump;
-(IBAction)changepassword;
-(IBAction)back;
@end
