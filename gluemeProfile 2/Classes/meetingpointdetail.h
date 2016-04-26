//
//  meetingpointdetail.h
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addfriend.h"
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "Bump.h"
#import "gluemeAppDelegate.h"
#import "addfriend.h"
#import "CustomCalloutMapViewViewController.h"
#import "GdataParser.h"
#import "meetingpointview.h"

@class WhoGlueViewController,listwhoglued,Bump,gluemeAppDelegate,addfriend;
@interface meetingpointdetail : UIViewController <UIActionSheetDelegate,UIPickerViewDelegate>{

    Bump *bumpObj;
    BOOL isdateSelected;
    BOOL istimeSelected;
    addfriend *ObjAddfrnd;
    NSMutableArray *meetingPPl;
    gluemeAppDelegate *appDelegateObj;
    listwhoglued *listVwObj;
    WhoGlueViewController *whoGlueVwObj;
    IBOutlet UILabel *placeLbl;
	IBOutlet UIButton *btnFAQ;
	IBOutlet UITableView *tbl;
	IBOutlet UIButton *btnMap;
    UIActionSheet *dateActionsheet;
    UIActionSheet *TimeActionsheet;
	UIDatePicker *datePicker;
    UIDatePicker *timePicker;
    NSDate *startingTime;
    IBOutlet UIButton *dateBtn;
    IBOutlet UILabel *timeLbl;
    NSString *emailId;
    IBOutlet UIButton *endTime;
    
    
    IBOutlet UILabel *lblemaillist;
    
    UIImageView *topbarImg;
    
}
@property (nonatomic) BOOL istimeSelected;
@property (nonatomic) BOOL isdateSelected;
@property (nonatomic, retain)  UIButton *endTime;
@property (nonatomic, retain)NSMutableArray *meetingPPl;
@property (nonatomic, retain)UIButton *dateBtn;
@property(nonatomic, retain)UILabel *placeLbl;

-(IBAction)onMap:(id)sender;
-(IBAction)btnadd_clicked;
-(void)Back;
-(IBAction)setmeeting;
-(void)Bump;
-(IBAction)DateSelection;
-(void)PassData;
-(void)getFriendDetail;
-(void)PassDatafrnd;
-(NSString *)urlEncodeValue:(NSString *)str4;
-(IBAction)cancelBtnClick;
-(void)EmailSent;
-(void)SendNotification;
-(IBAction)EndTimeSelect;
@end
