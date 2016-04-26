//
//  phoneBookDetail.m
//  glueme
//
//  Created by APPLE  on 9/21/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import "phoneBookDetail.h"
#import "whogluedmap.h"
#import "AlertHandler.h"
#import "GdataParser.h"
#import "FAQHelp.h"

@implementation phoneBookDetail
@synthesize eMailIdLbl,nameLbl,contNo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil :(NSString *)str
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        ProfName = str;
        NSLog(@"%@",ProfName);
    }
    return self;
}
-(IBAction)onMap:(id)sender{
    
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
   
	
//	whoGlueObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
	//whogluedmap	*gluemap=[[whogluedmap alloc]initWithNibName:@"whogluedmap" bundle:nil];
    appDelegateObj.count = 0;
     [self.navigationController pushViewController:mymapObj animated:NO];
///	[self.navigationController pushViewController:whoGlueObj animated:YES];
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

- (void)dealloc
{
    [super dealloc];
}

-(IBAction)onText:(id)sender{
    
        
        MFMessageComposeViewController *controller = [[[MFMessageComposeViewController alloc] init] autorelease];
        if([MFMessageComposeViewController canSendText])
        {
            controller.body = @"Hello from Mugunth";
            controller.recipients = [NSArray arrayWithObjects:appDelegateObj.phnStr, nil];
            controller.messageComposeDelegate = self;
            [self presentModalViewController:controller animated:YES];
        }
        
        
       
//	textSendObj = [[TextSendView alloc]initWithNibName:@"TextSendView" bundle:nil];
//	[self presentModalViewController:textSendObj animated:YES];
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


//-(IBAction) actionFeedback :(id) sender {
//	/*if(!objFeedback)
//     objFeedback =[[FeedbackController alloc] initWithNibName:@"FeedbackController" bundle:nil];
//     
//     [self.navigationController pushViewController:objFeedback animated:YES];*/
//	
//	
//	
//	Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
//	if (mailClass != nil)
//	{
//		// We must always check whether the current device is configured for sending emails
//		if ([mailClass canSendMail])
//		{
//			[self displayComposerSheet];
//		}
//		else
//		{
//			[self launchMailAppOnDevice];
//		}
//	}
//	else
//	{
//		[self launchMailAppOnDevice];
//	}
//}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {	
	
	[self dismissModalViewControllerAnimated:YES];
	
	
}


//- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
//	
//	
//}



-(IBAction)oncancel:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)onInvite:(id)sender{
//    http://www.openxcellaus.info/glueme/send_request.php?user_id=1&email=krupal@openxcelltechnolabs.com
    
    [appDelegateObj getGluedCount];
    
    if (appDelegateObj.GluedCnt <1) {
    
    NSString *loginid=[[NSUserDefaults standardUserDefaults]valueForKey:@"Login"];
    //loginid=@"2";
    
    
    
    if([appDelegateObj.selectpage isEqualToString:@"contactdetail"])
    {
        NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/send_request.php?user_id=%@&frnd_id=%@",loginid,appDelegateObj.strid];
        
        
        
        NSLog(@"%@",urlString);
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        
        JSONParser *parser;
        parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];

    
    }
    else{
    
        NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/send_request.php?user_id=%@&email=%@",loginid,eMailIdLbl.text];
        
        
        
        
        
        NSLog(@"%@",urlString);
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        
        JSONParser *parser;
        parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];

        
    }
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"You can't be glued with more than 5 people." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];

    }
    //[self PassData];
}
-(void)datafatch:(NSDictionary*)dictionary{
    
    NSString *error;

    error = [[NSString alloc] initWithFormat:@"%@",[dictionary valueForKey:@"msg"]];
    if([appDelegateObj.selectpage isEqualToString:@"contactdetail"])
    {
        
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
    else{
    
        if([error isEqualToString:@"Invitation Email sent to this user"])
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
    //Invitation Email sent to this user
    
    
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
	NSString *RegURL = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/send_invitation.php?email=krupal.1011@gmail.com",eMailIdLbl.text];
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
    
    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    BumpBtn.frame = CGRectMake(268,10, 35, 34);
    
    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:BumpBtn]; 
    
    [self.view addSubview:backBtn]; 
    

    
    appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication]delegate];
        
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
//    

    }
    
    NSLog(@"%@",appDelegateObj.selectedUser);
     NSLog(@"%@",appDelegateObj.SelectedPhnNo);
     NSLog(@"%@",appDelegateObj.SelectedEmail);
    
    if([appDelegateObj.selectpage isEqualToString:@"contactdetail"])
    {
    nameLbl.text=appDelegateObj.selectedUser;
    contNo.text=appDelegateObj.SelectedPhnNo;
    eMailIdLbl.text=appDelegateObj.SelectedEmail;
    
    }
    else{
        nameLbl.text=appDelegateObj.selectedUser;
        contNo.text=[NSString stringWithFormat:@"%@",appDelegateObj.SelectedPhnNo];
        eMailIdLbl.text=[NSString stringWithFormat:@"%@",appDelegateObj.SelectedEmail];

    
    
    
//    nameLbl.text = ProfName;
//    NSLog(@"%@",[appDelegateObj.phoneBkDict objectForKey:ProfName]);
//    NSMutableArray *tempArray;
//    tempArray = [appDelegateObj.phoneBkDict objectForKey:ProfName];
//    contNo.text = [tempArray objectAtIndex:0];
//     NSLog(@"%@",[appDelegateObj.phoneBkDict objectForKey:ProfName]);
//    NSMutableArray *emailArray;
//    emailArray = [appDelegateObj.EmailDict objectForKey:ProfName];
//    eMailIdLbl.text = [emailArray objectAtIndex:0];

    }
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
