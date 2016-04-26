//
//  WhoGlueViewController.m
//  glueme
//
//  Created by OPENXCELL TECHNOLABS on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WhoGlueViewController.h"
#import "FAQHelp.h"
#import "DisplayMap.h"
#import "iCodeBlogAnnotation.h"
#import "AlertHandler.h"
#import "GdataParser.h"
#import "meetingpointview.h"

@implementation WhoGlueViewController

//static NSString* const GMAP_ANNOTATION_SELECTED = @"gMapAnnontationSelected";
@synthesize userProfileVw,mapView,mapAnnotations,ImgMapViewHome,ImgMapView,ImgMapViewHome3,annView,latArray,longArray,cnt,profImgBtn,dic,contactemail,LblName,nameArray,pinArray,tag,profImg,Address,LblAdd,latCnt,Met,AddCount,MetDataCnt,meetingLatArray,meetingLongArray,MetTag,CatFinalArray,CatDic,CatDic2,tempmyarr,titleArray,UserAddress,cn,startDateTime,EndDateTime,MeetingAdd,MeetingTime,callBtn,msgBtn,mailBtn,MeetBtn,directBtn,MeetingUId,meetUid,removeMet,isMetDeleted,GmMeetId,meetId;


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    /*
     Test@testiest.com
     123456789
     1999-10-12
     */
    
   
    GmMeetId = [[NSMutableArray alloc] init]; 
    
    MeetingUId = [[NSMutableArray alloc] init];
    
    startDateTime = [[NSMutableArray alloc] init];
    EndDateTime = [[NSMutableArray alloc] init];
   
    CatFinalArray = [[NSMutableArray alloc] init];
    meetingLongArray = [[NSMutableArray alloc] init];
    meetingLatArray  = [[NSMutableArray alloc]init];
    UserAddress = [[NSMutableArray alloc] init];
    AddArray = [[NSMutableArray alloc] init];
    pinArray = [[NSMutableArray alloc] init];
    [super viewDidLoad];
    appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication]delegate];
    //mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.delegate = self;
    
    
    [self.view addSubview:mapView];
    [self.view addSubview:userProfileVw];
    [mapView bringSubviewToFront:userProfileVw];
    [NSThread detachNewThreadSelector:@selector(displayMyMap) toTarget:self withObject:nil];
    
    
    self.navigationController.navigationBar.alpha = 0.0;
    
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
    topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
        [topbarImg setImage:[UIImage imageNamed:@"GreyTopBar.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"PurpleTopBar.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"OrangeTopBar.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"BlackTopBar.png"]];
    }
    else
    {
        [topbarImg setImage:[UIImage imageNamed:@"Group9.png"]];
    }

    
    [self.view addSubview:topbarImg];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(5,10, 76, 28);
    
    [backBtn addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backBtn]; 
    
    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    BumpBtn.frame = CGRectMake(268,10, 35, 34);
    
    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:BumpBtn]; 

    imageViewPro = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"images.png"]];
    [imageViewPro setFrame:CGRectMake(12, 14, 77, 75)];
    
    [userProfileVw addSubview:imageViewPro];  
	//appDelegateObj.parentlist_obj =self;
    
    
//	self.mapView.mapType = MKMapTypeStandard;   // also MKMapTypeSatellite or MKMapTypeHybrid
//	
//    // create a custom navigation bar button and set it to always says "Back"
//	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
//	temporaryBarButtonItem.title = @"Back";
//	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
//	[temporaryBarButtonItem release];
//    
//    // create out annotations array (in this example only 2)
//    self.mapAnnotations = [[NSMutableArray alloc] initWithCapacity:2];
    
    	
}

-(void)Back
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)Bump
{
    NSLog(@"BumpClicked");
    bumpObj = [[Bump alloc] initWithNibName:@"Bump" bundle:nil];
    [self.navigationController pushViewController:bumpObj animated:YES];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    
    if (appDelegateObj.isthemechanged) {
//        self.navigationController.navigationBar.alpha = 0.0;
//        
//        self.navigationController.navigationBar.tintColor = [UIColor clearColor];
//        UIImageView *topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
            [topbarImg setImage:[UIImage imageNamed:@"GreyTopBar.png"]];
        }
        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
        {
            [topbarImg setImage:[UIImage imageNamed:@"PurpleTopBar.png"]];
        }
        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
        {
            [topbarImg setImage:[UIImage imageNamed:@"OrangeTopBar.png"]];
        }
        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
        {
            [topbarImg setImage:[UIImage imageNamed:@"BlackTopBar.png"]];
        }
        else
        {
            [topbarImg setImage:[UIImage imageNamed:@"Group9.png"]];
        }
        
        
//        [self.view addSubview:topbarImg];
//        
//        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        backBtn.frame = CGRectMake(5,10, 76, 28);
//        
//        [backBtn addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self.view addSubview:backBtn]; 
//        
//        UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        BumpBtn.frame = CGRectMake(268,10, 35, 34);
//        
//        [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self.view addSubview:BumpBtn]; 

    }
    
    if (isMetDeleted) {
        mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 72, 320, 344)];
        [mapView setDelegate:self];
        [self.view addSubview:mapView];
        isMetDeleted= FALSE;
        AddCount=0;
        Met = 0;
        tag = 0;
        MetTag = 0;
        cn = 0;
        c=0;
        latCnt = 0;
        locationManager = [[CLLocationManager alloc]init];
        if([CLLocationManager locationServicesEnabled])
        {
            locationManager.delegate = self;
            locationManager.desiredAccuracy  = kCLLocationAccuracyKilometer;
            locationManager.distanceFilter = 1000.0f;
            [locationManager startUpdatingLocation];
            
            //	appDelegateObj.latitude= [[NSString alloc]initWithFormat:@"%g",locationManager.];
            //appDelegateObj.longitude = [[NSString alloc]initWithFormat:@"%g",locationManager.longitude];
            
        }

    }
    else
    {

    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 72, 320, 344)];
    [mapView setDelegate:self];
    [self.view addSubview:mapView];
    AddCount=0;
    Met = 0;
    tag = 0;
    MetTag = 0;
    cn = 0;
    c=0;
	locationManager = [[CLLocationManager alloc]init];
	if([CLLocationManager locationServicesEnabled])
	{
		locationManager.delegate = self;
		locationManager.desiredAccuracy  = kCLLocationAccuracyKilometer;
		locationManager.distanceFilter = 1000.0f;
		[locationManager startUpdatingLocation];

	//	appDelegateObj.latitude= [[NSString alloc]initWithFormat:@"%g",locationManager.];
		//appDelegateObj.longitude = [[NSString alloc]initWithFormat:@"%g",locationManager.longitude];
        			
	}
	

    latCnt = 0;
	annTypeArray = [[NSMutableArray alloc] init];
    appDelegateObj.ImgArray = [[NSMutableArray alloc] init];
	
//    [ImgArray addObject:@"p3.png"];
//    [ImgArray addObject:@"p4.png"]; 
	
    //latArray = [[NSMutableArray alloc] initWithObjects:@"41.7912645013",@"43.036", nil];
   
	latArray = [[NSMutableArray alloc] init];
    nameArray = [[NSMutableArray alloc] init];
    Lnamearray=[[NSMutableArray alloc]init];
    
	// [nameArray addObject:@"test"]; 
    contactnum = [[NSMutableArray alloc] init];
   // [contactnum addObject:@"8128123650"];
    contactemail = [[NSMutableArray alloc] init];
   // [contactemail addObject:@"Test@test.com"];
    bdateArray = [[NSMutableArray alloc] init];
   // [bdateArray addObject:@"2001-11-14"];
    cnt = [latArray count];
    //    longArray = [[NSMutableArray alloc] initWithObjects:@"-87.5811598203",@"-87.917", nil];
    longArray = [[NSMutableArray alloc] init];
    }
   
  //  [latArray addObject:appDelegateObj.latitude];
   // [longArray addObject:appDelegateObj.longitude];
    
}



- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	
	appDelegateObj.latitude= [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.latitude];
	appDelegateObj.longitude = [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.longitude];
   
	
	MKCoordinateRegion region;  
    MKCoordinateSpan span;  
    span.latitudeDelta=0.2;  
    span.longitudeDelta=0.2;  
	
    CLLocationCoordinate2D location;  
	
	location.latitude = newLocation.coordinate.latitude ;
	location.longitude = newLocation.coordinate.longitude;
	
	
    region.span=span;  
    region.center=location;  
	
    [mapView setRegion:region animated:TRUE];  
    [mapView regionThatFits:region];

	
	NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/update_lat_lon.php?uid=%d&lat=%@&lon=%@",appDelegateObj.userID,appDelegateObj.latitude,appDelegateObj.longitude];
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
	JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatchupdate:) andHandler:self];
	NSLog(@"lat n lon :%@  %@",  appDelegateObj.latitude,appDelegateObj.longitude);
}

-(void)datafatchupdate:(NSDictionary*)dictionary{
    
//    if (appDelegateObj.isViewDirection) {
//        appDelegateObj.isViewDirection = FALSE;
//        return;
//    }
//    else
//    {

    
    
	NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/user_list.php?userid=%d",appDelegateObj.userID];
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];
	
//    }
}

-(void)datafatch:(NSDictionary*)dictionary{
    
      [UserAddress removeAllObjects];
    
    [appDelegateObj.ImgArray removeAllObjects];
    [latArray removeAllObjects];
    [longArray removeAllObjects];
    [contactemail removeAllObjects];
    [contactnum removeAllObjects];
    [nameArray removeAllObjects];
    [bdateArray removeAllObjects];
    [Lnamearray removeAllObjects];
//    contactArray = [[NSMutableArray alloc] init];
//    
//    contactname = [[NSMutableArray alloc] init];
//    contactnum = [[NSMutableArray alloc] init];
//    contactemail = [[NSMutableArray alloc] init];
    //[annTypeArray addObject:[NSString stringWithFormat:@"%d",iCodeBlogAnnotationTypeEDU]];
    
    NSLog(@"%@",dictionary);
    
    dic = [[NSMutableDictionary alloc] initWithDictionary:dictionary]; 
	NSString *deviceType = [UIDevice currentDevice].model;


	if([deviceType isEqualToString:@"iPod touch"]||[deviceType isEqualToString:@"iPhone"]||[deviceType isEqualToString:@"iPad"]){
		
	[latArray addObject:appDelegateObj.latitude];
	
	[longArray addObject:appDelegateObj.longitude];
	}
	else {
		[latArray addObject:@"0.000000"];
		
		[longArray addObject:@"0.000000"];
        
//        NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/update_lat_lon.php?uid=%d&lat=0.000000&lon=0.000000",appDelegateObj.userID];
//        
//        NSLog(@"%@",urlString);
//        
//        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//        
//        JSONParser *parser;
//        parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatchupdate:) andHandler:self];

        
	}

	
    for (int i=0; i<[[dictionary valueForKey:@"Record"]count]; i++) 
    {   
        [contactnum addObject:[[[dictionary valueForKey:@"Record"] valueForKey:@"phone"] objectAtIndex:i]];
        
        [contactemail addObject:[[[dictionary valueForKey:@"Record"] valueForKey:@"email"] objectAtIndex:i]];
        
        [nameArray addObject:[[[dictionary valueForKey:@"Record"] valueForKey:@"firstname"] objectAtIndex:i]];
        [bdateArray addObject:[[[dictionary valueForKey:@"Record"] valueForKey:@"bday"] objectAtIndex:i]];
        
        [Lnamearray addObject:[[[dictionary valueForKey:@"Record"] valueForKey:@"lastname"] objectAtIndex:i]];
        
       
        
        NSString *list = [[[dictionary valueForKey:@"Record"] valueForKey:@"add"] objectAtIndex:i];;
        NSArray *listItems = [list componentsSeparatedByString:@","];

        NSString *AddStr = [NSString stringWithFormat:@"%@ %@",[listItems objectAtIndex:3],[listItems objectAtIndex:4]];
        
        
        
        [UserAddress addObject:AddStr];
        
//        NSURL *ImgUrl1 = [NSURL URLWithString:[[[dictionary valueForKey:@"Record"] valueForKey:@"image"] objectAtIndex:i]];
//        
//        NSData *ImgData1 = [NSData dataWithContentsOfURL:ImgUrl1];
//        
//        UIImage *Img1 = [UIImage imageWithData:ImgData1];
        
        [appDelegateObj.ImgArray addObject:[[[dictionary valueForKey:@"Record"] valueForKey:@"image"] objectAtIndex:i]];
        
    }
//    for(int k=0;k<([latArray count]-1);k++)
//    {
//    [annTypeArray addObject:[NSString stringWithFormat:@"%d",iCodeBlogAnnotationTypeApple]];
//    }
    
    //NSLog(@"%@",nameArray);
//    NSLog(@"%@",latArray);
//    NSLog(@"%@",longArray);
//    NSLog(@"%@",contactnum);
//    NSLog(@"%@",contactemail);
   
             [AlertHandler showAlertForProcess];
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/glueMe_friend_list.php?user_id=%i",appDelegateObj.userID];
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch1:) andHandler:self];
    
}
-(void)datafatch1:(NSDictionary*)dictionary{
    
    [AlertHandler hideAlert];
    
    //    contactArray = [[NSMutableArray alloc] init];
    //    
    //    contactname = [[NSMutableArray alloc] init];
    //    contactnum = [[NSMutableArray alloc] init];
    //    contactemail = [[NSMutableArray alloc] init];
  //  [annTypeArray addObject:[NSString stringWithFormat:@"%d",iCodeBlogAnnotationTypeEDU]];
    
    NSLog(@"%@",dictionary);
    
    dic = [[NSMutableDictionary alloc] initWithDictionary:dictionary];    
    for (int i=0; i<[[dictionary valueForKey:@"glueMe_friend_list"]count]; i++) 
    {
        
        
        
        [latArray addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"lat"] objectAtIndex:i]];
        
        [longArray addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"lon"] objectAtIndex:i]];
        
        [contactnum addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"phone"] objectAtIndex:i]];
        
        [contactemail addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"email"] objectAtIndex:i]];
        
        [nameArray addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"firstname"] objectAtIndex:i]];
        [bdateArray addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"bday"] objectAtIndex:i]];
        [Lnamearray addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"lastname"] objectAtIndex:i]];
        
        
        NSString *list = [[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"add"] objectAtIndex:i];;
        NSArray *listItems = [list componentsSeparatedByString:@","];
        
        NSString *AddStr = [NSString stringWithFormat:@"%@ %@",[listItems objectAtIndex:3],[listItems objectAtIndex:4]];
        
        
        
        [UserAddress addObject:AddStr];
        
       // [UserAddress addObject:[[[dictionary valueForKey:@"Record"] valueForKey:@"lastname"] objectAtIndex:i]];
        
//        NSURL *ImgUrl = [NSURL URLWithString:[[[dictionary valueForKey:@"friend_list"] valueForKey:@"image"] objectAtIndex:i]];
//       
//        NSData *ImgData = [NSData dataWithContentsOfURL:ImgUrl];
//        
//        UIImage *Img = [UIImage imageWithData:ImgData];
//        
        [appDelegateObj.ImgArray addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"image"] objectAtIndex:i]];
        
        
        
    }
    
    NSLog(@"%@",appDelegateObj.ImgArray);
    
    for(int k=0;k<([latArray count]-1);k++)
    {
      //  [annTypeArray addObject:[NSString stringWithFormat:@"%d",iCodeBlogAnnotationTypeApple]];
    }
    
    NSLog(@"%@",nameArray);
    NSLog(@"%@",latArray);
    NSLog(@"%@",longArray);
    NSLog(@"%@",contactnum);
    NSLog(@"%@",contactemail);
    
        
//    for (int p=latCnt; p<[latArray count]; p++) {
//        
//        [self getAddress:[latArray objectAtIndex:p] :[longArray objectAtIndex:p]];
//        
//    }
    
    
        latCnt = [latArray count];
        
        
        //For Meeting:
        
        NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/glueMe_meeting_list.php?user_id=%i",appDelegateObj.userID];
        
        NSLog(@"%@",urlString);
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        
        JSONParser *parser;
        parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(Meetingdatafatch:) andHandler:self];
        
        

    
      // [self loadOurAnnotations];
    
    //    
    //    [GlueContactTbl reloadData];
    
}

-(void)Meetingdatafatch:(NSDictionary*)dictionary
{
    [MeetingUId removeAllObjects];
    [GmMeetId removeAllObjects];
    [startDateTime removeAllObjects];
    [EndDateTime removeAllObjects];
     [AddArray removeAllObjects];
    
    NSLog(@"%@",dictionary);
    
    dic = [[NSMutableDictionary alloc] initWithDictionary:dictionary];  
    MetDataCnt = [[dictionary valueForKey:@"glueMe_meeting_list"]count];
    
//    if ([[[dictionary valueForKey:@"glueMe_meeting_list"] valueForKey:@"msg"] isEqualToString:@"Data not found"]) {
////        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Data not found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
////        [alert1 show];
////        [alert1 release];
//        
//    }
//    else
//    {
    for (int i=0; i<[[dictionary valueForKey:@"glueMe_meeting_list"]count]; i++) 
    {
        
        [MeetingUId addObject:[[[dictionary valueForKey:@"glueMe_meeting_list"] valueForKey:@"user_id"] objectAtIndex:i]];
        [GmMeetId addObject:[[[dictionary valueForKey:@"glueMe_meeting_list"] valueForKey:@"gmid"] objectAtIndex:i]];
        [latArray addObject:[[[dictionary valueForKey:@"glueMe_meeting_list"] valueForKey:@"lat"] objectAtIndex:i]];
        
        [longArray addObject:[[[dictionary valueForKey:@"glueMe_meeting_list"] valueForKey:@"lon"] objectAtIndex:i]];
        
        [startDateTime addObject:[[[dictionary valueForKey:@"glueMe_meeting_list"] valueForKey:@"start_date_time"] objectAtIndex:i]];
        [EndDateTime addObject:[[[dictionary valueForKey:@"glueMe_meeting_list"] valueForKey:@"end_date_time"] objectAtIndex:i]];
        
        NSString *list = [[[dictionary valueForKey:@"glueMe_meeting_list"] valueForKey:@"add"] objectAtIndex:i];;
        NSArray *listItems = [list componentsSeparatedByString:@","];
        
        NSString *AddStr = [NSString stringWithFormat:@"%@ %@",[listItems objectAtIndex:2],[listItems objectAtIndex:3]];
        
        
        
        [UserAddress addObject:AddStr];
        
        [AddArray addObject:AddStr];  
        
//        [UserAddress addObject:[[[dictionary valueForKey:@"Record"] valueForKey:@"add"] objectAtIndex:i]];    
//        
        
    }
    
//    } 
   
    NSLog(@"%@",latArray);
    NSLog(@"%@",longArray);
  
 

 
   
    
//    for (int Me=0; Me<[latArray count]; Me++) {
//        
//        [self getAddress:[latArray objectAtIndex:Me] :[longArray objectAtIndex:Me]];
//        
//    }
    
    
    [self loadOurAnnotations];

    
}

-(IBAction)RemoveMeeting:(id)sender
{
    for (int mE = 0; mE<[MeetingUId count]; mE++) {
        if (meetUid == appDelegateObj.userID) {
           
            NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/remove_glueMe_meeting.php?gmid=%i&user_id=%i",meetId,meetUid];
            
            NSLog(@"%@",urlString);
            
            NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
            
            JSONParser *parser;
            parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(RemoveMetData:) andHandler:self];
            
            return;
        }
    }
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/remove_glueMe_meeting.php?gmid=%i&frnd_id=%i",meetId,appDelegateObj.userID];
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(RemoveMetFrnd:) andHandler:self];
   
    
    
}

-(void)RemoveMetData:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);
    
    [mapView release];
    
    isMetDeleted = TRUE;
    
    [self viewWillAppear:YES];
    
}

-(void)RemoveMetFrnd:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);
    
    [mapView release];
    
    isMetDeleted = TRUE;
    
    [self viewWillAppear:YES];
    
}

-(IBAction)call:(id)sender{
    NSString *uname = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)appDelegateObj.phnStr, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    
    NSURL *phoneNumberURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",uname]];
    
    NSLog(@"Phone URL %@",phoneNumberURL);
    [[UIApplication sharedApplication] openURL:phoneNumberURL];
     
}
-(IBAction)email:(id)sender{
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject:@"My Subject"];
    arrlist=[[NSMutableArray alloc]init];
    
    [arrlist addObject:appDelegateObj.emailStr];
    

    [controller setToRecipients:arrlist];
    
    
    
    
    [controller setMessageBody:@"Hello there." isHTML:NO]; 
    if (controller) [self presentModalViewController:controller animated:YES];
    [controller release];
	
}
-(IBAction)direction:(id)sender{
    MapWithRoutesViewController *objmapview;

    objmapview =[[MapWithRoutesViewController alloc]initWithNibName:@"MapWithRoutesViewController" bundle:nil];

    appDelegateObj.strfromlatuser=[latArray objectAtIndex:0];
    
    appDelegateObj.strfromlonguser=[longArray objectAtIndex:0];
    
    

    appDelegateObj.strtolatuser=appDelegateObj.latitude;
    
    
    appDelegateObj.strtolonguser=appDelegateObj.longitude;

    
    
    [self.navigationController  pushViewController:objmapview animated:YES];
    
}

-(void)directionForMeeting:(int)sender{
    MapWithRoutesViewController *objmapview;
    
    objmapview =[[MapWithRoutesViewController alloc]initWithNibName:@"MapWithRoutesViewController" bundle:nil];
    
    //UIButton *btn = (UIButton *)sender;
    
    appDelegateObj.strfromlatuser = [[CatFinalArray valueForKey:@"latitude"] objectAtIndex:sender];
    
    appDelegateObj.strfromlonguser = [[CatFinalArray valueForKey:@"longitude"] objectAtIndex:sender] ;
    
    
    
    appDelegateObj.strtolatuser=appDelegateObj.latitude;
    
    
    appDelegateObj.strtolonguser=appDelegateObj.longitude;
    
    
    
    [self.navigationController  pushViewController:objmapview animated:YES];
    
}


-(IBAction)message:(id)sender{

	MFMessageComposeViewController *controller = [[[MFMessageComposeViewController alloc] init] autorelease];
	if([MFMessageComposeViewController canSendText])
	{
		controller.body = @"Hello from Mugunth";
		controller.recipients = [NSArray arrayWithObjects:appDelegateObj.phnStr, nil];
		controller.messageComposeDelegate = self;
		[self presentModalViewController:controller animated:YES];
	}
;
	
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
   
    switch (result)
    {
        case MessageComposeResultCancelled:
            NSLog(@"Result: canceled");
            break;
        case MessageComposeResultSent:
            NSLog(@"Result: sent");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Result: failed");
            break;
        default:
            NSLog(@"Result: not sent");
            break;
    }
    
    [self dismissModalViewControllerAnimated:YES];
    
}
- (void)mailComposeController:(MFMailComposeViewController*)controller  
          didFinishWithResult:(MFMailComposeResult)result 
                        error:(NSError*)error;
{
	if (result == MFMailComposeResultSent) {
		//nslog(@"It's away!");
	}
	[self dismissModalViewControllerAnimated:YES];
}



-(void)loadOurAnnotations
{
 CLLocationCoordinate2D workingCoordinate;
 
    
    for (int i=0; i<[latArray count]; i++) {
        workingCoordinate.latitude = [[latArray objectAtIndex:i] floatValue];
        workingCoordinate.longitude = [[longArray objectAtIndex:i] floatValue];
       
//		CLLocationCoordinate2D newCoord = {workingCoordinate.latitude, workingCoordinate.longitude};
		//DisplayMap *ann = [[DisplayMap alloc] init]; 
//		
//		ann.title = @" Kolkata";
//		ann.subtitle = @"Mahatma Gandhi Road"; 
//		ann.coordinate = newCoord; 
//		[mapView addAnnotation:ann];
		
		
//		iCodeBlogAnnotation *appleStore4 = [[iCodeBlogAnnotation alloc] initWithCoordinate:workingCoordinate];
        
        // [appleStore2 setTitle:@"Apple Store St. Regent"];
        // [appleStore2 setSubtitle:@"London England"];
        
        //[appleStore4 setAnnotationType:iCodeBlogAnnotationTypeEDU];
        
       // [appleStore4 setAnnotationType:[[annTypeArray objectAtIndex:i] intValue]];
        
        // [self showView];
        
//        NSLog(@"%@",nameArray);
//        NSLog(@"%@",[nameArray objectAtIndex:i]);
        
        DisplayMap *ann = [[DisplayMap alloc] init]; 
        // [mapView removeAnnotations:ann];
        ann.coordinate = workingCoordinate;

        
               
        if (i<latCnt) {
                   
            ann.title = [nameArray objectAtIndex:i];
        }
        else
        {
           

//            [self getAddress:[NSString stringWithFormat:@"%f",workingCoordinate.latitude] :[NSString stringWithFormat:@"%f",workingCoordinate.longitude]];
            
           ann.title = [UserAddress objectAtIndex:i];
            
            
//            ann.title = [AddArray objectAtIndex:AddCount];
//            AddCount++;
            
        }
      //  ann.subtitle = @"Mahatma Gandhi Road"; 
       
        
       
        [mapView addAnnotation:ann];
        ann=nil;
        [ann release];

        
        
//        [mapView addAnnotation:appleStore4];
    }
    
    
//    workingCoordinate.latitude = 32.44;
//    workingCoordinate.longitude = 90.17;
//    iCodeBlogAnnotation *appleStore4 = [[iCodeBlogAnnotation alloc] initWithCoordinate:workingCoordinate];
//    // [appleStore2 setTitle:@"Apple Store St. Regent"];
//    // [appleStore2 setSubtitle:@"London England"];
//    [appleStore4 setAnnotationType:iCodeBlogAnnotationTypeApple];
//    
//    // [self showView];
//    [mapView addAnnotation:appleStore4];
//    
//    
//    workingCoordinate.latitude = 39.83;
//    workingCoordinate.longitude = 89.64;
//    iCodeBlogAnnotation *appleStore3 = [[iCodeBlogAnnotation alloc] initWithCoordinate:workingCoordinate];
//    // [appleStore2 setTitle:@"Apple Store St. Regent"];
//    // [appleStore2 setSubtitle:@"London England"];
//    [appleStore3 setAnnotationType:iCodeBlogAnnotationTypeApple];
//    
//    // [self showView];
//    [mapView addAnnotation:appleStore3];
//    
//    
//    
//    
//    
//    
// workingCoordinate.latitude = 51.514298;
// workingCoordinate.longitude = -0.141949;
// iCodeBlogAnnotation *appleStore2 = [[iCodeBlogAnnotation alloc] initWithCoordinate:workingCoordinate];
//// [appleStore2 setTitle:@"Apple Store St. Regent"];
//// [appleStore2 setSubtitle:@"London England"];
// [appleStore2 setAnnotationType:iCodeBlogAnnotationTypeApple];
// 
//   // [self showView];
// [mapView addAnnotation:appleStore2];
    
    //[self PassData];
   /* 
    workingCoordinate.latitude = 41.7912645013;
    workingCoordinate.longitude = -87.5811598203;
    iCodeBlogAnnotation *appleStore1 = [[iCodeBlogAnnotation alloc] initWithCoordinate:workingCoordinate];
    // [appleStore1 setTitle:@"Apple Store 5th Ave."];
    // [appleStore1 setSubtitle:@"Apple's Flagship Store"];
    [appleStore1 setAnnotationType:iCodeBlogAnnotationTypeEDU];
    
    //[self showView];
    [mapView addAnnotation:appleStore1];

    */
}


//- (MKAnnotationView *)mapView:(MKMapView *)mapViewLocal viewForAnnotation:(id <MKAnnotation>)annotation {
//	MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapViewLocal dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
//	if(pinView == nil) {
//        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Pin"];
//        pinView.pinColor = MKPinAnnotationColorPurple;
//        pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//        pinView.animatesDrop = YES;
//        pinView.canShowCallout = YES;
//	} else {
//        pinView.annotation = annotation;
//	}
//	return pinView;
//	
//}
 /*
- (iCodeBlogAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
 iCodeBlogAnnotationView *annotationView = nil;
    
 // determine the type of annotation, and produce the correct type of annotation view for it.
 iCodeBlogAnnotation* myAnnotation = (iCodeBlogAnnotation *)annotation;
 
 if(myAnnotation.annotationType == iCodeBlogAnnotationTypeApple)
 {
 NSString* identifier = @"Apple";
 iCodeBlogAnnotationView *newAnnotationView = (iCodeBlogAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
 
 if(nil == newAnnotationView)
 {
 newAnnotationView = [[[iCodeBlogAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
 }
 
 annotationView = newAnnotationView;
 }
 else if(myAnnotation.annotationType == iCodeBlogAnnotationTypeEDU)
 {
 NSString* identifier = @"School";
 
 iCodeBlogAnnotationView *newAnnotationView = (iCodeBlogAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
 
 if(nil == newAnnotationView)
 {
 newAnnotationView = [[[iCodeBlogAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
 }
 
 annotationView = newAnnotationView;
 }
 else if(myAnnotation.annotationType == iCodeBlogAnnotationTypeTaco)
 {
 NSString* identifier = @"Taco";
 
 iCodeBlogAnnotationView *newAnnotationView = (iCodeBlogAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
 
 if(nil == newAnnotationView)
 {
 newAnnotationView = [[[iCodeBlogAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
 }
 
 annotationView = newAnnotationView;
 }
 
 [annotationView setEnabled:YES];
 [annotationView setCanShowCallout:YES];
  [annotationView setParentObj:self];
 return annotationView;
}

*/

//-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
//{
//    
//    
//    
//    [self directionForMeeting];    
////    REVClusterPin *sle=view.annotation;
////    appdel.appdelStrID=sle.pinid;
////    NSLog(@"did select%@",sle.pinid);
//    
//    
//    // objappdel.strscienceaddname=sle.title;
//    
//}
//

-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:
(id <MKAnnotation>)annotation {
    
    
    titleArray = [[NSMutableArray alloc] init];
    tempmyarr = [[NSMutableArray alloc] init];
    
    
    NSLog(@"%@",latArray);
    
   
    
   MKPinAnnotationView *pinView = nil; 
    
  	
	if(annotation != mapView.userLocation) 
	{
		static NSString *defaultPinID = @"com.invasivecode.pin";
		pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        
       
        
//        [pinView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
//        [pinView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        
		if ( pinView == nil )
            pinView = [[[MKPinAnnotationView alloc]
                        initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];
        
        NSString *pintitle=[NSString stringWithFormat:@"%@",((MKPinAnnotationView*) pinView).annotation.title];
        NSLog(@"pin title %@ & tag %d",pintitle,tag);
        
        
        if (![titleArray containsObject:pintitle])
        {
            [titleArray addObject:pintitle];
            
            for (int m=0; m<[latArray count]; m++) {
                
                NSMutableDictionary *tempDic = [[NSMutableDictionary alloc] init];
                
                if (m<latCnt) {
                               
              if ([pintitle isEqualToString:[nameArray objectAtIndex:m]])   
              {
                   CatDic = [[NSMutableDictionary alloc] init];
                  [CatDic setObject:@"user" forKey:@"category"];
                  
                  NSLog(@"%@",nameArray);
                  if (![[nameArray objectAtIndex:m] isEqualToString:@""]) {
                       [CatDic setObject:[nameArray objectAtIndex:m] forKey:@"name"];
                  }
                  NSLog(@"%@",latArray);
                  if (![[latArray objectAtIndex:m] isEqualToString:@""]) {
                      [tempDic setObject:[latArray objectAtIndex:m] forKey:@"latitude"];
                      [CatDic setObject:[latArray objectAtIndex:m] forKey:@"latitude"];
                  }
                  NSLog(@"%@",longArray);
                  if (![[longArray objectAtIndex:m] isEqualToString:@""]) {
                       [tempDic setObject:[longArray objectAtIndex:m] forKey:@"longitude"];
                      [CatDic setObject:[longArray objectAtIndex:m] forKey:@"longitude"];
                  }
                  NSLog(@"%@",contactnum);
                  if (![[contactnum objectAtIndex:m] isEqualToString:@""]) {
                     [CatDic setObject:[contactnum objectAtIndex:m] forKey:@"CNumber"];
                  }
                  NSLog(@"%@",contactemail);
                  if (![[contactemail objectAtIndex:m] isEqualToString:@""]) {
                     [CatDic setObject:[contactemail objectAtIndex:m] forKey:@"Email"];
                  }
                  NSLog(@"%@",Lnamearray);
                  if (![[Lnamearray objectAtIndex:m] isEqualToString:@""]) {
                      [CatDic setObject:[Lnamearray objectAtIndex:m] forKey:@"Lname"];
                  }
                  NSLog(@"%@",bdateArray);
                  if (![[bdateArray objectAtIndex:m] isEqualToString:@""]) {
                      [CatDic setObject:[bdateArray objectAtIndex:m] forKey:@"Bdate"];
                  }
                  
                  NSLog(@"%@",UserAddress);
                  if (![[UserAddress objectAtIndex:m] isEqualToString:@""]) {
                      [CatDic setObject:[UserAddress objectAtIndex:m] forKey:@"UAddress"];
                  }
                  NSLog(@"%@",appDelegateObj.ImgArray);
//                  if (![appDelegateObj.ImgArray objectAtIndex:m]) {
                      [CatDic setObject:[appDelegateObj.ImgArray objectAtIndex:m] forKey:@"Image"];
//                  }
                  
                  
                  [CatFinalArray addObject:CatDic];
                  CatDic = nil;
                  [CatDic release];

                  
                  [pinArray addObject:tempDic];
                  tempDic = nil;
                  [tempDic release];
                  
                  UIButton *disclosureButton = [UIButton buttonWithType:UIButtonTypeCustom];
                  [disclosureButton setFrame:CGRectMake(25, 25, 50, 30)];
                  [disclosureButton setImage:[UIImage imageNamed:@"annarrow.png"] forState:UIControlStateNormal];
                  //NSLog(@"%d",appDelegateObj.count);
                  [disclosureButton setTag:tag];
                  tag++;
                  
                 
                      [disclosureButton addTarget:self action:@selector(showView:) forControlEvents:UIControlEventTouchUpInside];
                            
//                  
//                  
                   
                 
                  
                  pinView.rightCalloutAccessoryView = disclosureButton;
                  if (m == 0) {
                      pinView.pinColor = MKPinAnnotationColorPurple; 

                      
                  }
                  else
                  {
                  pinView.pinColor = MKPinAnnotationColorRed; 
                    
                  }
                  pinView.canShowCallout = YES;

             }
            }
                else
                {
                    
                    
                    for(NSString* temp_str in AddArray) 
                    {     
                    
                        if ([pintitle isEqualToString:temp_str])   
                        {
                            if (![tempmyarr containsObject:temp_str]) {
                                
                                [tempmyarr addObject:temp_str];
                            
                        
                        
                            CatDic2 = [[NSMutableDictionary alloc] init];
                            [CatDic2 setObject:@"meeting" forKey:@"category"];
                            [meetingLatArray addObject:[latArray objectAtIndex:Met]];
                            [CatDic2 setObject:[latArray objectAtIndex:Met] forKey:@"latitude"];
                            [meetingLongArray addObject:[longArray objectAtIndex:Met]];
                            [CatDic2 setObject:[longArray objectAtIndex:Met] forKey:@"longitude"];
                            [CatDic2 setObject:[startDateTime objectAtIndex:Met] forKey:@"StartDt"];
                            [CatDic2 setObject:[EndDateTime objectAtIndex:Met] forKey:@"EndDt"];
                                [CatDic2 setObject:[MeetingUId objectAtIndex:Met] forKey:@"MetUid"];
                                [CatDic2 setObject:[GmMeetId objectAtIndex:Met] forKey:@"GmMetId"];
                                NSLog(@"%@",startDateTime);
                                NSLog(@"%@",EndDateTime);
                               
                                
//                                NSLog(@"%@",UserAddress);
//                                if (![[UserAddress objectAtIndex:m] isEqualToString:@""]) {
//                                    [CatDic2 setObject:[UserAddress objectAtIndex:m] forKey:@"UAddress"];
//                                }

                                NSLog(@"%@",AddArray);
                                if (![[AddArray objectAtIndex:Met] isEqualToString:@""]) {
                                    [CatDic2 setObject:[AddArray objectAtIndex:Met] forKey:@"UAddress"];
                                }
//                                 Met++;
                                
                            [CatFinalArray addObject:CatDic2];
                            CatDic2 = nil;
                            [CatDic2 release];
                    
                                
                 //   UIImageView *imageView;
                    
//                    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Layer1.png"]];
//                    //imageView.frame = CGRectMake(kBorder, kBorder, kWidth - 2 * kBorder, kWidth - 2 * kBorder);
//                      
//                    imageView.frame = CGRectMake(0, 0, 30, 30);
                    
                                                            
                                
                   // [pinView addSubview:imageView];
                                //[pinView bringSubviewToFront:imageView];
                       // [self getAddress:[latArray objectAtIndex:m]:[longArray objectAtIndex:m]];
                    
                        UIButton *disclosureButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
                        [disclosureButton1 setFrame:CGRectMake(25, 25, 50, 30)];
                        [disclosureButton1 setImage:[UIImage imageNamed:@"annarrow.png"] forState:UIControlStateNormal];
                    pinView.rightCalloutAccessoryView = disclosureButton1;
                    
                    
                        //NSLog(@"%d",appDelegateObj.count);
                        [disclosureButton1 setTag:tag];
                        tag++;
                                
                                         
                                
                    pinView.pinColor = MKPinAnnotationColorGreen; 
                                
                                 [pinView setImage:[UIImage imageNamed:@"Layer1.png"]];  
                    
                     [disclosureButton1 addTarget:self action:@selector(showView:) forControlEvents:UIControlEventTouchUpInside];
//                    
                  //  [disclosureButton1 addTarget:self action:@selector(directionForMeeting:) forControlEvents:UIControlEventTouchUpInside];
                    

                        
//                        [disclosureButton1 addTarget:self action:@selector(directionForMeeting) forControlEvents:UIControlEventTouchUpInside];
                     pinView.canShowCallout = YES;
                   }
                    }
                         Met++;
                    }
                   
                }
                Met = 0;
                
        }
        
       	        
		//pinView.animatesDrop = YES;
    } 
    }
	else {
		[mapView.userLocation setTitle:@"I am here"];
	}
   
	return pinView;
    
}

-(void)showView:(int)sender
{
    // [userProfileVw setFrame:CGRectMake(0,314, 320, 100)];
    
    
    
    NSLog(@"%@",titleArray);
    
    UIButton *btn = (UIButton*)sender;
    
    NSLog(@"%d",btn.tag);
    
    if ([[[CatFinalArray objectAtIndex:btn.tag] valueForKey:@"category"] isEqualToString:@"user"]) {
        [userProfileVw setHidden:NO];
        
        [MeetBtn setHidden:NO];
        [imageViewPro setHidden:NO];
        [callBtn setHidden:NO];
        [mailBtn setHidden:NO];
        [msgBtn setHidden:NO];
        [removeMet setHidden:YES];
        
        [self.view sendSubviewToBack:mapView];
        
        //    LblEmail.text = [contactemail objectAtIndex:sender];
        //    LblPhone.text = [contactnum objectAtIndex:sender];
        
        //  NSLog(@"%i",btn.tag);
        
        //NSLog(@"%@",[pinArray objectAtIndex:btn.tag]);
        [MeetingAdd setHidden:YES];
        [MeetingTime setHidden:YES];
         [LblName setHidden:NO];
        [LblAdd setHidden:NO];
        NSMutableDictionary *dict;
        dict = [[CatFinalArray objectAtIndex:btn.tag] copy];
        LblName.text = [dict valueForKey:@"name"];
        appDelegateObj.latitude=[dict valueForKey:@"latitude"];
        appDelegateObj.longitude=[dict valueForKey:@"longitude"];
        //  [profImg setImage:[dict valueForKey:@"Image"]];
        
        [self setLoadImageg:[dict valueForKey:@"Image"]];   
        
        appDelegateObj.userProfImg = imageViewPro.image;
        // imageViewPro.imageURL = [NSURL URLWithString::[dict valueForKey:@"Image"]];
        // appDelegateObj.AddStr = Address;
        //  NSLog(@"%@",Address);
          LblAdd.text = [dict valueForKey:@"UAddress"];
        appDelegateObj.emailStr = [dict valueForKey:@"Email"];
        appDelegateObj.phnStr = [dict valueForKey:@"CNumber"];
        appDelegateObj.NameStr = LblName.text;
        appDelegateObj.bdateStr = [dict valueForKey:@"Bdate"];
        
        appDelegateObj.lname = [dict valueForKey:@"Lname"];
        NSLog(@"%@",appDelegateObj.emailStr);
        NSLog(@"%@",appDelegateObj.phnStr);
    }else
    {
        
        [directBtn setFrame:CGRectMake(275, 50, 40, 42)];
         [removeMet setHidden:NO];
        [MeetBtn setHidden:YES];
        [imageViewPro setHidden:YES];
        [callBtn setHidden:YES];
        [mailBtn setHidden:YES];
        [msgBtn setHidden:YES];
        
        [MeetingAdd setHidden:NO];
        [MeetingTime setHidden:NO];
        [userProfileVw setHidden:NO];
        [self.view sendSubviewToBack:mapView];
        
        NSMutableDictionary *dict;
        dict = [[CatFinalArray objectAtIndex:btn.tag] copy];
       
        appDelegateObj.latitude=[dict valueForKey:@"latitude"];
        appDelegateObj.longitude=[dict valueForKey:@"longitude"];
        MeetingAdd.text = [dict valueForKey:@"UAddress"];
        
        MeetingTime.text = [NSString stringWithFormat:@"%@ to %@",[dict valueForKey:@"StartDt"],[dict valueForKey:@"EndDt"]];
        
        meetUid = [[dict valueForKey:@"MetUid"] intValue];
        meetId = [[dict valueForKey:@"GmMetId"] intValue];
        [LblName setHidden:YES];
        [LblAdd setHidden:YES];
        
       // [self directionForMeeting:btn.tag];
    }
    
}




//NSString *pintitle=[NSString stringWithFormat:@"%@",((MKPinAnnotationView*) pinView).annotation.title];
//
//
//
//if (![arr_temp containsObject:pintitle])
//{
//    [arr_temp addObject:pintitle];
//    
//    for (int i = 0; i<[final_arr count]; i++) {
//        if ([pintitle isEqualToString:[[final_arr  objectAtIndex:i]valueForKey:@"city"]])
//        {
//            [final_arr_add addObject:[final_arr objectAtIndex:i]];
//            
//            UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeCustom];
//            [infoButton setFrame:CGRectMake(pinView.bounds.size.width-35,10,25, 27)];
//            [infoButton setImage:[UIImage imageNamed:@"DDOrange.png"] forState:UIControlStateNormal];
//            pinView.rightCalloutAccessoryView = infoButton;
//            infoButton.tag = g;
//            g++;
//            [infoButton addTarget:self action:@selector(ButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//        }
//    }                
//    
//    
//    
//}

// Customize the number of rows in the table view.

// Customize the appearance of table view cells.





-(void)setMapViewPoint
{
	for(int j=0;j<cnt;j++)
	{
        [mapView setMapType:MKMapTypeStandard];
        [mapView setZoomEnabled:YES];
        [mapView setScrollEnabled:YES];
        MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
        
        
        region.center.latitude = [[latArray objectAtIndex:j]floatValue];
        
        region.center.longitude = [[longArray objectAtIndex:j]floatValue];
        region.span.longitudeDelta =2.10f;
        region.span.latitudeDelta =2.10f;
        [mapView setRegion:region animated:YES]; 
        
        [mapView setDelegate:self];
        
        // (0,357,320,100)
        
   //    profImgBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //   [profImgBtn setImage:[UIImage imageNamed:[ImgArray objectAtIndex:j]] forState:UIControlStateNormal];
//        profImgBtn.frame = CGRectMake(10, 15, 25, 25);
////        
//        [profImgBtn addTarget:self action:@selector(showView) forControlEvents:UIControlEventTouchUpInside];

        
        DisplayMap *ann = [[DisplayMap alloc] init]; 
        
        //ann.title = @" Steve Vai";
        //ann.subtitle = @"Mahatma Gandhi Road"; 
        ann.coordinate = region.center; 
        [mapView addAnnotation:ann];
		
	}
	
	
}

-(IBAction)setmeeting
{
    
    appDelegateObj.selectedFrnd = [NSString stringWithFormat:@""];
    meetingpointview *obj = [[meetingpointview alloc]init];
    [self.navigationController pushViewController:obj animated:YES];
    
//    listVwObj = [[listwhoglued alloc] initWithNibName:@"listwhoglued" bundle:nil];
//    [self.navigationController pushViewController:listVwObj animated:NO];
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [webData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
//    [self hideHUD];
  //  [customealert showAlert:@"Error" message:@"Error while setting connection." delegate:self];
    NSLog(@"ERROR with theConenction");
    [connection release];
    [webData release];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    
    
    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(@"xml : %@",theXML);
    
    NSString *list = theXML;
    NSArray *listItems = [list componentsSeparatedByString:@","];
   
    NSString *str2 = [listItems objectAtIndex:4];
    NSString *str1  = [listItems objectAtIndex:3];
    
    Address = [NSString stringWithFormat:@"%@, %@.",str1,str2];
    NSLog(@"%@",Address);
     
        
    if (c>=latCnt) {
        [AddArray addObject:Address];
        [UserAddress addObject:Address];
    }
    else
    {
        [UserAddress addObject:Address];
    }
     c++;  
   
    if (c == [latArray count]) {
        [self loadOurAnnotations];
    }
    
}

-(void)getAddress:(NSString *)Lat:(NSString*)Long
{
    
   /* NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@,%@&output=json&sensor=false",Lat,Long];
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(AddressFatch:) andHandler:self];
*/
    NSString *URL = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@,%@&output=csv&sensor=false",Lat,Long];
    NSLog(@"%@",URL);
    NSURLRequest *rq = [NSURLRequest requestWithURL:[NSURL URLWithString:URL]];
    conn1 = [[NSURLConnection alloc] initWithRequest:rq delegate:self];
    webData = [[NSMutableData data] retain];
    
  
  //  
}

-(void)AddressFatch:(NSDictionary*)dictionary{
    
    NSLog(@"%@",dictionary);
    
    NSMutableArray *tempArray = [[dictionary objectForKey:@"Placemark"] copy];
    
    NSLog(@"%@",tempArray);
    
    NSMutableDictionary *tempDic = [[tempArray objectAtIndex:0] copy];
    
//    Address = [[tempDic valueForKey:@"address"] copy];
//    NSLog(@"%@",Address);
    
    NSMutableDictionary *temp1;
    temp1 =[[tempDic valueForKey:@"AddressDetails"] copy];
    NSLog(@"%@",temp1);
    
    NSMutableDictionary *Dict;
    Dict = [[temp1 valueForKey:@"Country"] copy];
    NSLog(@"%@",Dict);
    
    NSMutableDictionary *Dict1;
    Dict1 = [[Dict objectForKey:@"AdministrativeArea"] copy];
    
    
    NSString *str2 = [[Dict1 objectForKey:@"AdministrativeAreaName"] copy];
    
    NSMutableDictionary *Dict2;
    Dict2 = [[Dict1 objectForKey:@"Locality"] copy];
    NSString *str1 =[[Dict2 objectForKey:@"LocalityName"]copy]; 
    
    Address = [NSString stringWithFormat:@"%@ %@",str1,str2];
    
    NSLog(@"%@",Address);
    
    [AddArray addObject:Address];
    
    
}

-(void)setLoadImageg:(NSString*)loadimage
{    
    imageViewPro.imageURL = [NSURL URLWithString:loadimage];
    
}

-(IBAction)onFAQ:(id)sender
{
	FAQHelp *faqhelp=[[FAQHelp alloc]initWithNibName:@"FAQHelp" bundle:nil];
	[self.navigationController pushViewController:faqhelp animated:YES];
	[faqhelp release];
}

-(void)displayMyMap
{
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
  //  span.latitudeDelta = 02.569722 ;
   // span.longitudeDelta = 08.369722;
    
//    NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@&output=csv",
//                           [addressField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    CLLocationCoordinate2D location ;  
    
	//location.latitude = 22.569722 ;
	//location.longitude = 88.369722;
    
    region.span = span;
    region.center = location;
    
    [mapView setRegion:region animated:TRUE];  
    [mapView regionThatFits:region];  
}


-(IBAction)ClickClose
{
    //[userProfileVw setFrame:CGRectMake(0, 470, 320, 100)];
    [userProfileVw setHidden:YES];
}

-(IBAction)ClickNext
{
    
    profileclassObj = [[profileClass alloc]initWithNibName:@"profileClass" bundle:nil];
    [self.navigationController pushViewController:profileclassObj animated:YES];
    
    
}

/*

-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:
(id <MKAnnotation>)annotation {
	
    MKPinAnnotationView *pinView = nil; 
	if(annotation != mapView.userLocation) 
	{
		static NSString *defaultPinID = @"com.invasivecode.pin";
		pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
		if ( pinView == nil )
            pinView = [[[MKPinAnnotationView alloc]
                        initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];
        
       // UIButton *disclosureButton = [UIButton buttonWithType:UIButtonTypeCustom];
//		[disclosureButton setFrame:CGRectMake(0, 0, 20,26)];
//		[disclosureButton setImage:[UIImage imageNamed:@"next2.jpg"] forState:UIControlStateNormal];
//        [disclosureButton addTarget:self action:@selector(showView) forControlEvents:UIControlEventTouchUpInside];
		//pinView.rightCalloutAccessoryView= disclosureButton;
        
        
        NSString *pintitle=[NSString stringWithFormat:@"%@",((MKPinAnnotationView*) pinView).annotation.title];
        NSLog(@"%@",pintitle);
        //        for (int i = 0; i<[appdel.arrList count]; i++)
        //        {
        //            d = (NSMutableDictionary*)[appdel.arrList objectAtIndex:i];
        //            strAddress = [NSString stringWithFormat:@"%@",[d valueForKey:@"title"]];
        //            if([strAddress isEqualToString:pintitle]) 
        //            {
        //                //annot = object;
        //                d = [appdel.arrList objectAtIndex:i];
        //                UIImageView *imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 30)];
        //                imgURL= [[NSURL    alloc] initWithString:[d objectForKey:@"mainimage"]]; 
        //                imageview.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imgURL]];
        //                annView.leftCalloutAccessoryView =imageview;
        //                
        //                appdel.appdelStrID = [d objectForKey:@"id"];
        //                
        //                [imageview release];
        //                break;
        //            }
        //        }
        
        
		pinView.pinColor = MKPinAnnotationColorRed; 
        [pinView setImage:[UIImage imageNamed:@"Shape1.png"]];
        [pinView setFrame:CGRectMake(0, 0, 74, 68)];
    
//        for (int i = 0; i<cnt; i++) {
            profImgBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [profImgBtn setImage:[UIImage imageNamed:@"p3.png"] forState:UIControlStateNormal];
            profImgBtn.frame = CGRectMake(10, 7, 55, 38);
            
            [profImgBtn addTarget:self action:@selector(showView) forControlEvents:UIControlEventTouchUpInside];
            
            
            [pinView addSubview:profImgBtn];
//        }
        
		pinView.canShowCallout = YES;
        
		//pinView.animatesDrop = YES;
    } 
	else {
		[mapView.userLocation setTitle:@"I am here"];
	}
	return pinView;

    
}
*/
/*
- (iCodeBlogAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
	iCodeBlogAnnotationView *annotationView = nil;
	
	// determine the type of annotation, and produce the correct type of annotation view for it.
	iCodeBlogAnnotation* myAnnotation = (iCodeBlogAnnotation *)annotation;
	
	if(myAnnotation.annotationType == iCodeBlogAnnotationTypeApple)
	{
		NSString* identifier = @"Apple";
		iCodeBlogAnnotationView *newAnnotationView = (iCodeBlogAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[iCodeBlogAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == iCodeBlogAnnotationTypeEDU)
	{
		NSString* identifier = @"School";
		
		iCodeBlogAnnotationView *newAnnotationView = (iCodeBlogAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[iCodeBlogAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == iCodeBlogAnnotationTypeTaco)
	{
		NSString* identifier = @"Taco";
		
		iCodeBlogAnnotationView *newAnnotationView = (iCodeBlogAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[iCodeBlogAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		
		annotationView = newAnnotationView;
	}
	
	[annotationView setEnabled:YES];
	[annotationView setCanShowCallout:YES];
	
	return annotationView;
}

*/
#pragma mark -

+ (CGFloat)annotationPadding;
{
    return 10.0f;
}
+ (CGFloat)calloutHeight;
{
    return 40.0f;
}

//- (void)gotoLocation
//{
//    // start off by default in San Francisco
//    MKCoordinateRegion newRegion;
//   
//    newRegion.center.latitude = 37.786996;
//   newRegion.center.longitude = -122.440100;
//    newRegion.span.latitudeDelta = 0.112872;
//    newRegion.span.longitudeDelta = 0.109863;
//	
//    [self.mapView setRegion:newRegion animated:YES];
//}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(IBAction)btnwhoglued_clicked
{
    
    appDelegateObj.selectedFrnd = @"";
    appDelegateObj.selectedFrnd = [NSString stringWithFormat:@"%@",appDelegateObj.NameStr];
    appDelegateObj.stremailselect0 = [NSString stringWithFormat:@"%@",appDelegateObj.emailStr];
    
    meetingpointview *obj = [[meetingpointview alloc]init];
	[self.navigationController pushViewController:obj animated:YES];
    
//	listwhoglued *obj = [[listwhoglued alloc]init];
//	
//	[self.navigationController pushViewController:obj animated:YES];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [dic release];
    [latArray release];
    [longArray release];
    [mapView release];
    [super dealloc];
}


@end
