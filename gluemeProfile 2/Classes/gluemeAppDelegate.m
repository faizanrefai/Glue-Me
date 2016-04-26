//
//  gluemeAppDelegate.m
//  glueme
//
//  Created by apple on 9/19/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import "gluemeAppDelegate.h"
#import "RootViewController.h"
#import "whogluedmap.h"

@implementation gluemeAppDelegate

@synthesize islogin,isregister,isdeleteHistory,isReGlued,phoneBkDict,EmailDict,latitude,longitude,PhoneBookArray,emails,userID,placeString,selectedFrnd,addedFrnd,isaddfrnd,userProfImg,strDeviceID;
@synthesize window,parentlist_obj;
@synthesize navigationController,strid,selectpage,contactnum,contactname,contactemail,emailStr,phnStr,NameStr,bdateStr,myobject,mySelector,stremailselect,stremailselect0;
@synthesize mylatitude,mylongitude,count,currentUserName,userEmail,stremaillist,meetingPPlArray,selectedUser,SelectedEmail,SelectedPhnNo,selectedBdate,ImgArray,isViewDirection,HistoryId,strIdSelect,strIdList,strIdsel0,histName,histLastGlOn,histLastGLTime,AddStr,meetingLat,meetingLong,backGroundImg,tabbarIndCnt,isthemechanged;


@synthesize strtolatuser,strtolonguser,strfromlatuser,strfromlonguser,lname;
@synthesize objLogin,GluedCnt;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    // Add the navigation controller's view to the window and display.
    
    tabbarIndCnt = 0;
    
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
        
        [backGroundImg setImage:[UIImage imageNamed:@"GreyBkGround.png"]];
        
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
    {
        
        [backGroundImg setImage:[UIImage imageNamed:@"purpleBkGround.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
    {
        [backGroundImg setImage:[UIImage imageNamed:@"OrangeBkGround.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
    {
        [backGroundImg setImage:[UIImage imageNamed:@"blackBkGround.png"]];
    }
    else
    {
       [backGroundImg setImage:[UIImage imageNamed:@"back.2.png"]];
    }
    
    
    
	parentlist_obj= [[listwhoglued alloc]init];
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeBadge)];
    [self.window addSubview:navigationController.view];
    [self.window makeKeyAndVisible];
    
    ImgArray = [[NSMutableArray alloc] init];
    objLogin = [[login alloc] init];
	//[UIApplication sharedApplication].applicationIconBadgeNumber = 0;

    
     islogin = TRUE;
    return YES;
}

-(void)getReqCount{
	NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/pending_friend_req_list_count.php?frnd_id=%d",userID];
	
	NSLog(@"%@",urlString);
	
	NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
	
	JSONParser *parser;
	parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];
	



}

-(void)getGluedCount
{
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/glueMe_friend_list.php?user_id=%i",self.userID];
    
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(Countdatafatch:) andHandler:self];

}

-(void)Countdatafatch:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);
    
   GluedCnt = [[dictionary valueForKey:@"glueMe_friend_list"]count];
}

-(void)datafatch:(NSDictionary*)dictionary{
	int val =[[dictionary valueForKey:@"count"]intValue];
	if(val==0)
	{
		[UIApplication sharedApplication].applicationIconBadgeNumber = val ;
	}
	else {
		[UIApplication sharedApplication].applicationIconBadgeNumber = val;

	}


}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken 
{
    
    NSString *strDeviceToken = [[[[deviceToken description]
                                  stringByReplacingOccurrencesOfString: @"<" withString: @""] 
                                 stringByReplacingOccurrencesOfString: @">" withString: @""] 
                                stringByReplacingOccurrencesOfString: @" " withString: @""];
    strDeviceID = strDeviceToken;  
    NSLog(@"DeviceToken :%@",strDeviceID);
    [[NSUserDefaults standardUserDefaults] setObject:strDeviceID forKey:@"UDID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    NSLog(@"notification received");
	//[[[[[self tabBarController] tabBar] items] objectAtIndex:1] setBadgeValue:[NSString stringWithFormat:@"%d",0]];
	[parentlist_obj getReqCount];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"GlueMe request sent" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	if([[NSUserDefaults standardUserDefaults] valueForKey:@"Login"]!=nil){
		[self getReqCount];		
	}
	
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
	if([[NSUserDefaults standardUserDefaults] valueForKey:@"Login"]!=nil){
		[parentlist_obj getReqCount];
	}/*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


//- (void)applicationDidBecomeActive:(UIApplication *)application {
//    /*
//     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//     */
//}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}




#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [latitude release];
    [longitude release];
    [EmailDict release];
    [phoneBkDict release];
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

