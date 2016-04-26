//
//  AcceptRequest.h
//  glueme
//
//  Created by APPLE  on 9/20/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "Bump.h"
#import "gluemeAppDelegate.h"

@class WhoGlueViewController,listwhoglued,Bump,gluemeAppDelegate;
@interface AcceptRequest : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource> {
   
    Bump *bumpObj;
    gluemeAppDelegate *appDelegateObj;
    listwhoglued *listVwObj;
    UIActionSheet *actionSheetCBrand;
    UIPickerView *pickerViewCBrand;
    NSMutableArray *durationArray;
    IBOutlet UIButton *durationBtn;
	IBOutlet UIButton *btnMap;
    IBOutlet UIButton *btnFAQ;
    WhoGlueViewController *whoGlueVwObj;
    UIImageView *topbarImg;
}

@property (nonatomic, retain)UIButton *durationBtn;
@property (nonatomic, retain) NSMutableArray *durationArray;
@property (nonatomic, retain) UIPickerView *pickerViewCBrand;
@property (nonatomic, retain)UIActionSheet *actionSheetCBrand;

-(IBAction)ClickOnGlueMe;
-(IBAction)ClickOnGlueMeLater;
-(IBAction)onMap:(id)sender;
-(IBAction)setmeeting;
	

@end