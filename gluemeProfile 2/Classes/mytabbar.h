//
//  mytabbar.h
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCalloutMapViewViewController.h"

@interface mytabbar : UIViewController <UITabBarControllerDelegate>{

	IBOutlet UITabBarController *tabbar;
	
	IBOutlet UIWindow *window;
    //IBOutlet UITabBarController *tabBarController;
}


@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabbar;


@end
