//
//  GetGlueViewController.m
//  glueme
//
//  Created by OPENXCELL TECHNOLABS on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GetGlueViewController.h"
#import "whogluedmap.h"
#import "FAQHelp.h"

@implementation GetGlueViewController
@synthesize GetGlueSegment,durationBtn,durationArray;

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
	
	//whoGlueObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
    
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
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
    [self.navigationController.navigationBar sendSubviewToBack:topbarImg];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(5,10, 76, 28);
    
    [backBtn addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    BumpBtn.frame = CGRectMake(268,10, 35, 34);
    
    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:BumpBtn]; 
    
    [self.view addSubview:backBtn]; 
    

    
    durationArray = [[NSMutableArray alloc] init];
    [durationArray addObject:@"Forever"];
    [durationArray addObject:@"48 hours"];
    [durationArray addObject:@"24 hours"];
    [durationArray addObject:@"12 hours"];
    [durationArray addObject:@"6 hours"];
    appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication]delegate];
    
        
    
    [super viewDidLoad];
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
      
//    self.navigationController.navigationBar.alpha = 0.0;
//    
//    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
//    topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
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
    
//    [self.view addSubview:topbarImg];
//    [self.navigationController.navigationBar sendSubviewToBack:topbarImg];
//    
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    backBtn.frame = CGRectMake(5,10, 76, 28);
//    
//    [backBtn addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    BumpBtn.frame = CGRectMake(268,10, 35, 34);
//    
//    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:BumpBtn]; 
//    
//    [self.view addSubview:backBtn]; 

    }
    
    
    lblname.text=appDelegateObj.contactname;
    lblname2.text=appDelegateObj.contactname;
    
    lblemail.text=appDelegateObj.contactemail;
    lblno.text=appDelegateObj.contactnum;
    lblbdate.text=appDelegateObj.bdateStr;
    lbllname.text=appDelegateObj.lname;
    
    NSString *lname;
    lname=[[NSUserDefaults standardUserDefaults]valueForKey:@"LastName"];
    
    NSString *email;
    email=[[NSUserDefaults standardUserDefaults]valueForKey:@"Email"];
    NSString *contactno;
    contactno=[[NSUserDefaults standardUserDefaults]valueForKey:@"Contact"];
    NSString *bdate;
    bdate=[[NSUserDefaults standardUserDefaults]valueForKey:@"Birthdate"];
    
    NSString *about;
    
    
    about=[[NSUserDefaults standardUserDefaults]valueForKey:@"About"];
    
    
    if ([lname isEqualToString:@"True"]) {
        
        lbllname.hidden=FALSE;
        
        
    }
    
    if ([email isEqualToString:@"True"]) {
        
        lblemail.hidden=FALSE;
        
        lbllemail.hidden=FALSE;
        
    }
    if ([contactno isEqualToString:@"True"]) {
        
        lblno.hidden=FALSE;
        
        lbllno.hidden=FALSE;
        
    }
    if ([bdate isEqualToString:@"True"]) {
        
        lblbdate.hidden=FALSE;
        lbllbdate.hidden=FALSE;
        
    }
    
    if ([about isEqualToString:@"True"]) {
        lblabtme.hidden=FALSE;
        
    }

    [GetGlueSegment setImage:[UIImage imageNamed:@"ProfileSegSel.png"]forSegmentAtIndex:0];
    [GetGlueSegment setImage:[UIImage imageNamed:@"SegGlueMe.png"]forSegmentAtIndex:1];
    
}



-(IBAction)SegmentChanged:(id)Sender{
    
        if(GetGlueSegment.selectedSegmentIndex == 0)
        {
            glueMeView.hidden = YES; 
            myprofileView.hidden = NO;
            
            [GetGlueSegment setImage:[UIImage imageNamed:@"ProfileSegSel.png"]forSegmentAtIndex:0];
            [GetGlueSegment setImage:[UIImage imageNamed:@"SegGlueMe.png"]forSegmentAtIndex:1];
        }
        else
        {
            glueMeView.hidden = NO;
            myprofileView.hidden = YES;
            
            [GetGlueSegment setImage:[UIImage imageNamed:@"ProfileSeg.png"]forSegmentAtIndex:0];
            [GetGlueSegment setImage:[UIImage imageNamed:@"SegGlueMeSel.png"]forSegmentAtIndex:1];
        }
   
    
    
}

-(IBAction)onEmail:(id)sender{
    
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		// We must always check whether the current device is configured for sending emails
		if ([mailClass canSendMail])
		{
			[self displayComposerSheet];
		}
		else
		{
			[self launchMailAppOnDevice];
		}
	}
	else
	{
		[self launchMailAppOnDevice];
	}
    
    
}


-(void)launchMailAppOnDevice {
	NSString *recipients = @"mailto:first@example.com?cc=second@example.com,third@example.com&subject=Hello from India!";
	NSString *body = @"&body=It is raining in vikas india!";
	
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}


-(void)displayComposerSheet {
	
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	[picker setSubject:@" "];
	
	NSString *emailBody = @"";
	[picker setMessageBody:emailBody isHTML:NO];
	
	[self presentModalViewController:picker animated:YES];
    [picker release];
}
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {	
	
	[self dismissModalViewControllerAnimated:YES];
	
	
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
	
	
}




-(IBAction)OnTimeSelected
{
    
    /*
     actionsheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Done" destructiveButtonTitle:nil otherButtonTitles:nil];	
     // Add the picker
     pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0,65,0,0)];
     pickerView.delegate = self;
     [pickerView setShowsSelectionIndicator:YES];
     pickerView.userInteractionEnabled = TRUE;
     //    pickerView.datePickerMode = UIDatePickerModeDate;
     //self.pickerView = pickerView;
     [actionsheet addSubview:pickerView];
     [actionsheet showInView:self.view];
     [actionsheet setBounds:CGRectMake(0,0,320, 450)];	
     [pickerView release];
     [actionsheet release];		
     */
    
    
    
    if (!actionSheetCBrand) {
        
        actionSheetCBrand = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
        [actionSheetCBrand setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
        
        CGRect pickerFrame;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            pickerFrame = CGRectMake(0, 40, 768, 300);
        else
            pickerFrame = CGRectMake(0, 40, 320, 200);
        
        pickerViewCBrand = [[UIPickerView alloc] initWithFrame:pickerFrame];
        pickerViewCBrand.showsSelectionIndicator = YES;
        pickerViewCBrand.userInteractionEnabled = TRUE;
        pickerViewCBrand.dataSource = self;
        pickerViewCBrand.delegate = self;
        [actionSheetCBrand addSubview:pickerViewCBrand];
        
        UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Close"]];
        closeButton.momentary = YES; 
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            closeButton.frame = CGRectMake(700, 7.0f, 50.0f, 30.0f);
        else 
            closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
        
        
        closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
        closeButton.tintColor = [UIColor blackColor];
        [closeButton addTarget:self action:@selector(dismissActionSheet) forControlEvents:UIControlEventValueChanged];
        [actionSheetCBrand addSubview:closeButton];
        [closeButton release];
        
        
        CGRect frame;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            frame = CGRectMake(self.view.frame.origin.x, 630, 768.0f,350.0f);
        else
            frame = CGRectMake(self.view.frame.origin.x, 160, 480.0f,300.0f);
        
        [actionSheetCBrand setFrame:frame]; 
        [self.view addSubview:actionSheetCBrand];
        
        
    }
    
    
    
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
    [durationBtn setTitle:[durationArray objectAtIndex:row] forState:normal];
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [durationArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [durationArray objectAtIndex:row];
}


-(IBAction)onText:(id)sender{
	textSendObj = [[TextSendView alloc]initWithNibName:@"TextSendView" bundle:nil];
	[self presentModalViewController:textSendObj animated:YES];
}
-(IBAction)onGlueMe:(id)sender{
    NSString *loginid=[[NSUserDefaults standardUserDefaults]valueForKey:@"Login"];
    //loginid=@"2";
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/send_request.php?user_id=%@&frnd_id=%@",loginid,appDelegateObj.strid];
    
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];

}

-(IBAction)onCustomize:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"customize here" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}
-(IBAction)oncancel:(id)sender{
    
    // [self.navigationController popViewControllerAnimated:YES];
}
-(void)datafatch:(NSDictionary*)dictionary{
    
    NSString *error;
    
    error = [[NSString alloc] initWithFormat:@"%@",[dictionary valueForKey:@"msg"]];
    if([error isEqualToString:@"Request sent Successfully"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Your Request has been sent successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Request can not sent please try again" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //[alert setTag:1];
        [alert show];
        [alert release];
        
    }
}
-(IBAction)onSend:(id)sender{
    NSString *loginid=[[NSUserDefaults standardUserDefaults]valueForKey:@"Login"];
    //loginid=@"2";
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/send_request.php?user_id=%@&frnd_id=%@",loginid,appDelegateObj.strid];
    
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];
    
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
