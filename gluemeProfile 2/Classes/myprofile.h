//
//  myprofile.h
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "Bump.h"
#import "EGOImageView.h"
#import "gluemeAppDelegate.h"
#import "CustomCalloutMapViewViewController.h"
#import "meetingpointview.h"

@class WhoGlueViewController,listwhoglued,Bump,gluemeAppDelegate;
@interface myprofile : UIViewController <UIActionSheetDelegate , UIPickerViewDelegate , UIImagePickerControllerDelegate , UINavigationControllerDelegate,UITextFieldDelegate>{
    IBOutlet UIScrollView *PublicProScroll;
	
	IBOutlet UIScrollView *scroll;
	
	IBOutlet UISegmentedControl *mysegment;
	
	//UIActionSheet *actionsheet;
	WhoGlueViewController *whoGlueObj;
    Bump *bumpObj;
    CGFloat animatedDistance;
    
    gluemeAppDelegate *appDelegateObj;
    
	UIImage *img;
	IBOutlet UIButton *btnFAQ;
	IBOutlet UIButton *imgBtn;
	IBOutlet UIButton *btnMap;
	IBOutlet UIScrollView *publicprofileview;
	listwhoglued *listVwObj;
	IBOutlet UIButton *lnamebtn;
	IBOutlet UIButton *screenbtn;
	IBOutlet UIButton *birthdaybtn;
	IBOutlet UIButton *aboutmebtn;
	IBOutlet UIButton *emailbtn;
	IBOutlet UIButton *contactbtn;
    EGOImageView *imageViewL;

    IBOutlet UITextField *txtfname;
    
    IBOutlet UITextField *txtlname;
    IBOutlet UITextField *txtcontactno;
    IBOutlet UITextField *txtbday;
    IBOutlet UITextField *txtaboutme;

    IBOutlet UITextField *txtscrnname;

    NSMutableDictionary *profDic;
    
    NSString *StrImage1;
    
    NSString *StrImageCode1;
    NSString *picname1;
    NSString *picname;
    NSString *imgStr;
    
    BOOL isEdit;
    IBOutlet UIButton *editBtn;
    IBOutlet UIButton *uploadBtn;
    IBOutlet UIButton *RegisterBtn;
    
    NSString *privateStr;
    NSString *publicStr;
    UIImageView *topbarImg;
     BOOL isPicker;
}
@property (nonatomic, retain) NSString *privateStr;
@property (nonatomic, retain) NSString *publicStr;
@property (nonatomic) BOOL isEdit;
@property (nonatomic, retain)  UIButton *editBtn;
@property (nonatomic, retain)  UIButton *RegisterBtn;
@property (nonatomic, retain)  UIButton *uploadBtn;
@property (nonatomic, retain) UIScrollView *PublicProScroll;
@property (nonatomic, retain) NSMutableDictionary *profDic;

-(IBAction)onMap:(id)sender;

-(void)Bump;
-(IBAction)segmentedControlIndexChanged;
-(IBAction)takeImage:(id)sender;
-(IBAction)setmeeting;
-(IBAction)ChkBtnValChanged:(id)sender;
-(IBAction)btnregister:(id)sender;
-(void)GetOwnProfile;
-(void)setLoadImageg:(NSString*)loadimage;
-(IBAction)EditProf:(id)sender;
-(void)setImage:(EGOImageView *)temp;
-(void)displayindicator;
-(IBAction)PublicDoneClicked:(id)sender;

@end
