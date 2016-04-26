//
//  login.m
//  glueme
//
//  Created by apple on 9/19/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import "login.h"
#import "mytabbar.h"
#import "AlertHandler.h"
#import "GdataParser.h"
#import "FAQHelp.h"
#import "userregister.h"

@implementation login
@synthesize tabBar,i,bkgroundImg,strDeviceID;

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
    [super viewDidLoad];
    select=FALSE;
		
    
    
	GlueAppDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication] delegate];
	//self.title = @"Glue Me Login";

    NSString *strremem;
    strremem=[[NSUserDefaults standardUserDefaults]valueForKey:@"Remember"];
    if([strremem isEqualToString:@"Remember"])
    {
        select=TRUE;
        
    [rememberbtn setImage:[UIImage imageNamed:@"selectedPoint.png"] forState:UIControlStateNormal];
    idtext.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"UserName"];
    passwordtext.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"Password"];
    }
    else{
        select=FALSE;
        
        idtext.text=@"";
        passwordtext.text=@"";
        
    }
    self.navigationController.navigationBar.hidden = YES;
    GlueAppDelegateObj.meetingPPlArray =[[NSMutableArray alloc] init];
//    
   /* self.navigationController.navigationBar.alpha = 0.0;
    
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
    UIImageView *topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
    [topbarImg setImage:[UIImage imageNamed:@"loginTitle.png"]];
    
    [self.view addSubview:topbarImg];
    [self.navigationController.navigationBar sendSubviewToBack:topbarImg];*/
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
	  //  idtext.text = @"pinky.rupareliya@gmail.com";
//       passwordtext.text = @"pinky";
 //   
 idtext.text = @"pinky@openxcelltechnolabs.com";
           passwordtext.text = @"pinky123";
    
//    idtext.text = @"hirak@openxcelltechnolabs.com";
//            passwordtext.text = @"hirak";
    
  ////  idtext.text = @"ravi@openxcell.info";
   // passwordtext.text = @"ravi";
    
    //idtext.text = @"ankitpatel@openxcell.info";
     //   passwordtext.text = @"ankit";
    //
   // idtext.text = @"meera@openxcell.info";
     //      passwordtext.text = @"meera";
    
    //idtext.text = @"sam@t.com";      
	//passwordtext.text = @"sam";
    
    
//    if (GlueAppDelegateObj.isthemechanged) {
//        //        self.navigationController.navigationBar.tintColor = [UIColor clearColor];
//        //        topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
//        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
//            [bkgroundImg setImage:[UIImage imageNamed:@"GreyBkGround.png"]];
//        }
//        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
//        {
//            [bkgroundImg setImage:[UIImage imageNamed:@"purpleBkGround.png"]];
//        }
//        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
//        {
//            [bkgroundImg setImage:[UIImage imageNamed:@"OrangeBkGround.png"]];
//        }
//        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
//        {
//            [bkgroundImg setImage:[UIImage imageNamed:@"blackBkGround.png"]];
//        }
//        else
//        {
//            [bkgroundImg setImage:[UIImage imageNamed:@"back.2.png"]];
//        }
//        
//        
//        
//        
//        //        [self.view addSubview:topbarImg];
//        //        
//        //        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        //        backBtn.frame = CGRectMake(5,10, 76, 28);
//        //        
//        //        [backBtn addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
//        //        [self.view addSubview:backBtn];   
//    }

    
    
    
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
	
    GlueAppDelegateObj.objLogin = self;

    if (GlueAppDelegateObj.isregister) {
        //[self PassData];
		[self.view removeFromSuperview];
		CGRect frame = CGRectMake(-2, 0, 480, 180);
		UIView *v = [[UIView alloc] initWithFrame:frame];
//        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
//            	i = [UIImage imageNamed:@"greyBottomBar.png"];
//        }
//        else
//        {
       	i = [UIImage imageNamed:@"purpleBottomBar.png"];
//        }
       	UIColor *c = [[UIColor alloc] initWithPatternImage:i];
		v.backgroundColor = c;
		[c release];
		
		[tabBar.tabBar insertSubview:v atIndex:GlueAppDelegateObj.tabbarIndCnt];
        GlueAppDelegateObj.tabbarIndCnt++;
		[v sendSubviewToBack:tabBar.tabBar];
       	[v release];
		
		tabBar.delegate = self;
		[self.navigationController pushViewController:tabBar animated:YES];
    }
   
    
    [idtext setValue:[UIColor blackColor] 
                    forKeyPath:@"_placeholderLabel.textColor"];
    
    [passwordtext setValue:[UIColor blackColor] 
          forKeyPath:@"_placeholderLabel.textColor"];
    
   
    
//    [self drawPlaceholderInRect:idtext.frame];
    
}

#pragma mark -
#pragma mark CLLocationManagerDelegate
#define MINIMUM_DISTANCE 200

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	//NSLog(@"Accuracy [%f]",newLocation.horizontalAccuracy);
	
	
	
	GlueAppDelegateObj.latitude= [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.latitude];
	GlueAppDelegateObj.longitude = [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.longitude];
	
	NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/update_lat_lon.php?uid=%d&lat=%@&lon=%@",GlueAppDelegateObj.userID,GlueAppDelegateObj.latitude,GlueAppDelegateObj.longitude];
    
  //  NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
	JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatchupdate:) andHandler:self];
//	NSLog(@"from login lat n lon :%@  %@",  GlueAppDelegateObj.latitude,GlueAppDelegateObj.longitude);
	
	//if (currentLocation) {
//		[currentLocation release];
//		currentLocation = nil;
//	}
//	currentLocation = [newLocation retain];
//	
//	if (currentLocation.horizontalAccuracy <= MINIMUM_DISTANCE) {
//		//[self startReverseGeocodingWithCurrentLocation];
//	}
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Location manager FAIL");
}

-(void)datafatchupdate:(NSDictionary*)dictionary{
	
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

//- (void) drawPlaceholderInRect:(CGRect)rect {
//    [[UIColor blueColor] setFill];
//    [[self placeholder] drawInRect:rect withFont:[UIFont systemFontOfSize:16]];
//}


-(IBAction)remembermebtn_clicked:(id)sender
{
    
     
    
    
    
	if(select==FALSE)
    {
        [rememberbtn setImage:[UIImage imageNamed:@"selectedPoint.png"] forState:UIControlStateNormal];
        
        select=TRUE;
        
        [[NSUserDefaults standardUserDefaults] setValue:idtext.text forKey:@"UserName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSUserDefaults standardUserDefaults] setValue:passwordtext.text forKey:@"Password"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSUserDefaults standardUserDefaults] setValue:@"Remember" forKey:@"Remember"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
    }
	else
    {
             
        [rememberbtn setImage:[UIImage imageNamed:@"point.png"] forState:UIControlStateNormal];
        
        [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"UserName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"Password"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSUserDefaults standardUserDefaults] setValue:@"NoRemember" forKey:@"Remember"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        select=FALSE;
        
        
    }
	
}

-(IBAction)onFAQ:(id)sender
{
	FAQHelp *faqhelp=[[FAQHelp alloc]initWithNibName:@"FAQHelp" bundle:nil];
	[self.navigationController pushViewController:faqhelp animated:YES];
	[faqhelp release];
}

-(IBAction)forgetpassbtn_clicked:(id)sender
{
    forgetpassword *passwrd = [[forgetpassword alloc]init];
	[self presentModalViewController:passwrd animated:YES];
	
}



-(IBAction)loginbtn_clicked:(id)sender
{
    
    [idtext resignFirstResponder];
    [passwordtext resignFirstResponder];
    
    if ([idtext.text isEqualToString:@""] || [passwordtext.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Enter Username and Password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    else
    {
    
    [self PassData];
    }
//    if (!GlueAppDelegateObj.islogin) {
//        
//        
//        
//        [self dismissModalViewControllerAnimated:NO];
//        self.tabBar.selectedIndex = 1;
//        //  self.tabBarController.selectedIndex = 0;
//        
//    }
//    else
//    {
//        //[self.view addSubview:tabBar.view];
//        self.navigationController.navigationBar.hidden =YES;
//        
//		//
////		CGRect frame = CGRectMake(-2, 0, 480, 180);
////		UIView *v = [[UIView alloc] initWithFrame:frame];
////		i = [UIImage imageNamed:@"locationnavi.png"];
////		UIColor *c = [[UIColor alloc] initWithPatternImage:i];
////		v.backgroundColor = c;
////		[c release];
////		
////		[tabBar.tabBar insertSubview:v atIndex:0];
////	//	[v sendSubviewToBack:tabBar.tabBar];
////		[v release];
//		
//		tabBar.delegate = self;
      //
  //  [self.navigationController pushViewController:tabBar animated:YES];
//        
//	}
}

-(void)PassData {    
	
    [AlertHandler showAlertForProcess];    
       
//	NSString *RegURL = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/chk_login.php?email=%@&password=%@",idtext.text,passwordtext.text];
    
    NSString *RegURL = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/chk_login.php?email=%@&password=%@&deviceToken=%@",idtext.text,passwordtext.text,[[NSUserDefaults standardUserDefaults]valueForKey:@"UDID"]];
  
    
    //NSString *RegURL = [NSString stringWithFormat:@"http://openxcellaus.info/leopard/chatting.php?from_user_id=7&to_user_id=8&text=heyfrndssssssss"];
    
	//    NSString *RegURL = @"http://www.openxcellaus.info/leopard/near_by_users.php?lat=23.41670000&long=72.91670000";
    
    NSLog(@"%@",RegURL);
    
	GdataParser *parser = [[GdataParser alloc] init];
	[parser downloadAndParse:[NSURL URLWithString:RegURL] 
				 withRootTag:@"Record"
					withTags:[NSDictionary dictionaryWithObjectsAndKeys:@"msg",@"msg",@"uid",@"uid",nil]
     
						 sel:@selector(finishGetData:) 
				  andHandler:self];
	
}

-(void)finishGetData:(NSDictionary*)dictionary{
	[AlertHandler hideAlert];
    
    NSLog(@"%@",dictionary);
    NSMutableArray *tempArray;
    tempArray = [dictionary objectForKey:@"array"];
    NSLog(@"%@",tempArray);
    NSMutableDictionary *tempDic = [tempArray objectAtIndex:0];
    NSLog(@"%@",[tempDic objectForKey:@"msg"]);
    NSString *temp = [tempDic objectForKey:@"msg"];
     
    
    
    if ([temp isEqualToString:@"Username or Password do not match"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Your email ID or Password do not match!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    
    else{
        
        NSString *userid=[tempDic objectForKey:@"uid"];
        
        GlueAppDelegateObj.userID = [[tempDic objectForKey:@"uid"] intValue];
        [GlueAppDelegateObj.meetingPPlArray addObject:[tempDic objectForKey:@"uid"]];
        
        NSLog(@"%@",GlueAppDelegateObj.meetingPPlArray);
        
        [[NSUserDefaults standardUserDefaults] setValue:userid forKey:@"Login"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        
        CGRect frame = CGRectMake(-2, 0, 480, 180);
       		UIView *v = [[UIView alloc] initWithFrame:frame];
        
//        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
//            i = [UIImage imageNamed:@"greyBottomBar.png"];
//        }
//        else
//        {
            i = [UIImage imageNamed:@"purpleBottomBar.png"];
//        }
       	UIColor *c = [[UIColor alloc] initWithPatternImage:i];
        		v.backgroundColor = c;
        		[c release];
        		
        		[tabBar.tabBar insertSubview:v atIndex:GlueAppDelegateObj.tabbarIndCnt];
        GlueAppDelegateObj.tabbarIndCnt++;
        		[v sendSubviewToBack:tabBar.tabBar];
       	[v release];
        if (!GlueAppDelegateObj.islogin) {
        
        
        
        [self dismissModalViewControllerAnimated:NO];
            
        self.tabBar.selectedIndex = 1;
            
         // self.tabBarController.selectedIndex = 0;
        }
   
        else
        {
        //[self.view addSubview:tabBar.view];
            //self.navigationController.navigationBar.hidden =YES;
            tabBar.delegate = self;
            [self.navigationController pushViewController:tabBar animated:YES];
        }  
        
        NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/user_list.php?userid=%i",GlueAppDelegateObj.userID];
        
        
        
        NSLog(@"%@",urlString);
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        
        JSONParser *parser;
        parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];

    }
    
   
}

-(void)datafatch:(NSDictionary*)dictionary{
    
    //    contactArray = [[NSMutableArray alloc] init];
    //    
    //    contactname = [[NSMutableArray alloc] init];
    //    contactnum = [[NSMutableArray alloc] init];
    //    contactemail = [[NSMutableArray alloc] init];
    
    NSLog(@"%@",dictionary);
    NSMutableArray *tempArray;
    tempArray = [[NSMutableArray alloc] init];
    tempArray =[dictionary valueForKey:@"Record"];
    NSLog(@"%@",tempArray);
    NSMutableDictionary *tempdic;
    tempdic = [tempArray objectAtIndex:0];
    
    GlueAppDelegateObj.currentUserName = [tempdic objectForKey:@"firstname"];
    GlueAppDelegateObj.userEmail = [tempdic objectForKey:@"email"];
    //currentUserName = [[dictionary valueForKey:@"Record"] valueForKey:@"firstname"] ;
    //stremaillist=userEmail;
    NSLog(@"%@",GlueAppDelegateObj.currentUserName);
    NSLog(@"%@",GlueAppDelegateObj.userEmail);
    GlueAppDelegateObj.stremaillist=GlueAppDelegateObj.userEmail;
    GlueAppDelegateObj.strIdList = [NSString stringWithFormat:@"%i",GlueAppDelegateObj.userID];
  //  lblemaillist.text=GlueAppDelegateObj.stremaillist;
    
	
    
       
}



//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    NSUInteger index=[[tabBarController viewControllers] indexOfObject:viewController];
//    switch (index) {
//        case 0:
//            self.imgV.image=[UIImage imageNamed:@"tab1.png"];
//            break;
//        case 1:
//            self.imgV.image=[UIImage imageNamed:@"tab2.png"];
//            break;
//        case 2:
//            self.imgV.image=[UIImage imageNamed:@"tab3.png"];
//            break;
//        case 3:
//            self.imgV.image=[UIImage imageNamed:@"tab4.png"];
//            break;
//        
//        default:
//            break;
//    }
//    return YES;
//}

-(void)getLogedIn{
	CGRect frame = CGRectMake(-2, 0, 480, 180);
	UIView *v = [[UIView alloc] initWithFrame:frame];
	i = [UIImage imageNamed:@"tabbar.png"];
	UIColor *c = [[UIColor alloc] initWithPatternImage:i];
	v.backgroundColor = c;
	[c release];
	
	[tabBar.tabBar insertSubview:v atIndex:0];
	[v sendSubviewToBack:tabBar.tabBar];
	[v release];
	if (!GlueAppDelegateObj.islogin) {
        
        
        
        [self dismissModalViewControllerAnimated:NO];
		
        self.tabBar.selectedIndex = 1;
		
		// self.tabBarController.selectedIndex = 0;
	}
	
	else
	{
        //[self.view addSubview:tabBar.view];
		//self.navigationController.navigationBar.hidden =YES;
		tabBar.delegate = self;
		[self.navigationController pushViewController:tabBar animated:YES];
	}  
	
	
}
-(IBAction)registerbtn_clicked:(id)sender
{
    
	userregister *reg = [[userregister alloc]initWithNibName:@"userregister" bundle:nil];
	[reg setParentObj:self];
	[self.view addSubview:reg.view];
	//[self presentModalViewController:reg animated:YES];
	
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[idtext resignFirstResponder];
	[passwordtext resignFirstResponder];
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
    [super dealloc];
}


@end
