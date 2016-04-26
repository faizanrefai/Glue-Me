//
//  MoreInfoView.h
//  CustomCalloutMapView
//
//  Created by Jakob Ericsson on 2009-12-04.
//  Copyright 2009 JAKERI AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MoreInfoView : UIView {

	IBOutlet UILabel* text1;
    IBOutlet UILabel* text2;
    IBOutlet UILabel* text1m;
    IBOutlet UILabel* text2m;
    IBOutlet UIView *meetingView;    
    IBOutlet UIView *personView;
	
}

@property (nonatomic, retain) IBOutlet UILabel*  text1;
@property (nonatomic, retain) IBOutlet UILabel*  text2;
@property (nonatomic, retain) IBOutlet UILabel*  text1m;
@property (nonatomic, retain) IBOutlet UILabel*  text2m;
@property (nonatomic, retain) IBOutlet UIView *personView;
@property (nonatomic, retain)IBOutlet UIView *meetingView; 

@end
