//
//  FAQHelp.h
//  glueme
//
//  Created by apple1 on 9/21/11.
//  Copyright 2011 openxcek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "listwhoglued.h"
#import "Bump.h"
#import "gluemeAppDelegate.h"
#import "CustomCalloutMapViewViewController.h"
#import "meetingpointview.h"

@class listwhoglued,Bump,gluemeAppDelegate;
@interface FAQHelp : UIViewController <UITextViewDelegate>{
	
    listwhoglued *listVwObj;
	IBOutlet UISegmentedControl *segFAQ;
	IBOutlet UITextView *help;
	IBOutlet UITextView *FAQ;
	IBOutlet UITextView *aboutus;
	IBOutlet UIButton *btnMap;
    Bump *bumpObj;
    gluemeAppDelegate *appDelegateObj;
    UIImageView *topbarImg;

}

@property (nonatomic, retain) UISegmentedControl *segFAQ;
@property (nonatomic, retain) UITextView *help;
@property (nonatomic, retain) UITextView *FAQ;
@property (nonatomic, retain) UITextView *aboutus;
@property (nonatomic, retain) UIButton *btnMap;
-(IBAction)segmentSelection:(id)sender;
-(IBAction)onMap:(id)sender;
-(IBAction)setmeeting;
@end
