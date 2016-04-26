//
//  ContactDetailView.m
//  glueme
//
//  Created by APPLE  on 9/21/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import "ContactDetailView.h"
#import "whogluedmap.h"
#import "AlertHandler.h"
#import "GdataParser.h"
#import "FAQHelp.h"

@implementation ContactDetailView
@synthesize myprofileView,glueMeView,GlueMeProfileSegment,durationBtn,durationArray,eMailIdLbl,TitleLbl,BtnGluemeCheck,BtnTextCheck,BtnEmailCheck,LblGMVwName,NameLabel,PhnNoLabel,BdateLabel,GmImg,emailImg,txtVwAbotMe,myProVwImg,GlueMeVwImg;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)onMap:(id)sender{
	
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
   
    
   // whoGlueObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
	appDelegateObj.count = 0;
     [self.navigationController pushViewController:mymapObj animated:NO];
//	whogluedmap	*gluemap=[[whogluedmap alloc]initWithNibName:@"whogluedmap" bundle:nil];
	//[self.navigationController pushViewController:whoGlueObj animated:YES];
//	[gluemap release];
	
	
}

-(IBAction)setmeeting
{
    
    appDelegateObj.selectedFrnd = [NSString stringWithFormat:@""];
    meetingpointview *obj = [[meetingpointview alloc]init];
    [self.navigationController pushViewController:obj animated:YES];
    
//    listVwObj = [[listwhoglued alloc] initWithNibName:@"listwhoglued" bundle:nil];
//    [self.navigationController pushViewController:listVwObj animated:NO];
}

- (void)dealloc
{
    [durationBtn release];
    [GlueMeProfileSegment release];
    [myprofileView release];
    [glueMeView release];
    [super dealloc];
}

-(IBAction)SegmentChanged:(id)Sender{
    if(GlueMeProfileSegment.selectedSegmentIndex == 0)
    {
        glueMeView.hidden = YES; 
        myprofileView.hidden = NO;
        
        [GlueMeProfileSegment setImage:[UIImage imageNamed:@"ProfileSegSel.png"]forSegmentAtIndex:0];
        [GlueMeProfileSegment setImage:[UIImage imageNamed:@"SegGlueMe.png"]forSegmentAtIndex:1];
    }
    else
    {
        glueMeView.hidden = NO;
        myprofileView.hidden = YES;
        
        [GlueMeProfileSegment setImage:[UIImage imageNamed:@"ProfileSeg.png"]forSegmentAtIndex:0];
        [GlueMeProfileSegment setImage:[UIImage imageNamed:@"SegGlueMeSel.png"]forSegmentAtIndex:1];
        
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


-(IBAction)GlueMeCheckClicked:(id)sender
{
    if (BtnGluemeCheck.isSelected) {
        [BtnGluemeCheck setSelected:FALSE];
        [GmImg setImage:[UIImage imageNamed:@"GMTxtW.png"]];
    }
    else
    {
         [BtnGluemeCheck setSelected:TRUE];
        [GmImg setImage:[UIImage imageNamed:@"GMTxt.png"]];
        
    }
}

-(IBAction)TextCheckClicked:(id)sender
{
    if (BtnTextCheck.isSelected) {
        [BtnTextCheck setSelected:FALSE];
        
    }
    else
    {
        [BtnTextCheck setSelected:TRUE];
        
    }
}

-(IBAction)EmailCheckClicked:(id)sender
{
    if (BtnEmailCheck.isSelected) {
        [BtnEmailCheck setSelected:FALSE];
        [emailImg setImage:[UIImage imageNamed:@"EmailTxtW.png"]];
    }
    else
    {
        [BtnEmailCheck setSelected:TRUE];
        [emailImg setImage:[UIImage imageNamed:@"EmailTxt.png"]];
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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"You Glued." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

-(IBAction)onCustomize:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Under Construction" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}
-(IBAction)oncancel:(id)sender{
    
   // [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)onInvite:(id)sender{
    if (BtnEmailCheck.isSelected) {
        [self PassData];
    }
    if (BtnGluemeCheck.isSelected) {
        [self PassToGlueMe];
    }
}

-(IBAction)MessageSend:(id)sender{
    
	MFMessageComposeViewController *controller = [[[MFMessageComposeViewController alloc] init] autorelease];
	if([MFMessageComposeViewController canSendText])
	{
		controller.body = @"Hello from Mugunth";
		controller.recipients = [NSArray arrayWithObjects:appDelegateObj.phnStr, nil];
		controller.messageComposeDelegate = self;
		[self presentModalViewController:controller animated:YES];
	}
    
	
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
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


-(void)PassToGlueMe
{
    [appDelegateObj getGluedCount];
    
    if (appDelegateObj.GluedCnt <1) {
    
    int d;
    if ([durationBtn.currentTitle isEqualToString:@"24 hours"]) {
        d=24;
    }
    if ([durationBtn.currentTitle isEqualToString:@"48 hours"]) {
        d=48;
    }
    if ([durationBtn.currentTitle isEqualToString:@"12 hours"]) {
        d=12;
    }
    if ([durationBtn.currentTitle isEqualToString: @"6 hours"]) {
        d=6;
    }
    if ([durationBtn.currentTitle isEqualToString: @"Forever"]) {
        d=50;
    }
    NSLog(@"%@",appDelegateObj.selectedUser);
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/send_glueme_req.php?user_id=%i&frnd_id=%@&glueme_time=%i",appDelegateObj.userID,appDelegateObj.strid,d];  
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(GlueMeRequestFatch:) andHandler:self];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"You can't be glued with more than 5 people." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }

}

-(void)GlueMeRequestFatch:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);
    
    NSLog(@"%@",[dictionary objectForKey:@"msg1"]);
    NSString *GMsg =[dictionary objectForKey:@"msg1"];
    
    NSLog(@"%@",[dictionary objectForKey:@"msg"]);
    NSString *FMsg = [dictionary objectForKey:@"msg"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:GMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Info" message:FMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert1 show];
    [alert1 release];


}

-(void)PassData
{
    [AlertHandler showAlertForProcess];
    
    //    NSLog(@"%@",[NSString stringWithFormat:@"%d",objAppdel.userId]);
    //    NSLog(@"%@",[NSString stringWithFormat:@"%d",objAppdel.chatWithUserId]);
    //    NSLog(@"%@",ChatTxt.text);
    //    
    //    NSString *encodedString = [ChatTxt.text stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    //    NSLog(@"%@",encodedString);
    //    
    NSLog(@"%@",eMailIdLbl.text);
	NSString *RegURL = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/send_invitation.php?email=%@",eMailIdLbl.text];
    //NSString *RegURL = [NSString stringWithFormat:@"http://openxcellaus.info/leopard/chatting.php?from_user_id=7&to_user_id=8&text=heyfrndssssssss"];
    
	//    NSString *RegURL = @"http://www.openxcellaus.info/leopard/near_by_users.php?lat=23.41670000&long=72.91670000";
    
    
	GdataParser *parser = [[GdataParser alloc] init];
	[parser downloadAndParse:[NSURL URLWithString:RegURL] 
				 withRootTag:@"Record"
					withTags:[NSDictionary dictionaryWithObjectsAndKeys:@"msg",@"msg",nil] 
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
    if ([temp isEqualToString:@"Please Enter valid Email Id"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Please Enter valid Email Id" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"This contact person is invited." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    self.navigationController.navigationBar.alpha = 0.0;
    
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
    topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
        [topbarImg setImage:[UIImage imageNamed:@"GreyTopBar.png"]];
        [GlueMeVwImg setImage:[UIImage imageNamed:@"GreyBkGround.png"]];
        [myProVwImg setImage:[UIImage imageNamed:@"GreyBkGround.png"]];
        
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"PurpleTopBar.png"]];
        [GlueMeVwImg setImage:[UIImage imageNamed:@"purpleBkGround.png"]];
        [myProVwImg setImage:[UIImage imageNamed:@"purpleBkGround.png"]];
        
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"OrangeTopBar.png"]];
       
        [GlueMeVwImg setImage:[UIImage imageNamed:@"OrangeBkGround.png"]];
        [myProVwImg setImage:[UIImage imageNamed:@"OrangeBkGround.png"]];
       
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"BlackTopBar.png"]];
        [GlueMeVwImg setImage:[UIImage imageNamed:@"blackBkGround.png"]];
        [myProVwImg setImage:[UIImage imageNamed:@"blackBkGround.png"]];
        
       
    }
    else
    {
        [topbarImg setImage:[UIImage imageNamed:@"Group9.png"]];
       
        [GlueMeVwImg setImage:[UIImage imageNamed:@"back.2.png"]];
        [myProVwImg setImage:[UIImage imageNamed:@"back.2.png"]];
    }
    
    
    [self.view addSubview:topbarImg];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(5,10, 76, 28);
    
    [backBtn addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    BumpBtn.frame = CGRectMake(268,10, 35, 34);
    
    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:BumpBtn]; 
    
    [self.view addSubview:backBtn]; 

    
    appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication]delegate];
    MyContactObj = [[MyContactScreen alloc] initWithNibName:@"MyContactScreen" bundle:nil];
        
   // [durationBtn bringSubviewToFront:durationBtn.imageView];
    
    
    
        durationArray = [[NSMutableArray alloc] init];
    [durationArray addObject:@"Forever"];
    [durationArray addObject:@"48 hours"];
    [durationArray addObject:@"24 hours"];
    [durationArray addObject:@"12 hours"];
    [durationArray addObject:@"6 hours"];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
//    UIImageView *topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
        [topbarImg setImage:[UIImage imageNamed:@"GreyTopBar.png"]];
        [GlueMeVwImg setImage:[UIImage imageNamed:@"GreyBkGround.png"]];
        [myProVwImg setImage:[UIImage imageNamed:@"GreyBkGround.png"]];
        
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"PurpleTopBar.png"]];
        [GlueMeVwImg setImage:[UIImage imageNamed:@"purpleBkGround.png"]];
        [myProVwImg setImage:[UIImage imageNamed:@"purpleBkGround.png"]];
       
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"OrangeTopBar.png"]];
        [GlueMeVwImg setImage:[UIImage imageNamed:@"OrangeBkGround.png"]];
        [myProVwImg setImage:[UIImage imageNamed:@"OrangeBkGround.png"]];
        
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"BlackTopBar.png"]];
        [GlueMeVwImg setImage:[UIImage imageNamed:@"blackBkGround.png"]];
        [myProVwImg setImage:[UIImage imageNamed:@"blackBkGround.png"]];
            }
    else
    {
        [topbarImg setImage:[UIImage imageNamed:@"Group9.png"]];
        [GlueMeVwImg setImage:[UIImage imageNamed:@"back.2.png"]];
        [myProVwImg setImage:[UIImage imageNamed:@"back.2.png"]];

    }
    
    
//    [self.view addSubview:topbarImg];
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
    
    glueMeView.hidden = YES; 
    myprofileView.hidden = NO;
    
    [GlueMeProfileSegment setImage:[UIImage imageNamed:@"ProfileSegSel.png"]forSegmentAtIndex:0];
    [GlueMeProfileSegment setImage:[UIImage imageNamed:@"SegGlueMe.png"]forSegmentAtIndex:1];

    
    if ([appDelegateObj.selectpage isEqualToString:@"SearchTbl"]) {
        NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/glueme/user_details_by_visibility.php?user_id=%i&frnd_id=%@",appDelegateObj.userID,appDelegateObj.strid];  
        
        
        NSLog(@"%@",urlString);
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        
        JSONParser *parser;
        parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(SearchDataFatch:) andHandler:self];
    }
    else
    {
    
    LblGMVwName.text = appDelegateObj.selectedUser;
    NameLabel.text = appDelegateObj.selectedUser;
    PhnNoLabel.text = appDelegateObj.SelectedPhnNo;
    BdateLabel.text = appDelegateObj.selectedBdate;
    NSLog(@"%@",appDelegateObj.SelectedEmail);
    eMailIdLbl.text = appDelegateObj.SelectedEmail;
    [GlueMeProfileSegment setImage:[UIImage imageNamed:@"ProfileSegSel.png"]forSegmentAtIndex:0];
    [GlueMeProfileSegment setImage:[UIImage imageNamed:@"SegGlueMe.png"]forSegmentAtIndex:1];
    }
    
}

-(void)SearchDataFatch:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);
    NameLabel.text = [dictionary objectForKey:@"firstname"];
    LblGMVwName.text = [dictionary objectForKey:@"firstname"];
    eMailIdLbl.text = [dictionary objectForKey:@"email"];
    PhnNoLabel.text = [dictionary objectForKey:@"phone"];
    BdateLabel.text = [dictionary objectForKey:@"bday"];
    txtVwAbotMe.text = [dictionary objectForKey:@"about_me"];
    
}

-(void)Back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)onFAQ:(id)sender
{
	FAQHelp *faqhelp=[[FAQHelp alloc]initWithNibName:@"FAQHelp" bundle:nil];
	[self.navigationController pushViewController:faqhelp animated:YES];
	[faqhelp release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
