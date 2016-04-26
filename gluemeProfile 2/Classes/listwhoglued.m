//
//  listwhoglued.m
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import "listwhoglued.h"
#import "whogluedmap.h"
#import "FAQHelp.h"
#import "AlertHandler.h"

@implementation listwhoglued
@synthesize nameArray,timeArray;
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
-(IBAction)onMap:(id)sender{
	
	appDelegateObj.strIdsel0 =@"0";
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
//	whogluedmap	*gluemap=[[whogluedmap alloc]initWithNibName:@"whogluedmap" bundle:nil];
//	[self.navigationController pushViewController:gluemap animated:YES];
//	[gluemap release];
//	whoGlueVwObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
    appDelegateObj.count = 0;
    [self.navigationController pushViewController:mymapObj animated:NO];
	
}


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
    
    appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication]delegate];
	appDelegateObj.parentlist_obj =self;
    
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    backBtn.frame = CGRectMake(5,10, 76, 28);
//    
//    [backBtn addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    BumpBtn.frame = CGRectMake(268,10, 35, 34);
    
    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:BumpBtn]; 
    
  //  [self.view addSubview:backBtn];    

    [super viewDidLoad];
}

-(void)Bump
{
    NSLog(@"BumpClicked");
    bumpObj = [[Bump alloc] initWithNibName:@"Bump" bundle:nil];
    [self.navigationController pushViewController:bumpObj animated:YES];
    
}

-(IBAction)setmeeting
{
    appDelegateObj.selectedFrnd = [NSString stringWithFormat:@""];
    meetingpointview *obj = [[meetingpointview alloc]init];
    [self.navigationController pushViewController:obj animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    if (appDelegateObj.isthemechanged) {
//        self.navigationController.navigationBar.alpha = 0.0;
//        
//        self.navigationController.navigationBar.tintColor = [UIColor clearColor];
//        UIImageView *topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
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
        
        
//        [self.view addSubview:topbarImg];
//        UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        BumpBtn.frame = CGRectMake(268,10, 35, 34);
//        
//        [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self.view addSubview:BumpBtn]; 
    }
    
    
	[self getReqCount];
    
	
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

    
    nameArray = [[NSMutableArray alloc] init];
    timeArray = [[NSMutableArray alloc] init];
    uidArray = [[NSMutableArray alloc] init];
    uidDic = [[NSMutableDictionary alloc] init];
    
    [timeArray addObject:@"2 hours"];
    [timeArray addObject:@"1 hour"];
    [timeArray addObject:@"4 hours"];
    [AlertHandler showAlertForProcess];
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/glueMe_friend_list.php?user_id=%i",appDelegateObj.userID];
    
    tbl.rowHeight = 70.0;
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];

}

-(void)getReqCount{
	NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/pending_friend_req_list_count.php?frnd_id=%d",appDelegateObj.userID];
	
	NSLog(@"%@",urlString);
	
	NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
	
	JSONParser *parser;
	parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatchcount:) andHandler:self];
	
	
	
	
}

-(void)datafatchcount:(NSDictionary*)dictionary{
	NSString *str_p =[dictionary  valueForKey:@"count"];
	int val =[str_p intValue];
	if(val==0)
	{
		[[[[[self tabBarController] tabBar] items] objectAtIndex:1] setBadgeValue:nil];	
		[UIApplication sharedApplication].applicationIconBadgeNumber = val ;

	}
	else {
		[[[[[self tabBarController] tabBar] items] objectAtIndex:1] setBadgeValue:[NSString stringWithFormat:@"%d",val]];	
		[UIApplication sharedApplication].applicationIconBadgeNumber = val ;

	}
	
	
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	//NSLog(@"Accuracy [%f]",newLocation.horizontalAccuracy);
	
    CLLocationCoordinate2D location;  
	
	location.latitude = newLocation.coordinate.latitude ;
	location.longitude = newLocation.coordinate.longitude;
    
	
	appDelegateObj.latitude= [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.latitude];
	appDelegateObj.longitude = [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.longitude];
	
	NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/update_lat_lon.php?uid=%d&lat=%@&lon=%@",appDelegateObj.userID,appDelegateObj.latitude,appDelegateObj.longitude];
    
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


-(void)datafatch:(NSDictionary*)dictionary{
    
    //    contactArray = [[NSMutableArray alloc] init];
    //    
    //    contactname = [[NSMutableArray alloc] init];
    //    contactnum = [[NSMutableArray alloc] init];
    //    contactemail = [[NSMutableArray alloc] init];
	if(arremail!=nil){
		[arremail release];
	}
	[nameArray removeAllObjects];
		
    arremail=[[NSMutableArray alloc]init];
    
    NSLog(@"%@",dictionary);
    
    dic = [[NSMutableDictionary alloc] initWithDictionary:dictionary];    
    for (int i=0; i<[[dictionary valueForKey:@"glueMe_friend_list"]count]; i++) 
    {
        
        
        [nameArray addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"firstname"] objectAtIndex:i]];
        [arremail addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"email"] objectAtIndex:i]];
        
        
        NSString *Name = [[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"firstname"] objectAtIndex:i];
                
              [uidArray addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"user_id"] objectAtIndex:i]];
        
        NSString *uid = [[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"user_id"] objectAtIndex:i];
        
        //        
        //        [contactemail addObject:[[[dictionary valueForKey:@"users"] valueForKey:@"email"] objectAtIndex:i]];
        
        
        [uidDic setValue:uid forKey:Name];
        
    }
    [AlertHandler hideAlert];
    
	
	if([arremail count]==0 && [nameArray count]==0){
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"No record found"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];		
        [tbl reloadData];
		//[nameArray addObject:@"No record found"];
	}
 
	else
			[tbl reloadData];

	
    NSLog(@"%@",nameArray);
    NSLog(@"%@",uidArray);
    NSLog(@"%@",uidDic);
           
        
}


-(IBAction)onFAQ:(id)sender
{
	FAQHelp *faqhelp=[[FAQHelp alloc]initWithNibName:@"FAQHelp" bundle:nil];
	[self.navigationController pushViewController:faqhelp animated:YES];
	[faqhelp release];
}

-(void)Back
{
    [self.navigationController popViewControllerAnimated:YES];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
		return [nameArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"Cell";
   
    UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0,10,270, 57)];
    [cellImg setImage:[UIImage imageNamed:@"CellImg"]];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        [cell.contentView addSubview:cellImg];

    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

	cell.textLabel.font = [UIFont fontWithName:@"arial" size:18];
	cell.textLabel.textColor=[UIColor blackColor];
    cell.textLabel.text = [nameArray objectAtIndex:indexPath.row];
//			cell.detailTextLabel.text= [NSString stringWithFormat:@"GlueMe time left - %@",[timeArray objectAtIndex:indexPath.row]];
//    
            //tbl.frame=CGRectMake(25, 106, 270, [nameArray count]*70);
    

    
			//cell.detailTextLabel.textColor = [UIColor whiteColor];
			//cell.contentView.backgroundColor=[UIColor clearColor];
			cell.textLabel.backgroundColor=[UIColor clearColor];
//			cell.detailTextLabel.backgroundColor=[UIColor clearColor];
//    cell.detailTextLabel.textColor = [UIColor blackColor];
				
    
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
   // [uidDic objectForKey:[nameArray objectAtIndex:indexPath.row]] forKey:[nameArray objectAtIndex:indexPath.row]
    
   
    
	meetingpointview *obj = [[meetingpointview alloc]init];
    [[NSUserDefaults standardUserDefaults] setValue:[uidDic objectForKey:[nameArray objectAtIndex:indexPath.row]] forKey:[nameArray objectAtIndex:indexPath.row]];
    [appDelegateObj.meetingPPlArray addObject:[uidDic objectForKey:[nameArray objectAtIndex:indexPath.row]]];
    NSLog(@"%@",appDelegateObj.meetingPPlArray);
    appDelegateObj.selectedFrnd = [nameArray objectAtIndex:indexPath.row];
    appDelegateObj.stremailselect0=[arremail objectAtIndex:indexPath.row];
    
   // appDelegateObj.strIdsel0 = [uidDic valueForKey:[nameArray objectAtIndex:indexPath.row]];
    appDelegateObj.strIdsel0 = [uidArray objectAtIndex:indexPath.row];
    [nameArray release];
    
    
    
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
    [self.navigationController pushViewController:mymapObj animated:NO];
    
	//[self.navigationController pushViewController:obj animated:YES];
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
