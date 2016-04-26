//
//  ChangePassword.m
//  glueme
//
//  Created by apple1 on 9/21/11.
//  Copyright 2011 openxcek. All rights reserved.
//

#import "ChangePassword.h"

#import "whogluedmap.h"
#import "FAQHelp.h"
@implementation ChangePassword
@synthesize pswdDic,oldPass,newPass,confPass,Txt1,Txt2,Txt3;

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

    
    appDelegateObj = (gluemeAppDelegate*)[[UIApplication sharedApplication] delegate];
    
    passwordTbl.backgroundColor = [UIColor clearColor];
    
    pswdDic = [[NSMutableDictionary alloc] init];
    
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

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
		contentArray1 = [[NSArray arrayWithObjects:@"Old Password", @"New Password",@"Confirm New Password", nil] retain];
        return [contentArray1 count];
		//contentArray = [[NSArray arrayWithObjects:@"First Name", @"Last Name", @"Email Address", @"Password",@"Confirm Password", @"Cell Phone", nil] retain];
	//return [contentArray count];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        
        if (indexPath.row == 0) {
            Txt1 = [[UITextField alloc] initWithFrame:CGRectMake(3, 3, 320, 38)];
            Txt1.delegate = self;
            Txt1.tag = indexPath.row;
            Txt1.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            Txt1.placeholder = [contentArray1 objectAtIndex:indexPath.row];
            [cell.contentView addSubview:Txt1];
        }
        
               
            if(indexPath.row==1)
            {
                Txt2.secureTextEntry =TRUE;
        Txt2 = [[UITextField alloc] initWithFrame:CGRectMake(3, 3, 320, 38)];
        Txt2.delegate = self;
        Txt2.tag = indexPath.row;
        Txt2.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        Txt2.placeholder = [contentArray1 objectAtIndex:indexPath.row];
                 [cell.contentView addSubview:Txt2];
            }
            if(indexPath.row==2)
            {
                Txt3.secureTextEntry =TRUE;
        Txt3 = [[UITextField alloc] initWithFrame:CGRectMake(3, 3, 320, 38)];
        Txt3.delegate = self;
        Txt3.tag = indexPath.row;
        Txt3.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        Txt3.placeholder = [contentArray1 objectAtIndex:indexPath.row];
                 [cell.contentView addSubview:Txt3];
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
        
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = nil;
    return cell;
    //[cell setParentObject:self];
}

//- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section 
//{
//    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
//    
//    UIView *headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)] autorelease];
//    
//    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(10, 3, tableView.bounds.size.width - 10, 18)] autorelease];
//    label.text = sectionTitle;
//    label.textColor = [UIColor whiteColor];
//    label.backgroundColor = [UIColor clearColor];
//    [headerView addSubview:label];
//    
//    
//    
//    // [headerView setBackgroundColor:[UIColor whiteColor]];
//    //        [headerView setBackgroundColor:[UIColor clearColor]];
//    return headerView;
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
     [textField resignFirstResponder];
	      
	return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
//    [pswdDic setObject:textField.text forKey:[NSString stringWithFormat:@"%d",textField.tag]];
//    
//    NSLog(@"%@",pswdDic);
    
   

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [Txt1 resignFirstResponder];
    [Txt2 resignFirstResponder];
    [Txt3 resignFirstResponder];
}

-(IBAction)onFAQ:(id)sender
{
	FAQHelp *faqhelp=[[FAQHelp alloc]initWithNibName:@"FAQHelp" bundle:nil];
	[self.navigationController pushViewController:faqhelp animated:YES];
	[faqhelp release];
}
-(IBAction)onMap:(id)sender{
	
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
    
      appDelegateObj.count = 0;
    
    [self.navigationController pushViewController:mymapObj animated:NO];
    
	//whoGlueObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
  
	//whogluedmap	*gluemap=[[whogluedmap alloc]initWithNibName:@"whogluedmap" bundle:nil];
	//[self.navigationController pushViewController:whoGlueObj animated:YES];
	//[gluemap release];
		
}
-(IBAction)changepassword{
    
    
    oldPass = Txt1.text;
    newPass = Txt2.text;
    confPass = Txt3.text;
    
    if ([newPass isEqualToString:confPass]) {
        
    NSString *LoginID;
	
	LoginID = [[NSUserDefaults standardUserDefaults] valueForKey:@"Login"];
    
	// [self.navigationController popToRootViewControllerAnimated:YES];
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/change_password.php?uid=%@&password=%@&new_password=%@",LoginID,oldPass,newPass];
    
     
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"New password and conform password must be same." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
}
-(IBAction)back{
    [self.navigationController  popViewControllerAnimated:YES];
    

}
-(void)datafatch:(NSDictionary*)dictionary{
    
    NSString *error;
    
    error = [[NSString alloc] initWithFormat:@"%@",[dictionary valueForKey:@"msg"]];
    NSLog(@"%@",error);
    

   
}
-(IBAction)setmeeting
{
    
    appDelegateObj.selectedFrnd = [NSString stringWithFormat:@""];
    meetingpointview *obj = [[meetingpointview alloc]init];
    [self.navigationController pushViewController:obj animated:YES];
    
//    listVwObj = [[listwhoglued alloc] initWithNibName:@"listwhoglued" bundle:nil];
//    [self.navigationController pushViewController:listVwObj animated:NO];
}

-(void)viewWillAppear:(BOOL)animated
{
    if (appDelegateObj.isthemechanged) {
        
//    self.navigationController.navigationBar.alpha = 0.0;
//    
//    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
//   topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
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
