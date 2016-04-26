//
//  iCodeBlogAnnotationView.h
//  iCodeMap
//
//  Created by Collin Ruffenach on 7/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "gluemeAppDelegate.h"
#import "iCodeBlogAnnotation.h"
#import "EGOImageView.h"

@class WhoGlueViewController;
@interface iCodeBlogAnnotationView : MKAnnotationView 
{
    gluemeAppDelegate *appDelegateObj;
	UIImageView *imageView;
    WhoGlueViewController *WhoGlueViewControllerObj;
    EGOImageView *imageViewL;
    
    
}

@property (nonatomic, retain) UIImageView *imageView;

-(void)setParentObj:(WhoGlueViewController*)obj;
-(IBAction)showViewParent:(id)sender;
@end
