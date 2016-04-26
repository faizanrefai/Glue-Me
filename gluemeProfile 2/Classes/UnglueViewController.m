//  UnglueViewController.m
//  glueme
//
//  Created by OPENXCELL TECHNOLABS on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UnglueViewController.h"
#import "FAQHelp.h"
#import "whogluedmap.h"
#import "AlertHandler.h"

@implementation UnglueViewController
@synthesize uidDic,uidArray,nameArray,dic;
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
//        [self.navigationController.navigationBar sendSubviewToBack:topbarImg];
//        
//        UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        BumpBtn.frame = CGRectMake(268,10, 35, 34);
//        
//        [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self.view addSubview:BumpBtn]; 
        

    }
    
    nameArray = [[NSMutableArray alloc] init];
    dic = [[NSMutableDictionary alloc] init];
    uidArray = [[NSMutableArray alloc] init];
    uidDic = [[NSMutableDictionary alloc] init];
    
    
    [tlb setRowHeight:70.0];
    
    [AlertHandler showAlertForProcess];
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/glueMe_friend_list.php?user_id=%i",appDelegateObj.userID];
    
    //tbl.rowHeight = 70.0;
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];

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
    
   [AlertHandler hideAlert];
    
    NSLog(@"%@",dictionary);
    
    dic = [[NSMutableDictionary alloc] initWithDictionary:dictionary];    
    for (int i=0; i<[[dictionary valueForKey:@"glueMe_friend_list"]count]; i++) 
    {
        
        
        
        [nameArray addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"firstname"] objectAtIndex:i]];
        
        NSString *Name = [[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"firstname"] objectAtIndex:i];
        
        [uidArray addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"user_id"] objectAtIndex:i]];
        
        NSString *uid = [[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"user_id"] objectAtIndex:i];
        
        //        
        //        [contactemail addObject:[[[dictionary valueForKey:@"users"] valueForKey:@"email"] objectAtIndex:i]];
        
        
        [uidDic setValue:uid forKey:Name];
        
        
        
        
    }
    
    NSLog(@"%@",nameArray);
    NSLog(@"%@",uidArray);
    NSLog(@"%@",uidDic);
    //    
    [tlb reloadData];
    
}


-(IBAction)onMap:(id)sender{
    
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
    
	
  //  whoGlueObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
	appDelegateObj.count = 0;
    [self.navigationController pushViewController:mymapObj animated:NO];
	//whogluedmap	*gluemap=[[whogluedmap alloc]initWithNibName:@"whogluedmap" bundle:nil];
	//[self.navigationController pushViewController:whoGlueObj animated:YES];
	//[gluemap release];
	
	
}

-(IBAction)setmeeting
{
    
    appDelegateObj.selectedFrnd = [NSString stringWithFormat:@""];
    meetingpointview *obj = [[meetingpointview alloc]init];
    [self.navigationController pushViewController:obj animated:YES];
    
//    listVwObj = [[listwhoglued alloc] initWithNibName:@"listwhoglued" bundle:nil];
//    [self.navigationController pushViewController:listVwObj animated:NO];
}


-(IBAction)onFAQ:(id)sender
{
	FAQHelp *faqhelp=[[FAQHelp alloc]initWithNibName:@"FAQHelp" bundle:nil];
	[self.navigationController pushViewController:faqhelp animated:YES];
	[faqhelp release];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	arrFriends=[[NSMutableArray alloc]initWithObjects:@"Friend1",@"Friend2",@"Friend3",@"Friend4",nil];
    appDelegateObj = (gluemeAppDelegate*)[[UIApplication sharedApplication]delegate];
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
        
    
	UIBarButtonItem *editButton=[[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:self action:@selector(Edit:)];
    [self.navigationItem setLeftBarButtonItem:editButton];
	UIBarButtonItem *unglueAllButton=[[UIBarButtonItem alloc]initWithTitle:@"Unglue All Friends" style:UIBarButtonItemStyleBordered target:self action:@selector(UnglueAll:)];
    [self.navigationItem setRightBarButtonItem:unglueAllButton];
		
	[super viewDidLoad];
	
//	ABAddressBookRef addressBook = ABAddressBookCreate(); NSArray *thePeople = (NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
//    for (id person in thePeople)
//        
//    {
//   NSString *name = (NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
//    
//    NSLog(@"!!!!!! name ---> %@",name);
//    }
    
}

-(void)Bump
{
    NSLog(@"BumpClicked");
    bumpObj = [[Bump alloc] initWithNibName:@"Bump" bundle:nil];
    [self.navigationController pushViewController:bumpObj animated:YES];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	
    return [nameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0,10,270, 57)];
    [cellImg setImage:[UIImage imageNamed:@"CellImg"]];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.hidesAccessoryWhenEditing=YES;
    
       
        
        [cell.contentView addSubview:cellImg];

	
    }
	
	cell.textLabel.text = [nameArray objectAtIndex:indexPath.row];
//    UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    [cellImg setImage:[UIImage imageNamed:@"contactCellImg.png"]];
//    cell.backgroundView = cellImg;
    
    cell.textLabel.textColor = [UIColor blackColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
	//cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	// Configure the cell.
	
    return cell;
}





/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


-(IBAction)Edit:(id)sender{
	if([arrFriends count]==0)
	{
		UIAlertView *alert2=[[UIAlertView alloc] initWithTitle:@"No friends to unglue"
													   message:@"Sorry!!" 
													  delegate:self 
											 cancelButtonTitle:nil 
											 otherButtonTitles:@"Ok",nil];
		alert2.tag=3;
		[alert2 show];
		[alert2 release];
		
	}
	
	else{
	
	if(self.editing)
	{ 
		[super setEditing:NO animated:NO]; 
		[tlb setEditing:NO animated:NO];
		[tlb  reloadData];
		[self.navigationItem.leftBarButtonItem setTitle:@"Edit"];
		[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStylePlain];
		self.navigationItem.rightBarButtonItem.enabled=TRUE;

	}
	else
	{
		[super setEditing:YES animated:YES]; 
		[tlb  setEditing:YES animated:YES];
		[tlb  reloadData];
		
		[self.navigationItem.leftBarButtonItem setTitle:@"Done"];
		[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStyleDone];
		self.navigationItem.rightBarButtonItem.enabled=FALSE;

	}
	}
	
}
-(IBAction)UnglueAll:(id)sender{
	if([arrFriends count]==0)
	{
		
		UIAlertView *alert2=[[UIAlertView alloc] initWithTitle:@"No friends to unglue"
													   message:@"Sorry!!" 
													  delegate:self 
											 cancelButtonTitle:nil 
											 otherButtonTitles:@"Ok",nil];
		alert2.tag=3;
		[alert2 show];
		[alert2 release];
		
		
	}
	else{
	UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Unglue Me All"
												  message:@"Are you sure you want to unglue with all your friends" 
												 delegate:self 
										cancelButtonTitle:nil 
										otherButtonTitles:@"YES",@"NO",nil];
	alert.tag=1;
	[alert show];
	[alert release];
	}
	
}
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	// the user clicked one of the OK/Cancel buttons
	if(actionSheet.tag==1)
	{
	if (buttonIndex == 0)
	{
		[nameArray removeAllObjects];
		[tlb reloadData];
	}
	else {
		
	}
	}
	if(actionSheet.tag==2)
	{
		if(buttonIndex==0)
		{
			[nameArray removeObjectAtIndex:flag];
            NSString *strid;
            strid=[uidArray objectAtIndex:flag];
            NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/remove_glueme_friend.php?user_id=%i&frnd_id=%@",appDelegateObj.userID,strid];
            
            //tbl.rowHeight = 70.0;
            
            NSLog(@"%@",urlString);
            
            NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
            
            JSONParser *parser;
            parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch1:) andHandler:self];
			[tlb  reloadData];

		}
		else {
			[tlb reloadData];
		}
	}
	if(actionSheet.tag==3)
	{
		
		if(buttonIndex==0)
		{
			
		}
	}

	
}
-(void)datafatch1:(NSDictionary*)dictionary{
    NSLog(@"%@",dictionary);
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Unglue Me"
												  message:[dictionary valueForKey:@"msg"] 
												 delegate:self 
										cancelButtonTitle:@"Ok" 
										otherButtonTitles:nil,nil];
    [alert show];
    [alert release];
    
    [tlb reloadData];
    
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    	return UITableViewCellEditingStyleDelete;
	
    
} 
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath {
	UIAlertView *alert1=[[UIAlertView alloc] initWithTitle:@"Unglue Me"
												   message:@"Are you sure you want to unglue with  your friend" 
												  delegate:self 
										 cancelButtonTitle:nil 
										 otherButtonTitles:@"YES",@"NO",nil];
	flag=indexPath.row;
	alert1.tag=2;    
	[alert1 show];
	[alert1 release];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
              
        [tableView reloadData];
    }
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
