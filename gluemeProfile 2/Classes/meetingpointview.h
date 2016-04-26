//
//  meetingpointview.h
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "meetingpointdetail.h"
#import "WhoGlueViewController.h"
#import "listwhoglued.h"
#import "Bump.h"
#import "JSONParser.h"
#import "gluemeAppDelegate.h"
#import "CustomCalloutMapViewViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "CustomCalloutMapViewViewController.h"
#import "meetingpointview.h"

@class WhoGlueViewController,listwhoglued,Bump,gluemeAppDelegate;
@interface meetingpointview : UIViewController <CLLocationManagerDelegate
,UISearchBarDelegate , UITableViewDelegate , UITableViewDataSource> {
    Bump *bumpObj;
    gluemeAppDelegate *appDelegateObj;
    listwhoglued *listVwObj;
	IBOutlet UITableView *tbl;
    IBOutlet UITableView *searchTbl;
	IBOutlet UIButton *btnFAQ;
	IBOutlet UISearchBar *searchbar;
	WhoGlueViewController *whoGlueVwObj;
	NSMutableArray *tabelarr;
	NSMutableArray *DetailArray;

    CLLocation *currentLocation;
	
    CLLocationManager *locationManager;
    
    NSString *city;
    NSString *searchText;
    
    NSURLConnection *conn1;
    NSMutableData *webData;
    
    float currentLat;
    float currentLon;
    
    NSMutableArray *allPlacesArray;
    NSMutableArray *searchTblArray;
    NSMutableArray *resultArray;
	NSMutableArray *searcharr;
	IBOutlet UIButton *btnMap;
    UIImageView *topbarImg;
}

@property (nonatomic, retain) NSString *searchText;
@property (nonatomic, retain) UITableView *searchTbl;
@property (nonatomic, retain) NSMutableArray *allPlacesArray;
@property (nonatomic, retain) NSMutableArray *searchTblArray;

@property (nonatomic) float currentLat;
@property (nonatomic) float currentLon;

-(IBAction)onMap:(id)sender;
-(void)Back;
-(IBAction)setmeeting;
-(void)Bump;
-(void)datafatch:(NSDictionary*)dictionary;
-(void)getAddress:(NSString *)Lat:(NSString*)Long;

@end
