//
//  CustomCalloutMapViewViewController.h
//  CustomCalloutMapView
//
//  Created by Jakob Ericsson on 2009-11-01.
//  Copyright JAKERI AB 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MessageUI/MessageUI.h>

#import "TouchView.h"
#import "MyAnnotation.h"
#import "MoreInfoView.h"
#import "EGOImageView.h"
#import "gluemeAppDelegate.h"

@class gluemeAppDelegate;
@interface CustomCalloutMapViewViewController : UIViewController<MKMapViewDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate,UINavigationControllerDelegate,CLLocationManagerDelegate,UIAlertViewDelegate> {

	MKMapView *mapView;
    CLLocationManager *locationManager;
    
    IBOutlet UIImageView *backGroundImg;
    
    gluemeAppDelegate *appDelegateObj;
	TouchView* touchView;
	IBOutlet MoreInfoView* moreInfoView;
    int frndCnt;
    int meetingCnt;
    NSMutableArray* annotations;
    NSMutableArray *annValues;
    EGOImageView *imageViewPro;
    MyAnnotation *user_ann;
    MyAnnotation *destination_ann;
    MyAnnotation *region_ann;
    BOOL inFunction;
    UIImageView *topbarImg;
    
	
}
@property (nonatomic, retain)  UIImageView *backGroundImg;
@property (nonatomic, retain) NSMutableArray *annValues;
@property (nonatomic, retain) NSMutableArray* annotations ;
@property (nonatomic, retain) MKMapView* mapView;
@property (nonatomic, retain) TouchView* touchView;
@property (retain) IBOutlet MoreInfoView* moreInfoView;
extern NSString *const GMAP_ANNOTATION_SELECTED;

- (void) showAnnotation:(MyAnnotation*) annotation;
- (void) hideAnnotation;
- (void)getUSer;
- (void)getFriend;
- (void)getMeeting;
- (void)setLoadImageg:(NSString*)loadimage;
- (IBAction)onNavigation:(id)sender;
- (IBAction)onMail:(id)sender;
- (IBAction)onMessage:(id)sender;
- (IBAction)onclose:(id)sender;
- (IBAction)onMeeting:(id)sender;
- (IBAction)onCall:(id)sender;
-(IBAction)onDelete:(id)sender;
-(void) addRouteFrom:(CLLocationCoordinate2D)startCoord to:(CLLocationCoordinate2D)endCoord zommed:(BOOL)shouldZoom;
@end

