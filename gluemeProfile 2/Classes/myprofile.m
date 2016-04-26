//
//  myprofile.m
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import "myprofile.h"
#import "whogluedmap.h"
#import "FAQHelp.h"
#import "EGOImageView.h"
#import "AlertHandler.h"
@implementation myprofile
@synthesize PublicProScroll,profDic,uploadBtn,RegisterBtn,editBtn,isEdit,privateStr,publicStr;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;

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

-(void)GetOwnProfile
{
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/user_list.php?userid=%i",appDelegateObj.userID];  
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(Profdatafatch:) andHandler:self];
    

    
    
    
}


-(void)Profdatafatch:(NSDictionary*)dictionary
{
    [profDic removeAllObjects];
    
    
    NSLog(@"%@",dictionary);
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    tempArray = [[dictionary objectForKey:@"Record"] copy];
    NSLog(@"%@",tempArray);
    
    profDic = [[tempArray objectAtIndex:0] copy];
    NSLog(@"%@",profDic);
    
    txtfname.text = [profDic objectForKey:@"firstname"];
    txtlname.text = [profDic objectForKey:@"lastname"];
    txtbday.text = [profDic objectForKey:@"bday"];
    txtcontactno.text = [profDic objectForKey:@"phone"];
    txtaboutme.text = [profDic objectForKey:@"about_me"];
    
    [self setLoadImageg:[profDic objectForKey:@"image"]];
    
    
    
    
    
}

-(void)setLoadImageg:(NSString*)loadimage
{    
    imageViewL.imageURL = [NSURL URLWithString:loadimage];
    
}

-(IBAction)EditProf:(id)sender
{
    if (isEdit) {
        [txtfname setEnabled:NO];
        [txtlname setEnabled:NO];
        [txtbday setEnabled:NO];
        [txtcontactno setEnabled:NO];
        [txtaboutme setEnabled:NO];
        [txtscrnname setEnabled:NO];
        
        [uploadBtn setUserInteractionEnabled:NO];
        [RegisterBtn setUserInteractionEnabled:NO];
        [editBtn setTitle:@"Edit" forState:UIControlStateNormal];
        isEdit = FALSE;

    }
    else
    {
    [txtfname setEnabled:YES];
    [txtlname setEnabled:YES];
    [txtbday setEnabled:YES];
    [txtcontactno setEnabled:YES];
    [txtaboutme setEnabled:YES];
    [txtscrnname setEnabled:YES];
    
    [uploadBtn setUserInteractionEnabled:YES];
    [RegisterBtn setUserInteractionEnabled:YES];
    [editBtn setTitle:@"Done" forState:UIControlStateNormal];
    isEdit = TRUE;
    }
}

-(void)displayindicator{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    {
        [AlertHandler showAlertForProcess];
    }
    [pool release];
}

-(IBAction)btnregister:(id)sender{

    [NSThread detachNewThreadSelector:@selector(displayindicator) toTarget:self withObject:nil];
    
//    [AlertHandler showAlertForProcess];
    
    [txtfname setEnabled:NO];
    [txtlname setEnabled:NO];
    [txtbday setEnabled:NO];
    [txtcontactno setEnabled:NO];
    [txtaboutme setEnabled:NO];
    [txtscrnname setEnabled:NO];
    
    [uploadBtn setUserInteractionEnabled:NO];
    [RegisterBtn setUserInteractionEnabled:NO];
    [editBtn setTitle:@"Edit" forState:UIControlStateNormal];
    isEdit = FALSE;

    
    NSString *LoginID;
	
	LoginID = [[NSUserDefaults standardUserDefaults] valueForKey:@"Login"];
    
    
    
    NSString *strimage11 = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)StrImage1, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    NSString *c11 = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)StrImageCode1, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    
    NSString *fname = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)txtfname.text, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    NSString *lname = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)txtlname.text, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    NSString *bday = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)txtbday.text, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);

    
    NSString *abtme = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)txtaboutme.text, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    NSString *cn = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)txtcontactno.text, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    
    
    
    
    NSString *post =[NSString stringWithFormat:@"uid=%@&firstname=%@&lastname=%@&phone=%@&bday=%@&about_me=%@&image=%@&image_code=%@&contact_number=%@",LoginID,fname,lname,cn,bday,abtme,strimage11,c11,cn];

    
    
     
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:[NSURL URLWithString:@"http://www.openxcellaus.info/glueme/update_profile.php"]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/x-www-form-urlencoded charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
   
    NSError *error;
    NSURLResponse *response;
    NSData *uData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *data=[[NSString alloc]initWithData:uData encoding:NSUTF8StringEncoding];
    //    
    NSMutableDictionary *temp = [data JSONValue];
    //    
    NSLog(@"%@",temp);
    
    [AlertHandler hideAlert];
    
    UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:[temp valueForKey:@"msg"] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert1 show];
    [alert1 release];
    


}
-(IBAction)onMap:(id)sender{
	
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
    
    
//	whoGlueObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
	//whogluedmap	*gluemap=[[whogluedmap alloc]initWithNibName:@"whogluedmap" bundle:nil];
    appDelegateObj.count = 0;
    [self.navigationController pushViewController:mymapObj animated:NO];
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

    
    profDic = [[NSMutableDictionary alloc] init];
        
    appDelegateObj = (gluemeAppDelegate*)[[UIApplication sharedApplication]delegate];
    
	scroll.frame = CGRectMake(0, 142, 320, 240);
	scroll.contentSize = CGSizeMake(320, 540);
	
    imageViewL = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"ProfileLogo.png"]];
    [imageViewL setFrame:CGRectMake(50, 379, 70, 80)];
   
    imageViewL.hidden=FALSE;
    imgBtn.hidden=TRUE;
    
    publicStr = @"";
    privateStr = @"";
    
    // imgStr=@"http:\/\/www.openxcellaus.info\/glueme\/User_images\/image1.png";
    
    
    //imageViewL = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"icon.png"]];
    
    
    
    [scroll addSubview:imageViewL];
   // [self setImage:imageViewL];
	
  //  PublicProScroll.frame = CGRectMake(0, 0, 320, 340);
    PublicProScroll.contentSize = CGSizeMake(320, 450);    
	publicprofileview.hidden = TRUE;
}

-(void)setImage:(EGOImageView *)temp
{
    temp.imageURL = [NSURL URLWithString:imgStr];
    //imageViewL.imageURL = [NSURL URLWithString:loadimage];
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

    }
    
    if (isPicker) {
        isPicker = FALSE;
        return;
    } 
    [self GetOwnProfile];
    
    [mysegment setImage:[UIImage imageNamed:@"MyProfileSegSel.png"]forSegmentAtIndex:0];
    [mysegment setImage:[UIImage imageNamed:@"PublicProfileSeg.png"]forSegmentAtIndex:1];
    
//    self.navigationController.navigationBar.alpha = 0.0;
//    
//    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
//    UIImageView *topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
//    [topbarImg setImage:[UIImage imageNamed:@"topBar.png"]];
//    
//    [self.view addSubview:topbarImg];
//    [self.navigationController.navigationBar sendSubviewToBack:topbarImg];
    
    [txtfname setEnabled:NO];
    [txtlname setEnabled:NO];
    [txtbday setEnabled:NO];
    [txtcontactno setEnabled:NO];
    [txtaboutme setEnabled:NO];
    [txtscrnname setEnabled:NO];
   [editBtn setTitle:@"Edit" forState:UIControlStateNormal];
    [uploadBtn setUserInteractionEnabled:NO];
    [RegisterBtn setUserInteractionEnabled:NO];
    
}

-(void)Back
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(IBAction)segmentedControlIndexChanged
{
	switch(mysegment.selectedSegmentIndex) 
	{
		case 0:
			scroll.hidden = FALSE;
			publicprofileview.hidden = TRUE;
            //PublicProScroll.hidden = TRUE;
			//[AlertHandler showAlertForProcess];
			//[gluemecontacttbl reloadData];
			
			[mysegment setImage:[UIImage imageNamed:@"MyProfileSegSel.png"]forSegmentAtIndex:0];
            [mysegment setImage:[UIImage imageNamed:@"PublicProfileSeg.png"]forSegmentAtIndex:1];
            
			//[SEGCntrlContacts setImage:[UIImage imageNamed:@"contactsB.png"] forSegmentAtIndex:0];
			//			[SEGCntrlContacts setImage:[UIImage imageNamed:@"inviteW.png"] forSegmentAtIndex:1];
			//			[SEGCntrlContacts setImage:[UIImage imageNamed:@"StatusW.png"]forSegmentAtIndex:2];
			
			
			break;
		case 1:
			scroll.hidden = TRUE;
			publicprofileview.hidden = FALSE;
            
            [mysegment setImage:[UIImage imageNamed:@"MyProfileSeg.png"]forSegmentAtIndex:0];
            [mysegment setImage:[UIImage imageNamed:@"PublicProfileSegSel.png"]forSegmentAtIndex:1];
            
             //PublicProScroll.contentSize = CGSizeMake(320, 540); 
            //PublicProScroll.hidden = FALSE;
			//[SEGCntrlContacts setImage:[UIImage imageNamed:@"contactsW.png"] forSegmentAtIndex:0];
			//			[SEGCntrlContacts setImage:[UIImage imageNamed:@"inviteB.png"] forSegmentAtIndex:1];
			//			[SEGCntrlContacts setImage:[UIImage imageNamed:@"StatusW.png"]forSegmentAtIndex:2];
			break;
	}
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
-(void)textFieldDidBeginEditing:(UITextField *)textField{

    CGRect textFieldRect =[self.view.window convertRect:textField.bounds fromView:textField];
	CGRect viewRect =[self.view.window convertRect:self.view.bounds fromView:self.view];
	
	CGFloat midline = textFieldRect.origin.y + 1.0 * textFieldRect.size.height;
	CGFloat numerator =midline - viewRect.origin.y- MINIMUM_SCROLL_FRACTION * viewRect.size.height;
	CGFloat denominator =(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)* viewRect.size.height;
	CGFloat heightFraction = numerator / denominator;
	
	animatedDistance = floor(162.0 * heightFraction);
	
	CGRect viewFrame = self.view.frame;
	
	viewFrame.origin.y -= animatedDistance;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
	
	[self.view setFrame:viewFrame];
    [UIView commitAnimations];   

}
-(void)textFieldDidEndEditing:(UITextField *)textField  {
    [UIView commitAnimations];
    self.view.frame = CGRectMake(0,0, 320, 479);
	scroll.frame = CGRectMake(0, 142, 320, 340);
	scroll.contentSize = CGSizeMake(320, 540);

	[txtaboutme resignFirstResponder];
	[txtbday resignFirstResponder];
	[txtcontactno resignFirstResponder];
	[txtfname resignFirstResponder];
	[txtlname resignFirstResponder];
	[txtscrnname resignFirstResponder];
	

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}

-(IBAction)ChkBtnValChanged:(id)sender
{
	if((UIButton*)sender == lnamebtn)
	{
		if (lnamebtn.selected==YES) {
			lnamebtn.selected=NO;
		}else {
			lnamebtn.selected=YES;
            
            [[NSUserDefaults standardUserDefaults] setValue:@"True" forKey:@"LastName"];
            [[NSUserDefaults standardUserDefaults] synchronize];

            
		}
	}
	
	if((UIButton*)sender == screenbtn)
	{
		if (screenbtn.selected==YES) {
			screenbtn.selected=NO;
		}else {
			screenbtn.selected=YES;
            [[NSUserDefaults standardUserDefaults] setValue:@"True" forKey:@"Screen"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            

		}
	}
	
	if((UIButton*)sender == birthdaybtn)
	{
		if (birthdaybtn.selected==YES) {
			birthdaybtn.selected=NO;
		}else {
			birthdaybtn.selected=YES;
            [[NSUserDefaults standardUserDefaults] setValue:@"True" forKey:@"Birthdate"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            

		}
	}
	
	if((UIButton*)sender == emailbtn)
	{
		if (emailbtn.selected==YES) {
			emailbtn.selected=NO;
		}else {
			emailbtn.selected=YES;
            [[NSUserDefaults standardUserDefaults] setValue:@"True" forKey:@"Email"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            

		}
	}
	
	if((UIButton*)sender == aboutmebtn)
	{
		if (aboutmebtn.selected==YES) {
			aboutmebtn.selected=NO;
		}else {
			aboutmebtn.selected=YES;
            [[NSUserDefaults standardUserDefaults] setValue:@"True" forKey:@"About"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            

		}
	}
	
	if((UIButton*)sender == contactbtn)
	{
		if (contactbtn.selected==YES) {
			contactbtn.selected=NO;
		}else {
			contactbtn.selected=YES;
            [[NSUserDefaults standardUserDefaults] setValue:@"True" forKey:@"Contact"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            

		}
	}
    
    
}


-(IBAction)takeImage:(id)sender{
    isPicker = TRUE;
    UIActionSheet *actionsheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take Photo or Video",@"Choose from Library",nil];
	
	[actionsheet showInView:scroll];
	[actionsheet release];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
 
    [picker dismissModalViewControllerAnimated:YES];
	
    img = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    //[imgBtn setImage:img forState:UIControlStateNormal];
    [imageViewL setImage:img];
   
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMddhhmmss"];
    NSString *dateString = [dateFormat stringFromDate:date];
   
    picname1= [NSString stringWithFormat:@"image1%@",dateString] ;
     NSLog(@"%@",picname1);
    picname=[[picname1 stringByAppendingString:@".png"]retain];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataFilePath = [[documentsDirectory stringByAppendingPathComponent:picname] retain];
    
    [UIImagePNGRepresentation(imageViewL.image) writeToFile:dataFilePath atomically:YES ];
    
    
    
     
    NSData * dataImg = UIImagePNGRepresentation(imageViewL.image);
    StrImage1=picname;
    
    StrImageCode1 =[[dataImg base64Encoding] retain];
    
    
    
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
		
		if (buttonIndex == 0) {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.editing=NO;
			[self presentModalViewController:imagePicker animated:YES];
            [imagePicker release];
        }        
        if(buttonIndex ==1) {
            UIImagePickerController *picker;
            picker = [[UIImagePickerController alloc]init];
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.editing=NO;
			picker.delegate = self;
			[self presentModalViewController:picker animated:YES];
        }
}

-(IBAction)PublicDoneClicked:(id)sender
{
    if ([lnamebtn isSelected]) {
        if ([publicStr isEqualToString:@""]) {
            publicStr=[publicStr stringByAppendingFormat:@"lastname"];
        }
        else
        {
        publicStr=[publicStr stringByAppendingFormat:@",lastname"];
        }
    }
    else
    {
        if ([privateStr isEqualToString:@""]) {
            privateStr=[privateStr stringByAppendingFormat:@"lastname"];
        }
        else
        {
            privateStr=[privateStr stringByAppendingFormat:@",lastname"];
        }

    }
    
    if ([birthdaybtn isSelected]) {
        if ([publicStr isEqualToString:@""]) {
            publicStr=[publicStr stringByAppendingFormat:@"bday"];
        }
        else
        {
            publicStr=[publicStr stringByAppendingFormat:@",bday"];
        }
    }
    else
    {
        if ([privateStr isEqualToString:@""]) {
            privateStr=[privateStr stringByAppendingFormat:@"bday"];
        }
        else
        {
            privateStr=[privateStr stringByAppendingFormat:@",bday"];
        }
        
    }

    if ([aboutmebtn isSelected]) {
        if ([publicStr isEqualToString:@""]) {
            publicStr=[publicStr stringByAppendingFormat:@"about_me"];
        }
        else
        {
            publicStr=[publicStr stringByAppendingFormat:@",about_me"];
        }
    }
    else
    {
        if ([privateStr isEqualToString:@""]) {
            privateStr=[privateStr stringByAppendingFormat:@"about_me"];
        }
        else
        {
            privateStr=[privateStr stringByAppendingFormat:@",about_me"];
        }
        
    }

    if ([emailbtn isSelected]) {
        if ([publicStr isEqualToString:@""]) {
            publicStr=[publicStr stringByAppendingFormat:@"email"];
        }
        else
        {
            publicStr=[publicStr stringByAppendingFormat:@",email"];
        }
    }
    else
    {
        if ([privateStr isEqualToString:@""]) {
            privateStr=[privateStr stringByAppendingFormat:@"email"];
        }
        else
        {
            privateStr=[privateStr stringByAppendingFormat:@",email"];
        }
        
    }

    if ([contactbtn isSelected]) {
        if ([publicStr isEqualToString:@""]) {
            publicStr=[publicStr stringByAppendingFormat:@"phone"];
        }
        else
        {
            publicStr=[publicStr stringByAppendingFormat:@",phone"];
        }
    }
    else
    {
        if ([privateStr isEqualToString:@""]) {
            privateStr=[privateStr stringByAppendingFormat:@"phone"];
        }
        else
        {
            privateStr=[privateStr stringByAppendingFormat:@",phone"];
        }
        
    }

    
    NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/glueme/set_public_private.php?uid=%i&private=%@&public=%@",appDelegateObj.userID,privateStr,publicStr];  
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(publicdatafatch:) andHandler:self];

    
    
    //http://openxcellaus.info/glueme/set_public_private.php?uid=22&private=lastname,email,phone&public=bday,about_me
}

-(void)publicdatafatch:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);
    
    NSString *msg = [dictionary objectForKey:@"msg"];
    
    UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Info" message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert1 show];
    [alert1 release];
    
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
