//
//  ContactDetailView.h
//  glueme
//
//  Created by APPLE  on 9/21/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextSendView.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "gluemeAppDelegate.h"
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "Bump.h"
#import "MyContactScreen.h"
#import "CustomCalloutMapViewViewController.h"
#import "meetingpointview.h"

@class TextSendView,gluemeAppDelegate,WhoGlueViewController,listwhoglued,Bump,MyContactScreen;
@interface ContactDetailView : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>{
    
    Bump *bumpObj;
    WhoGlueViewController *whoGlueObj;
    gluemeAppDelegate *appDelegateObj;
    TextSendView *textSendObj;
    MyContactScreen *MyContactObj;
    
    IBOutlet UIImageView *myProVwImg;
    IBOutlet UIImageView *GlueMeVwImg;
    
    
    IBOutlet UIView *myprofileView;
	IBOutlet UIView *glueMeView;
    IBOutlet UISegmentedControl *GlueMeProfileSegment;
    UIActionSheet *actionSheetCBrand;
    UIPickerView *pickerViewCBrand;
    IBOutlet UIButton *durationBtn;
    NSMutableArray *durationArray;
    
    IBOutlet UIButton *BtnGluemeCheck;
    IBOutlet UIButton *BtnTextCheck;
    IBOutlet UIButton *BtnEmailCheck;
    
      //GlueMeView labels
    IBOutlet UILabel *LblGMVwName;
    IBOutlet UITextView *txtVwAbotMe;
    
 //profileView Labels
    IBOutlet UILabel *eMailIdLbl;
    IBOutlet UILabel *NameLabel;
    IBOutlet UILabel *PhnNoLabel;
    IBOutlet UILabel *BdateLabel;
    
    IBOutlet UIImageView *GmImg;
    IBOutlet UIImageView *emailImg;
    
    
    IBOutlet UIButton *btnMap;
    
    IBOutlet UILabel *TitleLbl;
    IBOutlet UIButton *btnFAQ;
    listwhoglued *listVwObj;
    UIImageView *topbarImg;
}

@property (nonatomic, retain) UIImageView *myProVwImg;
@property (nonatomic, retain) UIImageView *GlueMeVwImg;
@property (nonatomic, retain)  UITextView *txtVwAbotMe;
@property (nonatomic, retain) UIImageView *GmImg;
@property (nonatomic, retain) UIImageView *emailImg;
@property (nonatomic, retain)  UILabel *NameLabel;
@property (nonatomic, retain)  UILabel *PhnNoLabel;
@property (nonatomic, retain)  UILabel *BdateLabel;
@property (nonatomic, retain)  UILabel *LblGMVwName;
@property (nonatomic, retain) UIButton *BtnGluemeCheck;
@property (nonatomic, retain) UIButton *BtnTextCheck;
@property (nonatomic, retain) UIButton *BtnEmailCheck;
@property (nonatomic, retain)UILabel *TitleLbl;
@property (nonatomic, retain) UILabel *eMailIdLbl;
@property (nonatomic, retain) UIPickerView *pickerViewCBrand;
@property (nonatomic, retain)UIActionSheet *actionSheetCBrand;
@property (nonatomic, retain)UISegmentedControl *GlueMeProfileSegment;
@property (nonatomic, retain)UIView *myprofileView;
@property (nonatomic, retain) UIView *glueMeView;
@property (nonatomic, retain)UIButton *durationBtn;
@property (nonatomic, retain) NSMutableArray *durationArray;
-(IBAction)OnTimeSelected;
-(IBAction)onMap:(id)sender;
-(IBAction)onEmail:(id)sender;
-(IBAction)onText:(id)sender;
-(IBAction)onGlueMe:(id)sender;
-(IBAction)onInvite:(id)sender;
-(IBAction)setmeeting;
-(void)PassData;
-(void)Bump;
-(void)MessageSend;
-(void)PassToGlueMe;
-(void)GlueMeRequestFatch:(NSDictionary*)dictionary;
@end
