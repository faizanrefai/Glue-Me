//
//  MineRequest.h
//  gluemefile://localhost/Volumes/Untitled%202/SVN/glueme/Classes/MineRequest.xib
//
//  Created by APPLE  on 9/20/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyRequestCell.h"
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "Bump.h"
#import "gluemeAppDelegate.h"
#import "CustomCalloutMapViewViewController.h"
#import "meetingpointview.h"

@class WhoGlueViewController,listwhoglued,Bump;
@interface MineRequest : UIViewController <UITableViewDelegate,UITableViewDataSource>{
    
    Bump *bumpObj;
    gluemeAppDelegate *appDelegateObj;
    WhoGlueViewController *whoGlueVwObj;
    IBOutlet UITableView *RequestTbl;
    IBOutlet UISegmentedControl *requestSegment;
    NSMutableArray *statusArray;
    NSMutableArray *nameArray;
    NSMutableArray *nameArrayid;
    NSMutableArray *DateArray;
    NSMutableArray *TimeArray;
    NSMutableArray *lNameArray;
    
    NSMutableArray *arrtheirid;
    
    NSMutableArray *TheirNameArray;
    NSMutableArray *TheirStatusArray;
    NSMutableArray *TheirDateArray;
    NSMutableArray *TheirTimeArray;
    NSMutableArray *TheirlNameArray;
    NSMutableArray *frndReqArray;
    NSMutableArray *GMReqArray;
    NSMutableArray *ReqArray;
	IBOutlet UIButton *btnMap;
    IBOutlet UIButton *btnFAQ;
    int ind;
    
    NSString *Accepted;
    NSString *Blocked;

    
    listwhoglued *listVwObj;
    UIButton *BlockBtn;
    UIButton *IgnoreBtn;
    UIButton *AcceptBtn;
	IBOutlet UIImageView *BadgeImgView;
	IBOutlet UILabel *BadgeLbl;
    UIImageView *topbarImg;
}

@property (nonatomic, retain) NSString *Accepted;
@property (nonatomic, retain) NSString *Blocked;


@property (nonatomic,retain) NSMutableArray *ReqArray;
@property (nonatomic,retain) NSMutableArray *frndReqArray;
@property (nonatomic,retain) NSMutableArray *GMReqArray;
@property (nonatomic, retain) NSMutableArray *lNameArray;
@property (nonatomic, retain)NSMutableArray *TheirlNameArray;
@property (nonatomic, retain)  NSMutableArray *DateArray;
@property (nonatomic, retain) NSMutableArray *TimeArray;
@property (nonatomic, retain) NSMutableArray *TheirDateArray;
@property (nonatomic, retain) NSMutableArray *TheirTimeArray;
@property (nonatomic) int ind;
@property (nonatomic, retain) NSMutableArray *TheirStatusArray;
@property (nonatomic, retain)NSMutableArray *TheirNameArray;
@property (nonatomic, retain)NSMutableArray *nameArray;
@property (nonatomic, retain) NSMutableArray *statusArray;
@property (nonatomic, retain)UISegmentedControl *requestSegment;
@property (nonatomic , retain)UITableView *RequestTbl;




-(IBAction)SegmentChanged;
-(IBAction)onMap:(id)sender;
-(IBAction)setmeeting;


-(void)ClickOnReject:(id)sender;
-(void)ClickOnBlock:(id)sender;
-(void)ClickOnAccept:(id)sender;
-(void)deleteCell;
-(void)Bump;


-(void)GetMyFriendRequestList;
-(void)GetSentFriendRequestList;
-(void)getReqCount;




@end
