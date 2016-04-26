//
//  DetailViewHistory.h
//  glueme
//
//  Created by APPLE  on 9/21/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "gluemeAppDelegate.h"
#import "Bump.h"
#import "CustomCalloutMapViewViewController.h"
#import "meetingpointview.h"

@class WhoGlueViewController,gluemeAppDelegate,Bump;
@interface DetailViewHistory : UIViewController {
    Bump *bumpObj;
    
    UIPickerView *pkrExpArea;
    UIActionSheet *actionSheetCBrand;
    UIPickerView *pickerViewCBrand;
    NSMutableArray *durationArray;
    gluemeAppDelegate *appDelegateObj;
    IBOutlet UILabel *Lblname;
    IBOutlet UILabel *LastGluedOn;
    IBOutlet UILabel *LastGluedTime;
    IBOutlet UILabel *LastGluedOnDetail;
    IBOutlet UILabel *LastGluedTimeDetail;
	IBOutlet UIButton *btnMap;
    IBOutlet UIButton *btnFAQ;
    WhoGlueViewController *whoGlueObj;
    listwhoglued *listVwObj;
     int d;
    UIImageView *topbarImg;
}
@property (nonatomic, retain)  UILabel *Lblname;
@property (nonatomic, retain) NSMutableArray *durationArray;
@property (nonatomic, retain) UIPickerView *pickerViewCBrand;
@property (nonatomic, retain) UIPickerView *pkrExpArea;
@property (nonatomic, retain)UIActionSheet *actionSheetCBrand;

@property(nonatomic, retain) UILabel *LastGluedOn;
@property(nonatomic, retain) UILabel *LastGluedTime;
@property(nonatomic, retain) UILabel *LastGluedOnDetail;
@property(nonatomic, retain) UILabel *LastGluedTimeDetail;
-(IBAction)onMap:(id)sender;
-(IBAction)setmeeting;
-(void)Bump;
-(void)GlueResponse:(NSDictionary*)dictionary;
-(void)DeletedHistory:(NSDictionary*)dictionary;
-(void)dismissActionSheet;

@end
