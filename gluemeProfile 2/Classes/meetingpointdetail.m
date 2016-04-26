//
//  meetingpointdetail.m
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

//
//  meetingpointdetail.m
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import "meetingpointdetail.h"
#import "whogluedmap.h"
#import "FAQHelp.h"
#import "AlertHandler.h"

@implementation meetingpointdetail
@synthesize placeLbl,dateBtn,meetingPPl,endTime,isdateSelected,istimeSelected;

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
	
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
   
    
   // whoGlueVwObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
	appDelegateObj.count = 0;
     [self.navigationController pushViewController:mymapObj animated:NO];
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    appDelegateObj = (gluemeAppDelegate*)[[UIApplication sharedApplication]delegate];
   // ObjAddfrnd = [[addfriend alloc] initWithNibName:@"addfriend" bundle:nil];
    meetingPPl = [[NSMutableArray alloc] init];
   // listVwObj = [[listwhoglued alloc] initWithNibName:@"listwhoglued" bundle:nil];
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
    
    [meetingPPl addObject:[NSString stringWithFormat:@"%@",appDelegateObj.currentUserName]];
    
    if ([appDelegateObj.selectedFrnd isEqualToString:@""]) {
        
    }
    else
    {
     [meetingPPl addObject:[NSString stringWithFormat:@"%@",appDelegateObj.selectedFrnd]];
    }
    
    NSLog(@"%d",[meetingPPl count]);  
       appDelegateObj.stremaillist=[appDelegateObj.stremaillist stringByAppendingFormat:@",%@",[NSString stringWithFormat:@"%@",appDelegateObj.stremailselect0]];
    appDelegateObj.strIdList = [appDelegateObj.strIdList stringByAppendingFormat:@",%@",[NSString stringWithFormat:@"%@",appDelegateObj.strIdsel0]];
    
    [super viewDidLoad];
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


-(void)viewWillAppear:(BOOL)animated{
    
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
//        UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        BumpBtn.frame = CGRectMake(268,10, 35, 34);
//        
//        [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self.view addSubview:BumpBtn]; 
//        
//        [self.view addSubview:backBtn];
    }
    
    if (appDelegateObj.isaddfrnd) {
        [meetingPPl addObject:appDelegateObj.addedFrnd];
        NSLog(@"Emails5%@",appDelegateObj.stremaillist);
        
        appDelegateObj.stremaillist=[appDelegateObj.stremaillist stringByAppendingFormat:@",%@",[NSString stringWithFormat:@"%@",appDelegateObj.stremailselect]];
        
           appDelegateObj.strIdList=[appDelegateObj.strIdList stringByAppendingFormat:@",%@",[NSString stringWithFormat:@"%@",appDelegateObj.strIdSelect]];
        
        NSLog(@"FinalEmails%@",appDelegateObj.stremaillist);
        NSLog(@"FinalIdStr%@",appDelegateObj.strIdList);
        appDelegateObj.isaddfrnd = FALSE;
        
    }
        
    
    [tbl reloadData];

          

    UIImageView *tblImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
    [tblImg setImage:[UIImage imageNamed:@"tblBg.png"]];
    
    placeLbl.text = appDelegateObj.placeString;
    
    [tbl setBackgroundView:tblImg];
    
    [tbl reloadData];
}

-(IBAction)DoneBtnClick
{  
    //[self getFriendDetail];
    
    if ([meetingPPl count] == 1) {
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"" message:@"Please select other person for meeting" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert1 show];
        [alert1 release];
    }
    else
    {
        if (isdateSelected && istimeSelected) {
            
            
            
            [self EmailSent];
        }
        else
        {
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"" message:@"Please select date and time both for meeting" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert1 show];
            [alert1 release];

        }
    //
    }
   // http://www.openxcellaus.info/glueme/send_request.php?user_id=1&frnd_id=5

}

-(void)EmailSent
{
    NSString *dateStr;
    NSString *dateStr1;
    
    if ([dateBtn.currentTitle isEqualToString:@"select date"]) {
        dateStr = @" ";
        dateStr1 = @" ";
    }
    else
    {
        dateStr = [NSString stringWithFormat:@"%@ %@",dateBtn.currentTitle,timeLbl.text];
        dateStr1 = [NSString stringWithFormat:@"%@ %@",dateBtn.currentTitle,endTime.currentTitle];
    }
    
     lblemaillist.text=appDelegateObj.stremaillist;
    
    NSLog(@"FinalEmails  : %@",appDelegateObj.stremaillist);
    NSLog(@"FinalIdStr  : %@",appDelegateObj.strIdList);
    
//    NSString *strtime = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)timeLbl.text, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    
    NSString *strStartdate = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)dateStr, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    
    NSString *strEnddate = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)dateStr1, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    
   NSString *strplace = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)placeLbl.text, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    
//     NSString *strplace = [placeLbl.text stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
//    NSLog(strplace);
    
    NSString *stremail = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)lblemaillist.text, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    
    //appDelegateObj.stremaillist
    
    [AlertHandler showAlertForProcess];
    
   // http://www.openxcellaus.info/glueme/send_request.php?user_id=15&frnd_id=4,9&email=krupal.1011@gmail.com&start_date_time=2011-12-16%2009:30:00&end_date_time=2011-12-16%2009:30:00&place=ghandhinagar
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/send_request.php?user_id=%i&frnd_id=%@&email=%@&start_date_time=%@&end_date_time=%@&place=%@",appDelegateObj.userID,appDelegateObj.strIdList,stremail,strStartdate,strEnddate,strplace];
    
    //http://www.openxcellaus.info/glueme/send_request.php?user_id=9&frnd_id=1&email=frtjr&time=&date=select%20date&place=Ahmedabad
    
    NSLog(@"%@",urlString);
    
   
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding]];
    
    NSLog(@"%@",url);

    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(finishGetData:) andHandler:self];
    

}

-(IBAction)cancelBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
/*
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
    
    currentUserName = [tempdic objectForKey:@"firstname"];
    userEmail = [tempdic objectForKey:@"email"];
    //currentUserName = [[dictionary valueForKey:@"Record"] valueForKey:@"firstname"] ;
    //stremaillist=userEmail;
    NSLog(@"%@",currentUserName);
    NSLog(@"%@",userEmail);
    stremaillist=[stremaillist stringByAppendingFormat:@",%@",[NSString stringWithFormat:@"%@",userEmail]];
       
    lblemaillist.text=stremaillist;
    
    
    if (appDelegateObj.isaddfrnd) {
        [meetingPPl addObject:appDelegateObj.addedFrnd];
        NSLog(@"Emails5%@",stremaillist);
        
        stremaillist=[stremaillist stringByAppendingFormat:@",%@",[NSString stringWithFormat:@"%@",appDelegateObj.stremailselect]];
        lblemaillist.text=stremaillist;
        
        NSLog(@"FinalEmails%@",stremaillist);
        appDelegateObj.isaddfrnd = FALSE;
        
    }
    else{
        //[meetingPPl addObject:[NSString stringWithFormat:@"%@",currentUserName]];
        
    }
    
    
    [tbl reloadData];
    
}
 */
/*
 http://www.openxcellaus.info/glueme/send_request.php?user_id=1&email=krupal.1011@gmail.com,krupal.1011@gmail.com&time=15:30&date=10-11-1987&place=abad
 */

//-(void)PassDatafrnd
//{
//    
//    [AlertHandler showAlertForProcess];
//    
//    //    NSLog(@"%@",[NSString stringWithFormat:@"%d",objAppdel.userId]);
//    //    NSLog(@"%@",[NSString stringWithFormat:@"%d",objAppdel.chatWithUserId]);
//    //    NSLog(@"%@",ChatTxt.text);
//    //    
//    //    NSString *encodedString = [ChatTxt.text stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
//    //    NSLog(@"%@",encodedString);
//    //    
//    
//    int userid;
//    userid = [[[NSUserDefaults standardUserDefaults] objectForKey:appDelegateObj.selectedFrnd] intValue];
//    
//      
//    NSString *strtime = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)timeLbl.text, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
//    
//    
//    NSString *strdate = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)dateBtn.currentTitle, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
//    
//    NSString *plce = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)placeLbl.text, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
//    
//    
//    NSString *RegURL = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/send_request.php?user_id=%@&email=%@,kartik@openxcelltechnolabs.com&time=%@&date=%@&place=%@",appDelegateObj.userID,emailId,strtime,strdate,plce];
//     
//    NSURL *url = [NSURL URLWithString:[RegURL stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
//    
//    
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
//    
//    JSONParser *parser;
//    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(finishGetData:) andHandler:self];
//}

-(NSString *)urlEncodeValue:(NSString *)str4
{
    
    NSString *result = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str4, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    return [result autorelease];
    
}

//-(void)getFriendDetail
//{
//			
//	
//
//    NSString *urlString1 = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/user_list.php?user_id=%@",[[NSUserDefaults standardUserDefaults]objectForKey:appDelegateObj.selectedFrnd]];
//    
//    
//    NSLog(@"%@",urlString1);
//    
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString1]];
//    
//    JSONParser *parser;
//    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatchFrnd:) andHandler:self];
//    
//    
//
//}
//
//-(void)datafatchFrnd:(NSDictionary*)dictionary{
//    
//    //    contactArray = [[NSMutableArray alloc] init];
//    //    selArray alloc] init];
//    //    contactnum = [[NSMutableArray alloc] init];
//    //    contactemail = [[NSMutableArray alloc] init];
//    
//    NSLog(@"%@",dictionary);
//    NSMutableArray *tempArray;
//    tempArray = [[NSMutableArray alloc] init];
//    tempArray =[dictionary valueForKey:@"Record"];
//    NSLog(@"%@",tempArray);
//    NSMutableDictionary *tempdic;
//    tempdic = [tempArray objectAtIndex:0];
//    
//    emailId = [tempdic objectForKey:@"email"];
//    NSLog(@"%@",emailId);
//    stremaillist=@"";
//    
//    stremaillist=[stremaillist stringByAppendingFormat:@"%@",[NSString stringWithFormat:@"%@", emailId]];
//    NSLog(@"Email%@",stremaillist);
//    
//    [tbl reloadData];
//    [self PassDatafrnd];
//}


-(void)finishGetData:(NSDictionary*)dictionary{
	[AlertHandler hideAlert];
    
    NSLog(@"%@",dictionary);
    
    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"" message:[dictionary objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert1 show];
    [alert1 release];
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[dictionary objectForKey:@"noti_msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//    [alert show];
//    [alert release];
    
   // [self SendNotification];
       //for notification
}

-(void)SendNotification
{
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/send_request.php?user_id=147&frnd_id=148"];
    
    
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(finishGetData1:) andHandler:self];
    

}

-(void)finishGetData1:(NSDictionary*)dictionary{


UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[dictionary objectForKey:@"noti_msg"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
[alert show];
[alert release];

}
-(IBAction)DateSelection
{
    isdateSelected = TRUE;
    dateActionsheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Done" destructiveButtonTitle:nil otherButtonTitles:nil];	
    // Add the picker
    UIDatePicker *pickerView = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,65,0,0)];
    pickerView.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker = pickerView;
    datePicker.minimumDate = [NSDate date];
    [dateActionsheet addSubview:pickerView];
    [dateActionsheet showInView:self.view];
    [dateActionsheet setBounds:CGRectMake(0,0,320, 480)];	
    [pickerView release];
    [dateActionsheet release];		
}

-(IBAction)EndTimeSelect
{
    istimeSelected = TRUE;
    TimeActionsheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Done" destructiveButtonTitle:nil otherButtonTitles:nil];	
    // Add the picker
    UIDatePicker *pickerViewTime = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,65,0,0)];
    pickerViewTime.datePickerMode = UIDatePickerModeTime;
    
    timePicker = pickerViewTime;
    timePicker.minimumDate = startingTime;
    [TimeActionsheet addSubview:pickerViewTime];
    [TimeActionsheet showInView:self.view];
    [TimeActionsheet setBounds:CGRectMake(0,0,320, 480)];	
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"da_DK"];
    [timePicker setLocale:locale];
    [locale release];
    [pickerViewTime release];
    [TimeActionsheet release];		
}


-(IBAction)pickerChanged:(id)sender{
    
	NSDate *date = [datePicker date];
//    if ([datePicker date] < [NSDate date]) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Invalid date" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
//        [alert release];
//
//    }
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"dd-MM-yyyy"];
	[dateBtn setTitle:[formatter stringFromDate:date] forState:UIControlStateNormal];
	
}

-(void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger) buttonIndex{	
    
    if (actionSheet == dateActionsheet) {
       
    NSDate *date = [datePicker date];
        
        startingTime = [[datePicker date] copy];
        
//        if ([datePicker date] < [NSDate date]) {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Invalid date" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//            [alert show];
//            [alert release];
//            
//        }

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"d-MM-yyyy"];
    [dateBtn setTitle:[formatter stringFromDate:date] forState:UIControlStateNormal];
    
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"hh:mm:ss"];
    timeLbl.text = [formatter1 stringFromDate:date];
    }
    else
    {
        NSDate *time = [timePicker date];
        NSLog(@"%@",time);
        NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
        [formatter2 setDateFormat:@"hh:mm:ss"];
                
        NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
        [dateFormatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"] autorelease]];
        [dateFormatter setDateFormat:@"hh:mm:ss"];
        
        NSDate* firstDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",timeLbl.text]];
        NSDate* secondDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",[[formatter2 stringFromDate:time]copy]]];
        
        NSTimeInterval timeDifference1 = [secondDate timeIntervalSinceDate:firstDate];
        
        if (timeDifference1 > 0) {
            [endTime setTitle:[[formatter2 stringFromDate:time]copy] forState:UIControlStateNormal];
            [endTime setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        else if (timeDifference1 == 0)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Invalid Time." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Invalid Time.Please select meeting starting date and time." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
        }
        
       
    }
    
    //		dueDateBtn.titleLabel.text = [formatter stringFromDate:date];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (actionSheet == dateActionsheet) {    
    NSDate *date = [datePicker date];
        
        NSLog(@"%@",[datePicker date]);
        startingTime = [[datePicker date] copy];
        NSLog(@"%@",[NSDate date]);
        
//        if ([datePicker date] < [NSDate date]) {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Invalid date" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//            [alert show];
//            [alert release];
//            
//        }

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    [dateBtn setTitle:[formatter stringFromDate:date] forState:UIControlStateNormal];
    //[dueDateBtn setTitle:[formatter stringFromDate:date] forState:UIControlStateNormal];
    }
    else
    {
        NSDate *time = [timePicker date];
        NSLog(@"%@",time);
        NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
        [formatter2 setDateFormat:@"hh:mm:ss"];
        
//        [endTime setTitle:[[formatter2 stringFromDate:time]copy] forState:UIControlStateNormal];
//        [endTime setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    }
    
    
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

-(IBAction)btnadd_clicked
{
	addfriend *obj = [[addfriend alloc]init];
    appDelegateObj.addedFrnd = @"";
	[self.navigationController pushViewController:obj animated:YES];
	
	
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return [meetingPPl count];
    
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    UIImageView *tableSapImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 44,230, 1)];
    [tableSapImg setImage:[UIImage imageNamed:@"mtngTblSaperator.png"]];
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    // cell.textLabel.text = @"John Carter";
    
    cell.selectionStyle = UITableViewCellEditingStyleNone;
	cell.textLabel.font = [UIFont fontWithName:@"arial" size:18];
	//cell.textLabel.textColor=[UIColor whiteColor];
	cell.textLabel.text = [meetingPPl objectAtIndex:indexPath.row];
    
	//cell.detailTextLabel.text= @"-downtown";
	//cell.detailTextLabel.textColor = [UIColor whiteColor];
	//cell.contentView.backgroundColor=[UIColor clearColor];
    [cell.contentView addSubview:tableSapImg];
	cell.textLabel.backgroundColor=[UIColor clearColor];
	cell.detailTextLabel.backgroundColor=[UIColor clearColor];
	
    //    UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    //    [cellImg setImage:[UIImage imageNamed:@"contactCellImg.png"]];
    //    cell.backgroundView = cellImg;
    //     
    //    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
	//meetingpointdetail *obj = [[meetingpointdetail alloc]init];
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
