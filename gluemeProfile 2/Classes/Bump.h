//
//  Bump.h
//  glueme
//
//  Created by apple1 on 9/21/11.
//  Copyright 2011 openxcek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "gluemeAppDelegate.h"
#import "BumpAPI.h"
#import "Bumper.h"
#import "CustomCalloutMapViewViewController.h"
#import "BumpAPICustomUI.h"
#import "meetingpointview.h"

@class WhoGlueViewController,listwhoglued,gluemeAppDelegate;
@interface Bump : UIViewController <BumpAPIDelegate,BumpAPICustomUI,UIActionSheetDelegate,UIPickerViewDelegate>{
	
    BumpAPI *bumpObj;
    gluemeAppDelegate *appDelegateObj;
    listwhoglued *listVwObj;
    WhoGlueViewController *whoGlueVwObj;
	NSMutableArray *arrBump;
    
    UIActionSheet *actionSheetCBrand;
    UIPickerView *pkrTimeDuration;
    NSMutableArray *durationArray;
    int d;
    
    NSString *frndId;
    NSString *frndNm;
    
	IBOutlet UITableView *tblBump;
	NSIndexPath *ind;
	IBOutlet UIButton *btnFAQ;
	IBOutlet UIButton *btnMap;
    IBOutlet UILabel *LblRequest;
    IBOutlet UIButton *selectHours;
    UIImageView *topbarImg;
}
@property (nonatomic, retain) NSString *frndId;
@property (nonatomic, retain) NSString *frndNm;
@property (nonatomic, retain) NSMutableArray *durationArray;
@property (nonatomic, retain) UILabel *LblRequest;
@property (nonatomic, retain)  UIButton *selectHours;
-(IBAction)onFAQ:(id)sender;
-(IBAction)onMap:(id)sender;
-(IBAction)setmeeting;
-(void)Back;
-(IBAction)BumpClicked;
-(void)SelectHours;
-(void)GlueMeRequest;
-(void)requestdatafatch:(NSDictionary*)dictionary;
-(void)FriendRequest;

@end
