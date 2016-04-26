//
//  GetGlueViewController.h
//  glueme
//
//  Created by OPENXCELL TECHNOLABS on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextSendView.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "Bump.h"
#import "JSONParser.h"
#import "gluemeAppDelegate.h"
#import "MapWithRoutesViewController.h"
#import "CustomCalloutMapViewViewController.h"
#import "meetingpointview.h"


@class TextSendView,WhoGlueViewController,listwhoglued,Bump;
@interface GetGlueViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate,UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UILabel *lblname;
    IBOutlet UILabel *lblemail;
    IBOutlet UILabel *lblno;
    IBOutlet UILabel *lblname2;
    
    IBOutlet UILabel *lblbdate;
    IBOutlet UILabel *lbllname;
    
    IBOutlet UILabel *lbllemail;
    IBOutlet UILabel *lbllno;
    
    IBOutlet UILabel *lbllbdate;
    IBOutlet UILabel *lblllname;
    
    IBOutlet UILabel *lblabtme;
    
    NSMutableArray *contactArray;
    IBOutlet UIView *viewcontact;
    
    Bump *bumpObj;
    listwhoglued *listVwObj;
    WhoGlueViewController *whoGlueObj;
	IBOutlet UIView *myprofileView;
	IBOutlet UIView *glueMeView;
    IBOutlet UISegmentedControl *GetGlueSegment;
    UIActionSheet *actionSheetCBrand;
    UIPickerView *pickerViewCBrand;
    IBOutlet UIButton *durationBtn;
    NSMutableArray *durationArray;
    TextSendView *textSendObj;
	IBOutlet UIButton *btnMap;
    IBOutlet UIButton *btnFAQ;
    IBOutlet UITableView *tblcontact;
    IBOutlet UIView *viewcontact1;
    gluemeAppDelegate *appDelegateObj;
    MapWithRoutesViewController *objmapview;
    UIImageView *topbarImg;
    
    
}

@property (nonatomic, retain) UIPickerView *pickerViewCBrand;
@property (nonatomic, retain)UIActionSheet *actionSheetCBrand;
@property (nonatomic, retain)  UISegmentedControl *GetGlueSegment;
@property (nonatomic, retain)UIButton *durationBtn;
@property (nonatomic, retain) NSMutableArray *durationArray;
-(IBAction)onText:(id)sender;
-(IBAction)onGlueMe:(id)sender;
-(IBAction)onCustomize:(id)sender;
-(IBAction)oncancel:(id)sender;
-(IBAction)onSend:(id)sender;
-(IBAction)onEmail:(id)sender;
-(IBAction)OnTimeSelected;
-(IBAction)SegmentChanged:(id)Sender;
-(IBAction)onMap:(id)sender;
-(IBAction)setmeeting;
@end
