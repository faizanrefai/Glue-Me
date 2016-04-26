//
//  MyHistory.h
//  glueme
//
//  Created by APPLE  on 9/21/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewHistory.h"
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "gluemeAppDelegate.h"
#import "Bump.h"
#import "CustomCalloutMapViewViewController.h"
#import "meetingpointview.h"

@class DetailViewHistory,WhoGlueViewController,listwhoglued,gluemeAppDelegate,Bump;
@interface MyHistory : UIViewController <UITableViewDelegate,UITableViewDataSource>{
    
    NSMutableDictionary *FetchedDic;
    NSMutableArray *fetchedArray;
    
    Bump *bumpObj;
    gluemeAppDelegate *appDelegateObj;
    WhoGlueViewController *whoGlueObj;
    IBOutlet UITableView *HistoryListTbl;
    NSMutableArray *historyList;
    DetailViewHistory *detailVwHistryObj;
	IBOutlet UIButton *btnMap;
    IBOutlet UIButton *btnFAQ;
    listwhoglued *listVwObj;
    
    NSMutableArray *lastGluedTime;
    NSMutableArray *lastGluedOn;
    NSMutableArray *HistUid;
    NSMutableArray *HistNmae;
    
    UIImageView *topbarImg;
}

@property (nonatomic, retain)NSMutableArray *lastGluedTime;
@property (nonatomic, retain)NSMutableArray *lastGluedOn;
@property (nonatomic, retain) NSMutableArray *HistUid;
@property (nonatomic, retain)  NSMutableArray *HistNmae;
@property (nonatomic, retain)NSMutableArray *fetchedArray;
@property (nonatomic, retain) NSMutableDictionary *FetchedDic;

-(IBAction)onMap:(id)sender;
-(IBAction)setmeeting;
-(void)Bump;
@property (nonatomic, retain) NSMutableArray *historyList;
@property (nonatomic, retain) UITableView *HistoryListTbl;
@end
