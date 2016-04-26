//
//  addfriend.m
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import "addfriend.h"
#import "FAQHelp.h"
#import "whogluedmap.h"
#import "AlertHandler.h"

@implementation addfriend
@synthesize IsselectFrnd,selectFrnd,Contname,phoneDic,phonAry;
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
   
    
	//whoGlueVwObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
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

-(IBAction)onFAQ:(id)sender
{
	FAQHelp *faqhelp=[[FAQHelp alloc]initWithNibName:@"FAQHelp" bundle:nil];
	[self.navigationController pushViewController:faqhelp animated:YES];
	[faqhelp release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication]delegate];
    Contname = [[NSMutableArray alloc] init];
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

    selectFrnd = [[NSMutableString alloc] init];
    
    [super viewDidLoad];
}


-(void)viewWillAppear:(BOOL)animated
{
    //PhoneBookArray = [[NSMutableArray alloc] init]; 
    
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
    
	gluemecontacttbl.hidden = FALSE;
	phncontacttbl.hidden = TRUE;
    
    gluemecontacttbl.rowHeight = 70.00;
    
    [mysegment setImage:[UIImage imageNamed:@"GMConSel.png"]forSegmentAtIndex:0];
    [mysegment setImage:[UIImage imageNamed:@"Phone.png"]forSegmentAtIndex:1];
    
//    NSString *aName;
//    
//    ABAddressBookRef addressBook = ABAddressBookCreate(); NSArray *thePeople = (NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
//    for (id person in thePeople)
//        
//    {
//          CFStringRef cfName = ABRecordCopyCompositeName(person);
//        if (cfName != nil)
//        {
//            aName = [NSString stringWithString:(NSString *)cfName];
//            CFRelease(cfName);
//            [Contname addObject:aName];
//        }
//        else
//        {
//            aName = @"No Name";
//            [Contname addObject:aName];
//            
//        }
//    }
    
    //[self GetPhoneContact];
    
    [self GetUserList];
    
   
}

-(void)GetPhoneContact
{
    NSString *aName;
    
    
    ABAddressBookRef addressBook = ABAddressBookCreate(); NSArray *thePeople = (NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
    NSLog(@"hii%@",thePeople);
    
    
    for (id person in thePeople)
        
    {
        
        
        CFStringRef cfName = ABRecordCopyCompositeName(person);
        
        if (cfName != nil)
        {
            aName = [NSString stringWithString:(NSString *)cfName];
            CFRelease(cfName);
            [Contname addObject:aName];
            [phonAry addObject:aName];
        }
        else
        {
            aName = @"No Name";
            [Contname addObject:aName];
            [phonAry addObject:aName];
            
        }
        ABMultiValueRef phoneNumberProperty = ABRecordCopyValue(person, kABPersonPhoneProperty);
        NSArray* phoneNumbers = (NSArray*)ABMultiValueCopyArrayOfAllValues(phoneNumberProperty);
        NSLog(@"array phone number%@",phoneNumbers);
        
        
        NSString *strnumber;
        strnumber=[phoneNumbers objectAtIndex:0];
        if(strnumber==nil)
        {
            strnumber=@"No Number Found";
            
           // [number addObject:strnumber];
            [phonAry addObject:strnumber];
            
        }else{
            
           // [number addObject:strnumber];
            [phonAry addObject:strnumber];
        }
        ABMultiValueRef emailslistproperty = ABRecordCopyValue(person, kABPersonEmailProperty);
        NSArray* emailslist = (NSArray*)ABMultiValueCopyArrayOfAllValues(emailslistproperty);
        NSLog(@"array emailslist %@",emailslist);
        
        
        NSString *stremaillist1;
        stremaillist1=[emailslist objectAtIndex:0];
        if(stremaillist1==nil)
        {
            stremaillist1=@"";
            
           // [email addObject:stremaillist1];
            [phonAry addObject:stremaillist1];
            
        }else{
            
           // [email addObject:stremaillist1];
            [phonAry addObject:stremaillist1];
        }
        
        NSLog(@"%@",phonAry);
        [phoneDic setValue:[phonAry copy] forKey:[phonAry objectAtIndex:0]];
        NSLog(@"%@",phoneDic);
        [phonAry removeAllObjects];
    }
    
    //ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering
    
    /* for (int s = 0; s<[Contname count]; s++) {
     CFComparisonResult ABPersonComparePeopleByName (
     ABRecordRef ,
     ABRecordRef person2,
     ABPersonSortOrdering ordering
     );
     }
     
     */
    /*
     ABAddressBookRef addressBook = ABAddressBookCreate();
     CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(addressBook);
     CFMutableArrayRef peopleMutable = CFArrayCreateMutableCopy(
     kCFAllocatorDefault, CFArrayGetCount(people), people
     );
     CFArraySortValues( peopleMutable,
     
     CFRangeMake(0, CFArrayGetCount(peopleMutable)), (CFComparatorFunction) ABPersonComparePeopleByName, (void*) ABPersonGetSortOrdering()
     );
     
     CFRelease(addressBook); 
     CFRelease(people); 
     CFRelease(peopleMutable);
     */
//    [phoneArray2 addObjectsFromArray:Contname];
    
    NSLog(@"%@",Contname);
    
    [phncontacttbl reloadData];
    
}


-(void)GetUserList
{
    [AlertHandler showAlertForProcess];
    
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/glueMe_friend_list.php?user_id=%i",appDelegateObj.userID];
    
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];


}
-(void)reloadMyTbl
{
    [phncontacttbl reloadData];
}

-(void)datafatch:(NSDictionary*)dictionary{
    
    [AlertHandler hideAlert];
    
    contactArray=[[NSMutableArray alloc]init];
    contactnum=[[NSMutableArray alloc]init];
    contactname=[[NSMutableArray alloc]init];
    contactemail=[[NSMutableArray alloc] init];
    
    for (int i=0; i<[[dictionary valueForKey:@"glueMe_friend_list"]count]; i++) 
    {
        [contactArray addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"user_id"] objectAtIndex:i]];
        [contactname addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"firstname"] objectAtIndex:i]];
        
        [contactnum addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"phone"] objectAtIndex:i]];
        
        [contactemail addObject:[[[dictionary valueForKey:@"glueMe_friend_list"] valueForKey:@"email"] objectAtIndex:i]];
        
        
    }
    [gluemecontacttbl reloadData];
    
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

-(IBAction)segmentedControlIndexChanged
{
    UIImageView *tableImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, 309, 248)];
    [tableImg setImage:[UIImage imageNamed:@"tblBackGround.png"]];
    
	switch(mysegment.selectedSegmentIndex) 
	{
		case 0:
			gluemecontacttbl.hidden = FALSE;
			phncontacttbl.hidden = TRUE;
			//[AlertHandler showAlertForProcess];
            
            [mysegment setImage:[UIImage imageNamed:@"GMConSel.png"]forSegmentAtIndex:0];
            [mysegment setImage:[UIImage imageNamed:@"Phone.png"]forSegmentAtIndex:1];
            
			[gluemecontacttbl reloadData];
            
       		
			break;
		case 1:
            
            
			gluemecontacttbl.hidden=TRUE;
			phncontacttbl.hidden=FALSE;
			
            [mysegment setImage:[UIImage imageNamed:@"GMCon.png"]forSegmentAtIndex:0];
            [mysegment setImage:[UIImage imageNamed:@"PhoneSel.png"]forSegmentAtIndex:1];
            
			[phncontacttbl reloadData];
			
		
			break;
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	if (tableView.tag == 1)
	{
		return [contactname count];
	}
	if (tableView.tag == 2)
	{
		return [Contname count];
	}
	//return 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0,10,270, 57)];
    [cellImg setImage:[UIImage imageNamed:@"CellImg"]];
    
    
    
//    UIImageView *tableSapImg = [[UIImageView alloc] initWithFrame:CGRectMake(5, 40, 290, 1)];
//    [tableSapImg setImage:[UIImage imageNamed:@"saperator.png"]];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        [cell.contentView addSubview:cellImg];
        
    }
	//cell.selectionStyle = UITableViewCellEditingStyleNone;
	if (tableView.tag == 1)
	{
		cell.textLabel.font = [UIFont fontWithName:@"arial" size:18];
		//cell.textLabel.textColor=[UIColor whiteColor];
		
        cell.textLabel.text = [contactname objectAtIndex:indexPath.row];
		//cell.detailTextLabel.text= @"-downtown";
		//cell.detailTextLabel.textColor = [UIColor whiteColor];
		//cell.contentView.backgroundColor=[UIColor clearColor];
		cell.textLabel.backgroundColor=[UIColor clearColor];
		cell.detailTextLabel.backgroundColor=[UIColor clearColor];
//        UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 44)];
//        [cellImg setImage:[UIImage imageNamed:@"contactCellImg.png"]];
      //  cell.backgroundView = cellImg;
        gluemecontacttbl.frame=CGRectMake(20, 155, 280, 4*44);
        cell.textLabel.textColor = [UIColor blackColor];
        
        cell.textLabel.backgroundColor=[UIColor clearColor];
        //[cell.contentView addSubview:tableSapImg];
	}
	
	if (tableView.tag == 2)
	{
		cell.textLabel.font = [UIFont fontWithName:@"arial" size:18];
		//cell.textLabel.textColor=[UIColor whiteColor];
		cell.textLabel.text = [Contname objectAtIndex:indexPath.row];
		//cell.detailTextLabel.text= @"-downtown";
		//cell.detailTextLabel.textColor = [UIColor whiteColor];
		//cell.contentView.backgroundColor=[UIColor clearColor];
		cell.textLabel.backgroundColor=[UIColor clearColor];
		cell.detailTextLabel.backgroundColor=[UIColor clearColor];
        
//        UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 44)];
//        [cellImg setImage:[UIImage imageNamed:@"contactCellImg.png"]];
       // cell.backgroundView = cellImg;
        phncontacttbl.frame=CGRectMake(20, 155, 280, 5*44);
        cell.textLabel.textColor = [UIColor blackColor];
       
        cell.textLabel.backgroundColor=[UIColor clearColor];

        
        
      //  [cell.contentView addSubview:tableSapImg];
        
	}
	
	
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    if (tableView.tag == 1) {
        
        
        
        //[meetingPointObj getSelected:IsselectFrnd];
        
        //  IsselectFrnd = YES;
        
        //check  whether its exists or not
        
        for (int i=0; i<[appDelegateObj.meetingPPlArray count]; i++) {
            if ([[appDelegateObj.meetingPPlArray objectAtIndex:i] isEqualToString:[contactArray objectAtIndex:indexPath.row]]) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"This friend is already exist" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
                [alert release];
            }
            else
            {
                if (tableView == gluemecontacttbl) {
                [appDelegateObj.meetingPPlArray addObject:[contactArray objectAtIndex:indexPath.row]];
                appDelegateObj.addedFrnd = [contactname objectAtIndex:indexPath.row];
                appDelegateObj.stremailselect=[contactemail objectAtIndex:indexPath.row];
                appDelegateObj.strIdSelect = [contactArray objectAtIndex:indexPath.row];
                
                 appDelegateObj.isaddfrnd = YES;
                [self.navigationController popViewControllerAnimated:YES];
                return;
                }
                else
                {
                    [appDelegateObj.meetingPPlArray addObject:@"0"];
                    appDelegateObj.addedFrnd = [Contname objectAtIndex:indexPath.row];
                    appDelegateObj.stremailselect=[[phoneDic objectForKey:appDelegateObj.selectedUser] objectAtIndex:2];
                    appDelegateObj.strIdSelect = @"0";
                    
                    appDelegateObj.isaddfrnd = YES;
                    [self.navigationController popViewControllerAnimated:YES]; 
                                    
                     return;
                }
            }
        }
        
         
        
    }
    else
    {
        
        //         IsselectFrnd = TRUE;
        //        [meetingPointObj getSelected:IsselectFrnd];
        appDelegateObj.isaddfrnd = YES;
        appDelegateObj.addedFrnd = [Contname objectAtIndex:indexPath.row];
        [self.navigationController popViewControllerAnimated:YES];
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
