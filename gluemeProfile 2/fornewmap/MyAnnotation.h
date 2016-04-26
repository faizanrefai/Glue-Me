//
//  MyAnnotation.h
//  CustomCalloutMapView
//
//  Created by Jakob Ericsson on 2009-11-01.
//  Copyright 2009 JAKERI AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject<MKAnnotation> {

	CLLocationCoordinate2D coordinate;
	NSString *type;
	NSString *title;
    NSMutableDictionary *val;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,retain) NSString *type;
@property (nonatomic,retain) NSMutableDictionary *val;
@property (nonatomic,retain) NSString *title;
- (id) initWithCoords:(CLLocationCoordinate2D) coords name:(NSMutableDictionary*) inputName type:(NSString*)typeVal;
@end
