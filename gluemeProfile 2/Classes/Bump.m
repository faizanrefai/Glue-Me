//
//  Bump.m
//  glueme
//
//  Created by apple1 on 9/21/11.
//  Copyright 2011 openxcek. All rights reserved.
//

#import "Bump.h"
#import	"FAQHelp.h"

#import "whogluedmap.h"
@implementation Bump
@synthesize LblRequest,selectHours,durationArray,frndId,frndNm;

#pragma mark -
#pragma mark View lifecycle

-(IBAction)onMap:(id)sender{
	
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
    appDelegateObj.count = 0;
    [self.navigationController pushViewController:mymapObj animated:NO];
    
  //  whoGlueVwObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];

	
	//whogluedmap	*gluemap=[[whogluedmap alloc]initWithNibName:@"whogluedmap" bundle:nil];
	//[self.navigationController pushViewController:whoGlueVwObj animated:YES];
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


- (void)viewDidLoad {
    [super viewDidLoad];
	bumpObj = [BumpAPI sharedInstance];
    
   // [bumpObj configAPIKey:@"c53d6a5ee1ba4460a054bd6e76c51c56"];
//    //[api configActionMessage:@"Welcome"];
//    [bumpObj configDelegate:self];
//    [bumpObj configUIDelegate:self];
    
    durationArray = [[NSMutableArray alloc] init];
  
    [durationArray addObject:@"Forever"];
    [durationArray addObject:@"48 hours"];
    [durationArray addObject:@"24 hours"];
    [durationArray addObject:@"12 hours"];
    [durationArray addObject:@"6 hours"];
    
    LblRequest.textColor = [UIColor whiteColor];
    
	arrBump=[[NSMutableArray alloc]initWithObjects:@"Cracking glass",@"Car Horn",@"Cat Meow",@"Dog Bark",@"Whistle",nil];
    
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

    appDelegateObj = (gluemeAppDelegate*)[[UIApplication sharedApplication]delegate];


    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
//        
//        
//        [self.view addSubview:backBtn]; 

    }
    
	[[BumpAPI sharedInstance] configAPIKey:@"c53d6a5ee1ba4460a054bd6e76c51c56"];
	[[BumpAPI sharedInstance] configDelegate:self];
    [[BumpAPI sharedInstance] configUIDelegate:self];
    [[BumpAPI sharedInstance] requestSession];
	    
}

-(IBAction)BumpClicked
{
    [[BumpAPI sharedInstance]  configAPIKey:@"c53d6a5ee1ba4460a054bd6e76c51c56"];
   // [[BumpAPI sharedInstance] simulateBump];
	[[BumpAPI sharedInstance] configDelegate:self];
    [[BumpAPI sharedInstance] configUIDelegate:self];
    [[BumpAPI sharedInstance] requestSession];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"You are connected with John Carter." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"CANCEL", nil];
//    [alert show];
//    [alert release];
}

-(void)bumpSessionStartedWith:(Bumper *)otherBumper
{
    
    NSLog(@"other user name : %@",[otherBumper userName]);
	
	//NSString *str = @"hello..i m ipad.!!";
	
    NSString *str = [NSString stringWithFormat:@"%i %@",appDelegateObj.userID,appDelegateObj.currentUserName];
    
	NSData *moveChunk = [NSKeyedArchiver archivedDataWithRootObject:str];
	
	
	[[BumpAPI sharedInstance] sendData:moveChunk];
    
}

-(void)bumpSessionStarted
{
    [LblRequest setText:@"Session started!!!"];
}

-(void)bumpSessionFailedToStart:(BumpSessionStartFailedReason)reason
{
    [LblRequest setText:@"Failed to connect... retrying"];
	[[BumpAPI sharedInstance] requestSession];
}

-(void)bumpSessionEnded:(BumpSessionEndReason)reason
{
    [LblRequest setText:@"Bump session ended"];
	NSLog(@"Session has ended, requesting a new one");
	[[BumpAPI sharedInstance] requestSession];//auto request a new session since we always want
    //to be doing something
}


-(void)bumpDataReceived:(NSData *)chunk
{
    NSString *responseDictionary = [NSKeyedUnarchiver unarchiveObjectWithData:chunk];
	
	NSLog(@"%@",responseDictionary);
    
    NSString *list = responseDictionary;
    NSArray *listItems = [list componentsSeparatedByString:@" "];
    
    NSLog(@"%@",[listItems objectAtIndex:0]);
    NSLog(@"%@",[listItems objectAtIndex:1]);
    
    frndId = [[listItems objectAtIndex:0] copy];
    frndNm = [[listItems objectAtIndex:1] copy];
    
    [[BumpAPI sharedInstance] endSession];
    
    pkrTimeDuration = [[UIPickerView alloc] init];
    pkrTimeDuration.delegate=self;
    pkrTimeDuration.dataSource=self;
    [pkrTimeDuration setShowsSelectionIndicator:YES];
    [pkrTimeDuration selectRow:1 inComponent:0 animated:NO];
    [pkrTimeDuration setTag:1];
    [pkrTimeDuration setFrame:CGRectMake(0, 40, 320, 100)];
    
    UIActionSheet *ActionTimeDur = [[UIActionSheet alloc] initWithTitle:@"Pickup Time\n\n\n\n\n\n\n\n\n\n\n\n" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Set" otherButtonTitles:nil];
    ActionTimeDur.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [ActionTimeDur setBounds:CGRectMake(0, 0, 320, 250)];
    ActionTimeDur.tag=1;
    [ActionTimeDur addSubview:pkrTimeDuration];
    [ActionTimeDur showInView:self.view];
    [pkrTimeDuration reloadAllComponents];
    
	//[LblRequest setText:[NSString stringWithFormat:@"You are going to glued with %@.",[listItems objectAtIndex:1]]];
    //[self selectHours];
}

-(void)SelectHours
{
    pkrTimeDuration = [[UIPickerView alloc] init];
    pkrTimeDuration.delegate=self;
    pkrTimeDuration.dataSource=self;
    [pkrTimeDuration setShowsSelectionIndicator:YES];
    [pkrTimeDuration selectRow:1 inComponent:0 animated:NO];
    [pkrTimeDuration setTag:1];
    [pkrTimeDuration setFrame:CGRectMake(0, 40, 320, 100)];
    
    UIActionSheet *ActionTimeDur = [[UIActionSheet alloc] initWithTitle:@"Pickup Time\n\n\n\n\n\n\n\n\n\n\n\n" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Set" otherButtonTitles:nil];
    ActionTimeDur.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [ActionTimeDur setBounds:CGRectMake(0, 0, 320, 250)];
    ActionTimeDur.tag=1;
    [ActionTimeDur addSubview:pkrTimeDuration];
    [ActionTimeDur showInView:self.view];
    [pkrTimeDuration reloadAllComponents];
 
}

-(void)dismissActionSheet
{
    
    actionSheetCBrand.hidden = TRUE;
    
    [actionSheetCBrand release];
    actionSheetCBrand=nil;
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    NSString *timeStr = [durationArray objectAtIndex:row];
    
    if ([timeStr isEqualToString:@"24 hours"]) {
        d=24;
    }
    if ([timeStr isEqualToString:@"48 hours"]) {
        d=48;
    }
    if ([timeStr isEqualToString:@"12 hours"]) {
        d=12;
    }
    if ([timeStr isEqualToString: @"6 hours"]) {
        d=6;
    }
    if ([timeStr isEqualToString: @"Forever"]) {
        d=50;
    }
    
    NSLog(@"%i",d);
    
    
    
    // [durationBtn setTitle:[durationArray objectAtIndex:row] forState:normal];
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [durationArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [durationArray objectAtIndex:row];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {
       // [AlertHandler showAlertForProcess];
        
      //  NSLog(@"%i",appDelegateObj.HistoryId);
        NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/send_glueme_req.php?user_id=%i&frnd_id=%@&glueme_time=%i",appDelegateObj.userID,frndId,d];
        
        
        NSLog(@"%@",urlString);
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        
        JSONParser *parser;
        parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(GlueMeRequestFatch:) andHandler:self];    
        
        
    }
}

-(void)GlueMeRequestFatch:(NSDictionary*)dictionary
{
   // [AlertHandler hideAlert];
    NSLog(@"%@",dictionary);
    
    NSLog(@"%@",[dictionary objectForKey:@"msg1"]);
    NSString *GMsg =[dictionary objectForKey:@"msg1"];
    
    NSLog(@"%@",[dictionary objectForKey:@"msg"]);
    NSString *FMsg = [dictionary objectForKey:@"msg"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:GMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
   // [alert show];
    [alert release];
    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Info" message:FMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    //[alert1 show];
    [alert1 release];
    
    if ([[dictionary objectForKey:@"msg"] isEqualToString:@"Friend Request Already sent"]) 
    {
       
        if ([[dictionary objectForKey:@"msg1"] isEqualToString:@"Users are Already Glued"]) {
            return;
        }
        else
        {
            
            [self GlueMeRequest];
            
//            NSString *urlString;
//        // [self.navigationController popToRootViewControllerAnimated:YES];
////        if ([s_val isEqualToString:@"Friend Request"]) {
////            urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/accept_reject.php?user_id=%@&frnd_id=%i&accepted=1&blocked=0",udid,appDelegateObj.userID];
////        }
////        else
////        {
//                urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/accept_reject_glueme_req.php?user_id=%@&frnd_id=%i&accepted=1",frndId,appDelegateObj.userID];
//            //http://www.openxcellaus.info/glueme/accept_reject_glueme_req.php?user_id=10&frnd_id=11&accepted=1
////        }
////        [AlertHandler showAlertForProcess];
//        
//            NSLog(@"%@",urlString);
//        
//            NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//        
//            JSONParser *parser;
//            parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(requestdatafatch:) andHandler:self];

        }
    }
    else
    {
        [self FriendRequest];
    }
    
        [self dismissActionSheet];
    
    
    
    //[self.navigationController popViewControllerAnimated:YES];
}

-(void)FriendRequest
{
    
    NSString *urlString;
    
   
    urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/accept_reject.php?user_id=%i&frnd_id=%@&accepted=1&blocked=0",appDelegateObj.userID,frndId];

    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(FrRequestdatafatch:) andHandler:self];

    
//    [self.navigationController popToRootViewControllerAnimated:YES];
//    if ([s_val isEqualToString:@"Friend Request"]) {
//        urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/accept_reject.php?user_id=%@&frnd_id=%i&accepted=1&blocked=0",udid,appDelegateObj.userID];
//    }
//    else
//    {

}

-(void)FrRequestdatafatch:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);
    NSString *msg;
    
    msg = [[NSString alloc] initWithFormat:@"%@",[dictionary valueForKey:@"msg"]];
    NSLog(@"%@",msg);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    //[alert show];
    [alert release];
    [self GlueMeRequest];
}


-(void)GlueMeRequest
{
    NSString *urlString;
    
        urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/accept_reject_glueme_req.php?user_id=%i&frnd_id=%@&accepted=1",appDelegateObj.userID,frndId];
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(requestdatafatch:) andHandler:self];
    

}

-(void)requestdatafatch:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);
    NSString *msg;
    
    msg = [[NSString alloc] initWithFormat:@"%@",[dictionary valueForKey:@"msg"]];
    NSLog(@"%@",msg);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"You're Glued!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];

    
}

-(void)bumpRequestSessionCalled
{
    [LblRequest setText:@"Request Session Called... Warming up"];
}

-(void)bumpConnectedToBumpNetwork
{
    [LblRequest setText:@"Ready to Bump"];
}

-(void)bumpEndSessionCalled
{
    [LblRequest	 setText:@"End Session was called"];
	NSLog(@"UI Callback, end session called");
}

-(void)bumpNetworkLost
{
    [LblRequest setText:@"Warming up... network was lost"];
}

-(void)bumpOccurred
{
    [LblRequest setText:@"Bumped! Trying to connecect..."];
}

-(void)bumpMatchFailedReason:(BumpMatchFailedReason)reason
{
    [LblRequest setText:@"Match failed, try again"];
}

-(void)bumpMatched:(Bumper *)bumper
{
    [LblRequest setText:@"Matched! about to start..."];
	[[BumpAPI sharedInstance] confirmMatch:YES];
	
	[bumpObj requestSession];
	
	NSLog(@"my user name : %@",[bumper userName]);
}



-(void)Back
{
	[[BumpAPI sharedInstance] release];
    [self.navigationController popViewControllerAnimated:YES];
}



/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [arrBump count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.textColor = [UIColor whiteColor];
	if(ind==indexPath)
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	else
		cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.text = [arrBump objectAtIndex:indexPath.row];
	
	UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [cellImg setImage:[UIImage imageNamed:@"contactCellImg.png"]];
    cell.backgroundView = cellImg;
    
    cell.textLabel.textColor = [UIColor blackColor];
	
	
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	ind =indexPath;
	
	[tblBump reloadData];	
	//cell.accessoryType = UITableViewCellAccessoryCheckmark;
	// Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
}
-(IBAction)onFAQ:(id)sender
{
	FAQHelp *faqhelp=[[FAQHelp alloc]initWithNibName:@"FAQHelp" bundle:nil];
	[self.navigationController pushViewController:faqhelp animated:YES];
	[faqhelp release];
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}
-(void)viewWillDisappear:(BOOL)animated{
	[[BumpAPI sharedInstance] endSession];
}
	

- (void)viewDidUnload {
	[[BumpAPI sharedInstance] endSession];
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[[BumpAPI sharedInstance] endSession];
	[[BumpAPI sharedInstance] release];
    [super dealloc];
}


@end

