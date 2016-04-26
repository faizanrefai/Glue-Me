//
//  MyAnnotation.m
//  CustomCalloutMapView
//
//  Created by Jakob Ericsson on 2009-11-01.
//  Copyright 2009 JAKERI AB. All rights reserved.
//

#import "MyAnnotation.h"


@implementation MyAnnotation

@synthesize coordinate, type, title,val;

- (id) initWithCoords:(CLLocationCoordinate2D) coords name:(NSMutableDictionary*) inputName type:(NSString*)typeVal{
	
	self = [super init];
	if (self != nil) {
		coordinate = coords;
        val=[[NSMutableDictionary alloc]init];
        val =inputName;
		type = typeVal;
        if([type isEqualToString:@"Meeting"]){
            
           self.title = [inputName valueForKey:@"add"];
        }
        else{
            self.title = [NSString stringWithFormat:@"%@ %@",[inputName valueForKey:@"firstname"],[inputName valueForKey:@"lastname"]];
        }

        NSLog(title);
		//title = [inputName valueForKey:@"add"];
	}
	return self;
	
}
@end
