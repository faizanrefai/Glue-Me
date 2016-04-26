//
//  userregister.m
//  glueme
//
//  Created by apple on 9/19/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import "userregister.h"

#import "GdataParser.h"
#import "FAQHelp.h"
#import "AlertRegistering.h"

static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;

@implementation userregister
@synthesize registrationTbl,sectionArray,contentArray1,contentArray2,contentArray3,textArray,istextfill;
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
    
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
    UIImageView *topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
        [topbarImg setImage:[UIImage imageNamed:@"GreTopBar2.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"PurpleTopBar2.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"OrangeTopBar2.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"BlackTopBar2.png"]];
    }
    else
    {
         [topbarImg setImage:[UIImage imageNamed:@"RegisterTopBar.png"]];
    }
    

   
    
    [self.view addSubview:topbarImg];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(5,10, 76, 28);
    
    [backBtn addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
    
    objAppdel = (gluemeAppDelegate*)[[UIApplication sharedApplication]delegate];
    
    [self.view addSubview:backBtn];   
    
    textArray = [[NSMutableDictionary alloc] init];
//WithObjects:fnametext,lnametext,emailtext,passwordtext,confirmpasstext,phntext,nil];
    
    
     locationManager = [[CLLocationManager alloc]init];
     if([CLLocationManager locationServicesEnabled])
     {
     locationManager.delegate = self;
     locationManager.desiredAccuracy  = kCLLocationAccuracyKilometer;
     locationManager.distanceFilter = 1000.0f;
     [locationManager startUpdatingLocation];
     [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(UpdateLocation) userInfo:nil repeats:YES];
     //[NSTimer scheduledTimerWithTimeInterval:[[NSUserDefaults standardUserDefaults] integerForKey:@"time"] target:self selector:@selector(BtnRefreshGPSPressed) userInfo:nil repeats:YES];
     }

    registrationTbl.backgroundColor = [UIColor clearColor];
    
    
	scroll.frame = CGRectMake(0, 44, 320, 460);
	scroll.contentSize = CGSizeMake(320, 520);
    
       appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication]delegate];
}

-(void)UpdateLocation
{
    [locationManager startUpdatingLocation];
	// NSLog(@"lat n lon :%g  %g",lat1,lon1);
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{
	
   objAppdel.latitude= [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.latitude];
	objAppdel.longitude = [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.longitude];
    NSLog(@"lat n lon :%@  %@",  objAppdel.latitude,objAppdel.longitude);
}



-(void)Back
{
   //[self dismissModalViewControllerAnimated:YES];
    [self.view removeFromSuperview];
}

-(void)viewWillAppear:(BOOL)animated
{
    if (appDelegateObj.isthemechanged) {
//        self.navigationController.navigationBar.tintColor = [UIColor clearColor];
//        topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
            [topbarImg setImage:[UIImage imageNamed:@"GreTopBar2.png"]];
        }
        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
        {
            [topbarImg setImage:[UIImage imageNamed:@"PurpleTopBar2.png"]];
        }
        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
        {
            [topbarImg setImage:[UIImage imageNamed:@"OrangeTopBar2.png"]];
        }
        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
        {
            [topbarImg setImage:[UIImage imageNamed:@"BlackTopBar2.png"]];
        }
        else
        {
            [topbarImg setImage:[UIImage imageNamed:@"RegisterTopBar.png"]];
        }
        
        
        
        
//        [self.view addSubview:topbarImg];
//        
//        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        backBtn.frame = CGRectMake(5,10, 76, 28);
//        
//        [backBtn addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:backBtn];   
    }
}

-(IBAction)onFAQ:(id)sender
{
	FAQHelp *faqhelp=[[FAQHelp alloc]initWithNibName:@"FAQHelp" bundle:nil];
	[self.navigationController pushViewController:faqhelp animated:YES];
	[faqhelp release];
}

-(void)PassData
{
   [AlertRegistering showAlertForProcess];
    
//    NSLog(@"%@",[NSString stringWithFormat:@"%d",objAppdel.userId]);
//    NSLog(@"%@",[NSString stringWithFormat:@"%d",objAppdel.chatWithUserId]);
//    NSLog(@"%@",ChatTxt.text);
//    
//    NSString *encodedString = [ChatTxt.text stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
//    NSLog(@"%@",encodedString);
//    
    
        
    
    
    
	NSString *RegURL = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/registration.php?firstname=%@&lastname=%@&email=%@&password=%@&cpassword=%@&phone=%@&lat=%@&lon=%@",fnametext,lnametext,emailtext,passwordtext,confirmpasstext,phntext,objAppdel.latitude,objAppdel.longitude];
    
    //NSString *RegURL = [NSString stringWithFormat:@"http://openxcellaus.info/leopard/chatting.php?from_user_id=7&to_user_id=8&text=heyfrndssssssss"];
    
	//    NSString *RegURL = @"http://www.openxcellaus.info/leopard/near_by_users.php?lat=23.41670000&long=72.91670000";
    
    
	GdataParser *parser = [[GdataParser alloc] init];
	[parser downloadAndParse:[NSURL URLWithString:RegURL] 
				 withRootTag:@"Record"
					withTags:[NSDictionary dictionaryWithObjectsAndKeys:@"msg",@"msg",@"userid",@"userid",nil]
     
						 sel:@selector(finishGetData:) 
				  andHandler:self];
	
}

-(void)finishGetData:(NSDictionary*)dictionary{
	[AlertRegistering hideAlert];
    
    NSLog(@"%@",dictionary);
    NSMutableArray *tempArray;
    tempArray = [dictionary objectForKey:@"array"];
    NSLog(@"%@",tempArray);
    NSMutableDictionary *tempDic = [tempArray objectAtIndex:0];
    
    
    
    NSLog(@"%@",[tempDic objectForKey:@"msg"]);
    NSString *temp = [tempDic objectForKey:@"msg"];
    if ([temp isEqualToString:@"Email Id is already Exists"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"Email Id already Exists" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    else if ([temp isEqualToString:@"Password and Confirm password must be same"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Password and Confirm password must be same" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    else
    {
		[loginObj getLogedIn];
		[self.view removeFromSuperview];
		objAppdel.userID = [[tempDic objectForKey:@"userid"] intValue];
        
        
        
        [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%d",objAppdel.userID] forKey:@"Login"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        //[self dismissModalViewControllerAnimated:NO];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome to GlueMe!" message:@"Start adding Gluers from your phonebook or find Gluers online..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        //[self.navigationController pushViewController:loginObj.tabBar animated:YES];
    }
    
}
-(void)setParentObj:(login*)obj{
	loginObj =[[login alloc]init];
	loginObj=obj;

}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(IBAction)cancelbtn_clicked
{
	//[self dismissModalViewControllerAnimated:YES];
    [self.view removeFromSuperview];
	
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0) {
		contentArray1 = [[NSArray arrayWithObjects:@"First Name", @"Last Name", nil] retain];
        return [contentArray1 count];
	}
	if(section == 1) {
		contentArray2 = [[NSArray arrayWithObjects:@"Email ID", @"Password",@"Confirm Password", nil] retain];
        return [contentArray2 count];
	}
    
    if(section == 2) {
		contentArray3 = [[NSArray arrayWithObjects:@"Phone No", nil] retain];
        return [contentArray3 count];
	}
	
	//contentArray = [[NSArray arrayWithObjects:@"First Name", @"Last Name", @"Email Address", @"Password",@"Confirm Password", @"Cell Phone", nil] retain];
	//return [contentArray count];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    sectionArray =  [[NSArray arrayWithObjects:@"Name", @"Email",@"Contact", nil] retain];
	
	return [sectionArray count];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        
        Txt = [[UITextField alloc] initWithFrame:CGRectMake(3, 3, 320, 38)];
        Txt.delegate = self;
        NSString * tagg = [NSString stringWithFormat:@"%d%d",indexPath.section,indexPath.row];
        Txt.tag = [tagg intValue];
        Txt.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        if (indexPath.section == 0) {
            Txt.placeholder = [contentArray1 objectAtIndex:indexPath.row];
        }
        else if (indexPath.section == 1) {
            Txt.placeholder = [contentArray2 objectAtIndex:indexPath.row];
            if(indexPath.row==1)
                Txt.secureTextEntry =TRUE;
            if(indexPath.row==2)
                Txt.secureTextEntry =TRUE;
        }
        else
        {
            Txt.placeholder = [contentArray3 objectAtIndex:indexPath.row];
        }
        
       // Txt.placeholder = [contentArray objectAtIndex:indexPath.row];
        
        
//        CGRect frame = CGRectMake(0, 0, 160, 29);
//        
//        UITextField *search= [[UITextField alloc] initWithFrame:frame];
//        search.borderStyle = UITextBorderStyleRoundedRect;
//        search.textColor = [UIColor blackColor];
//        search.font = [UIFont systemFontOfSize:17.0];
//        search.placeholder = @"Suchen";
//        search.backgroundColor = [UIColor clearColor];
//        search.autocorrectionType = UITextAutocorrectionTypeNo;
//        search.keyboardType = UIKeyboardTypeDefault;
//        search.returnKeyType = UIReturnKeySearch;
//        search.clearButtonMode = UITextFieldViewModeWhileEditing;
//        search.delegate = self;
        
        [cell.contentView addSubview:Txt];
    }
    //cell.backgroundColor = [UIColor clearColor];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundView = nil;
    return cell;
    //[cell setParentObject:self];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section 
{
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    
    UIView *headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)] autorelease];
    
    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(10, 3, tableView.bounds.size.width - 10, 18)] autorelease];
    label.text = sectionTitle;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [headerView addSubview:label];

    
   
       // [headerView setBackgroundColor:[UIColor whiteColor]];
    //        [headerView setBackgroundColor:[UIColor clearColor]];
    return headerView;
}


//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
   // NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
  //  UIView *header = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    // Add stuff to the header as subviews
    
  //  [header addSubview:sectionTitle];
//    UILabel *headerTitle;
//    headerTitle.text = sectionTitle;
//    [header addSubview:headerTitle];
//    
    
  //  UIView* headerView = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 40.0f)] autorelease];
  //  return headerView;

    
   // return header;

//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *sectionHeader = nil;

    
	if(section == 0) {
		sectionHeader = @"";
	}
	if(section == 1) {
		sectionHeader = @"";
	}
    if (section == 2) {
        sectionHeader = @"";
    }
	
    return sectionHeader;
}
 

-(IBAction)registerbtn_clicked
{
	[Txt resignFirstResponder];
  //  istextfill = TRUE;
    appDelegateObj.isregister = TRUE;
    
    fnametext = [textArray objectForKey:@"0"];
    lnametext = [textArray objectForKey:@"1"];
    emailtext = [textArray objectForKey:@"10"];
    passwordtext = [textArray objectForKey:@"11"];
    confirmpasstext = [textArray objectForKey:@"12"];
    phntext = [textArray objectForKey:@"20"];

    if ([fnametext isEqualToString:@""] || [lnametext isEqualToString:@""] || [emailtext isEqualToString:@""] || [passwordtext isEqualToString:@""] || [confirmpasstext isEqualToString:@""] || [phntext isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Please fill up all detail" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
	else if(![passwordtext isEqualToString:confirmpasstext]){
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Password and Confirm password must be same" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
	}
    else
    {
        [self PassData];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([textField.text isEqualToString:@""]) {
        textField.text = @" ";
    }

    
	[textField resignFirstResponder];
//	[Txt resignFirstResponder];
	return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [Txt resignFirstResponder];
//	[fnametext resignFirstResponder];
//	[lnametext resignFirstResponder];
//	[emailtext resignFirstResponder];
//	[passwordtext resignFirstResponder];
//	[confirmpasstext resignFirstResponder];
//	[phntext resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField*)textField
{
    CGRect textFieldRect =[self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =[self.view.window convertRect:self.view.bounds fromView:self.view];
    
    CGFloat midline = textFieldRect.origin.y + 1.0 * textFieldRect.size.height;
    CGFloat numerator =midline - viewRect.origin.y- MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)* viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    animatedDistance = floor(162.0 * heightFraction)+9;
    
    CGRect viewFrame = self.view.frame;
    
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField

{
    
//   NSString *str = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSLog(@"%@",textField.text);
    NSLog(@"%d",textField.tag);
//    
    
    NSString *str = textField.text;
	  NSLog(@"value is  %@",str);
    
    if ([str isEqualToString:@" "]||[str isEqualToString:@""]||str== NULL||str== nil) {
        textField.text = @"";
		str= @"";
    }
	
   
   //str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    
    
	[textArray setObject:str forKey:[NSString stringWithFormat:@"%i",textField.tag]];
  
	
	CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
	
		   
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
    [textArray release];
    [sectionArray release];
    [registrationTbl release];
    [super dealloc];
}


@end
