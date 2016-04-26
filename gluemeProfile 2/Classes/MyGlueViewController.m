//
//  MyGlueViewController.m
//  glueme
//
//  Created by OPENXCELL TECHNOLABS on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyGlueViewController.h"
#import "SettingViewController.h"
#import "whogluedmap.h"
#import "FAQHelp.h"
#import "myprofile.h"
#import "meetingpointview.h"

@implementation MyGlueViewController
@synthesize minerequestObj;


-(IBAction)GoToMyRequest
{
    minerequestObj = [[MineRequest alloc] initWithNibName:@"MineRequest" bundle:nil];
    [self.navigationController pushViewController:minerequestObj animated:YES];
    
}
-(IBAction)onMap:(id)sender{
	
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
    GlueAppDelegateObj.count = 0;

    [self.navigationController pushViewController:mymapObj animated:NO];
    
  //  whoGlueObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
		//whogluedmap	*gluemap=[[whogluedmap alloc]initWithNibName:@"whogluedmap" bundle:nil];
	//[self.navigationController pushViewController:whoGlueObj animated:YES];
	//[gluemap release];
	
	
}

-(IBAction)setmeeting
{
    
    GlueAppDelegateObj.selectedFrnd = [NSString stringWithFormat:@""];
    meetingpointview *obj = [[meetingpointview alloc]init];
    [self.navigationController pushViewController:obj animated:YES];
    
//    listVwObj = [[listwhoglued alloc] initWithNibName:@"listwhoglued" bundle:nil];
//    [self.navigationController pushViewController:listVwObj animated:NO];
}




-(IBAction)onSettings:(id)sender{
	
        
	SettingViewController *settingViewController=[[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil];
	[self.navigationController pushViewController:settingViewController animated:YES];
	[settingViewController release];
}
-(IBAction)GoToMyHistory
{
    myhistoryObj = [[MyHistory alloc] initWithNibName:@"MyHistory" bundle:nil];
    [self.navigationController pushViewController:myhistoryObj animated:YES];
}

-(IBAction)onProfile:(id)sender
{
	
	myprofile *obj = [[myprofile alloc]initWithNibName:@"myprofile" bundle:nil];
	
	[self.navigationController pushViewController:obj animated:YES];
	
}

-(IBAction)GoToMyContacts
{
    mycontactScreenObj = [[MyContactScreen alloc] initWithNibName:@"MyContactScreen" bundle:nil];
    [self.navigationController pushViewController:mycontactScreenObj animated:YES];
}

-(IBAction)LogOutClick
{
    GlueAppDelegateObj.islogin = FALSE;
    loginObj = [[login alloc] initWithNibName:@"login" bundle:nil];
    [self presentModalViewController:loginObj animated:NO];    
    NSString *LoginID;
	
	LoginID = [[NSUserDefaults standardUserDefaults] valueForKey:@"Login"];
    
	// [self.navigationController popToRootViewControllerAnimated:YES];
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/logout.php?user_id=%@",LoginID];
    
    
    
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];
}
 -(void)datafatch:(NSDictionary*)dictionary{
        
        NSString *error;
        
        error = [[NSString alloc] initWithFormat:@"%@",[dictionary valueForKey:@"msg"]];
     NSLog(@"%@",error);
	 [UIApplication sharedApplication].applicationIconBadgeNumber = 0 ;
     
 }
-(void)viewWillAppear:(BOOL)animated
{
    if (GlueAppDelegateObj.isthemechanged) {
      
//    self.navigationController.navigationBar.alpha = 0.0;
//    
//    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
//    UIImageView *topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
    
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
        [topbarImg setImage:[UIImage imageNamed:@"GreyTopBar1.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"PurpleTopBar1.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"OrangeTopBar1.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"BlackTopBar1.png"]];
    }
    else
    {
        [topbarImg setImage:[UIImage imageNamed:@"FirstTopBar.png"]];
    }
//    [self.view addSubview:topbarImg];
//    [self.navigationController.navigationBar sendSubviewToBack:topbarImg];
//    
//    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    BumpBtn.frame = CGRectMake(268,10, 35, 34);
//    
//    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:BumpBtn]; 

    }
    
	[super viewWillAppear:animated];
    if (!GlueAppDelegateObj.islogin) {
        self.tabBarController.selectedIndex = 0;
        GlueAppDelegateObj.islogin = TRUE;
        return;
    }
    
    locationManager = [[CLLocationManager alloc]init];
	if([CLLocationManager locationServicesEnabled])
	{
		locationManager = [[CLLocationManager alloc] init];
		locationManager.desiredAccuracy = kCLLocationAccuracyBest;
		locationManager.delegate = self;
		//locationManager.location.coordinate.latitude;
		[locationManager startUpdatingLocation];
		
		//	appDelegateObj.latitude= [[NSString alloc]initWithFormat:@"%g",locationManager.];
		//appDelegateObj.longitude = [[NSString alloc]initWithFormat:@"%g",locationManager.longitude];
		//		
		
	}

    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	//NSLog(@"Accuracy [%f]",newLocation.horizontalAccuracy);
	
    CLLocationCoordinate2D location;  
	
	location.latitude = newLocation.coordinate.latitude ;
	location.longitude = newLocation.coordinate.longitude;
    
	
	GlueAppDelegateObj.latitude= [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.latitude];
	GlueAppDelegateObj.longitude = [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.longitude];
	
	NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/update_lat_lon.php?uid=%d&lat=%@&lon=%@",GlueAppDelegateObj.userID,GlueAppDelegateObj.latitude,GlueAppDelegateObj.longitude];
    
    //  NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
	JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatchupdate:) andHandler:self];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Location manager FAIL");
}

-(void)datafatchupdate:(NSDictionary*)dictionary{
	
}



-(IBAction)onFAQ:(id)sender
{
	FAQHelp *faqhelp=[[FAQHelp alloc]initWithNibName:@"FAQHelp" bundle:nil];
	[self.navigationController pushViewController:faqhelp animated:YES];
	[faqhelp release];
}

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
    
    self.navigationController.navigationBar.alpha = 0.0;
    
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
    topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
    
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
        [topbarImg setImage:[UIImage imageNamed:@"GreyTopBar1.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"PurpleTopBar1.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"OrangeTopBar1.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"BlackTopBar1.png"]];
    }
    else
    {
        [topbarImg setImage:[UIImage imageNamed:@"FirstTopBar.png"]];
    }
    [self.view addSubview:topbarImg];
    [self.navigationController.navigationBar sendSubviewToBack:topbarImg];
    
    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    BumpBtn.frame = CGRectMake(268,10, 35, 34);
    
    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:BumpBtn]; 

    
    [super viewDidLoad];
    GlueAppDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication] delegate];
    [super viewDidLoad];

  //self.navigationItem.backBarButtonItem.title = @"Back";
}

-(void)Bump
{
    NSLog(@"BumpClicked");
    bumpObj = [[Bump alloc] initWithNibName:@"Bump" bundle:nil];
    [self.navigationController pushViewController:bumpObj animated:YES];
    
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
    [super dealloc];
}


@end
