//
//  MapWithRoutesViewController.h
//  MapWithRoutes
//
//  Created by kadir pekel on 5/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mapView.h"

#import "Place.h"

@interface MapWithRoutesViewController : UIViewController {
    Place *source;
    Place *destination;
    MapView* mapView;
}

@property(nonatomic,retain) Place *source;
@property(nonatomic,retain)Place *destination;
-(void)setPlaces:(Place*)s_p:(Place*)d_p;

@end

