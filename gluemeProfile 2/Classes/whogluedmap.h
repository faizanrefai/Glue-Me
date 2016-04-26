//
//  whogluedmap.h
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "meetingpointview.h"
#import <MapKit/MapKit.h>
#import "listwhoglued.h"
#import "CustomCalloutMapViewViewController.h"
#import "gluemeAppDelegate.h"

@class listwhoglued,gluemeAppDelegate;
@interface whogluedmap : UIViewController<MKMapViewDelegate> {
    IBOutlet UIButton *btnFAQ;
    IBOutlet MKMapView *mapView;
    listwhoglued *listVwObj;
    gluemeAppDelegate *appDelegateObj;
}

@property (nonatomic, retain) MKMapView *mapView;
-(IBAction)btnmeetingpoint_clicked:(id)sender;
-(void)Back;
-(IBAction)setmeeting;
@end
