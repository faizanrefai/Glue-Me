//
//  GetGlue1.m
//  glueme
//
//  Created by apple on 10/25/11.
//  Copyright 2011 354456. All rights reserved.
//

#import "GetGlue1.h"
#import "AlertHandler.h"
#import "meetingpointview.h"

@implementation GetGlue1
@synthesize mysegment,searchbar,phoneArray2,Name,searchTbl,searchArray,searchBdate,searchEmailList,searchPhnNo,SearchUserId,phoneDic,phonAry;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
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
    phoneDic = [[NSMutableDictionary alloc] init];
    phonAry = [[NSMutableArray alloc] init];
    
    [super viewDidLoad];
    self.navigationController.navigationBar.alpha = 0.0;
    appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication]delegate];
   
    searchLname = [[NSMutableArray alloc] init];
    SearchUserId = [[NSMutableArray alloc] init];
    searchArray = [[NSMutableArray alloc] init];
    searchEmailList = [[NSMutableArray alloc] init];
    searchPhnNo = [[NSMutableArray alloc] init];
    searchBdate = [[NSMutableArray alloc] init];
    
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

    
    
    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    BumpBtn.frame = CGRectMake(268,10, 35, 34);
    
    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:BumpBtn]; 
    
    [self.view addSubview:topbarImg];
    [self.navigationController.navigationBar sendSubviewToBack:topbarImg];

    phnArray = [[NSMutableArray alloc] init];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)Bump
{
    NSLog(@"BumpClicked");
    bumpObj = [[Bump alloc] initWithNibName:@"Bump" bundle:nil];
    [self.navigationController pushViewController:bumpObj animated:YES];
    
}

-(void)reloadMyTbl
{
    [phncontacttbl reloadData];
}


-(void)viewWillAppear:(BOOL)animated    {

    if (appDelegateObj.isthemechanged) {
      
//    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
//    UIImageView *topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
    
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
    
    
    
//    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    BumpBtn.frame = CGRectMake(268,10, 35, 34);
//    
//    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:BumpBtn]; 
//    
//    [self.view addSubview:topbarImg];
//    [self.navigationController.navigationBar sendSubviewToBack:topbarImg];

    }
    
     
    appDelegateObj.selectedUser = @"";
    appDelegateObj.SelectedEmail = @"";
    appDelegateObj.SelectedPhnNo = @"";
    appDelegateObj.selectedBdate = @"";
    
    gluemecontacttbl.hidden = FALSE;
	phncontacttbl.hidden = TRUE;
    searchTbl.hidden = TRUE;
    phoneArray2 = [[NSMutableArray alloc] init];
    
    searchbar.text = @"";
    
    number = [[NSMutableArray alloc] init];
    email = [[NSMutableArray alloc] init];
    
    [gluemecontacttbl setRowHeight:70.0];
    [phncontacttbl setRowHeight:70.0];
    [searchTbl setRowHeight:70.0];
    
    locationManager = [[CLLocationManager alloc]init];
	if([CLLocationManager locationServicesEnabled])
	{
		locationManager = [[CLLocationManager alloc] init];
		locationManager.desiredAccuracy = kCLLocationAccuracyBest;
		locationManager.delegate = self;
		//locationManager.location.coordinate.latitude;
		[locationManager startUpdatingLocation];
		
		//	appDelegateObj.latitude= [[NSString alloc]initWithFormat:@"%g",locationManager.];
		//appDelegateObj.longitude = [[NSString alloc]initWithFormat:@"%g",locationManager.longitude];
		//		
		
	}

    
    
//
//    ABAddressBookRef addressBook = ABAddressBookCreate(); NSArray *thePeople = (NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
//    for (id person in thePeople)
//        
//    {
//        NSString *name = (NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
//        [phoneArray2 addObject:name];
//        NSLog(@"!!!!!! name ---> %@",name);
//    }
    Contname=[[NSMutableArray alloc]init];
    /*
    NSString *aName;
    
    ABAddressBookRef addressBook = ABAddressBookCreate(); NSArray *thePeople = (NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
    for (id person in thePeople)
        
    {
        //        NSString *name = (NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        //        [Contname addObject:name];
        //        NSLog(@"!!!!!! name ---> %@",name);
        //    }
        CFStringRef cfName = ABRecordCopyCompositeName(person);
        if (cfName != nil)
        {
            aName = [NSString stringWithString:(NSString *)cfName];
            CFRelease(cfName);
            [Contname addObject:aName];
        }
        else
        {
            aName = @"No Name";
            [Contname addObject:aName];
            
        }
    
    
    
        ABMultiValueRef phoneNumberProperty = ABRecordCopyValue(person, kABPersonPhoneProperty);
        NSArray* phoneNumbers = (NSArray*)ABMultiValueCopyArrayOfAllValues(phoneNumberProperty);
        NSLog(@"array phone number%@",phoneNumbers);
        
        
        NSString *strnumber;
        strnumber=[phoneNumbers objectAtIndex:0];
        if(strnumber==nil)
        {
            strnumber=@"No Number Found";
            
            [number addObject:strnumber];
            
        }else{
            
            [number addObject:strnumber];
        }
        ABMultiValueRef emailslistproperty = ABRecordCopyValue(person, kABPersonEmailProperty);
        NSArray* emailslist = (NSArray*)ABMultiValueCopyArrayOfAllValues(emailslistproperty);
        NSLog(@"array emailslist %@",emailslist);
        
        
        NSString *stremaillist;
        stremaillist=[emailslist objectAtIndex:0];
        if(stremaillist==nil)
        {
            stremaillist=@"No Email Found";
            
            [email addObject:stremaillist];
            
        }else{
            
            [email addObject:stremaillist];
        }
        

    
    }

*/
   
    
        
//    appDelegateObj.myobject = self;
//    appDelegateObj.mySelector = @selector(reloadMyTbl);
    
//    ABAddressBookRef addressbook = ABAddressBookCreate();
//    
//    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressbook);
//    NSLog(@"%@",allPeople);
//    CFIndex numPeople = ABAddressBookGetPersonCount(addressbook);
//    //  NSLog(@"%@",numPeople);
//    for (int i=0; i < numPeople; i++) { 
//        ABRecordRef person = CFArrayGetValueAtIndex(allPeople, i);
//        ABMutableMultiValueRef phonelist = ABRecordCopyValue(person, kABPersonPhoneProperty);
//        
//        CFIndex numPhones = ABMultiValueGetCount(phonelist);
//        NSMutableArray *phoneNo;
//        phoneNo = [[NSMutableArray alloc] init];
//        for (int j=0; j < numPhones; j++) {
//            CFTypeRef ABphone = ABMultiValueCopyValueAtIndex(phonelist, j);
//            NSString *personPhone = (NSString *)ABphone;
//            NSLog(@"%@",personPhone);
//            CFRelease(ABphone);
//            [phoneNo addObject:personPhone];
//            NSLog(@"%@",phoneNo);
//            [appDelegateObj.phoneBkDict setObject:phoneNo forKey:(NSString*)ABRecordCopyCompositeName(person)];
//        }
//        
//        emails = [[NSMutableDictionary alloc] init];
//        
//        ABMutableMultiValueRef emailMulti = ABRecordCopyValue(person, kABPersonEmailProperty);
//        emails = [[NSMutableArray alloc] init];
//        
//        CFIndex numEmail = ABMultiValueGetCount(emailMulti);
//        
//        for (int k = 0; k<numEmail; k++) {
//            NSString *anEmail = [(NSString*)ABMultiValueCopyValueAtIndex(emailMulti, k) autorelease];
//            NSLog(@"%@",anEmail);
//            [emails addObject:anEmail];
//            NSLog(@"%@",emails);
//            [appDelegateObj.EmailDict setObject:emails forKey:(NSString*)ABRecordCopyCompositeName(person)];
//        }
//        // NSLog(@"%@",emails);
//        //         for(int k=0;k<[emails count];k++){
//        //         NSLog(@"email at index %d is %@",k,[emails objectAtIndex:k]);
//        //         }
//        // [dict setObject:emails forKey:@"Email"];
//        //  NSLog(@"Dictionary Contains%@",dict);
//        
//        
//        CFRelease(emailMulti);
//        [emails release];
//        [phoneNo release];
//        CFRelease(phonelist);
//        
//        //        CFDataRef imageData = ABPersonCopyImageData(person);
//        //        UIImage *image = [UIImage imageWithData:(NSData *)imageData];
//        //        CFRelease(imageData);
//        
//        [PhoneBookArray addObject:(NSString*)ABRecordCopyCompositeName(person)];
//    }
//    NSLog(@"%@",appDelegateObj.phoneBkDict);
//    NSLog(@"%@",PhoneBookArray);
//    CFRelease(allPeople);
//    CFRelease(addressbook);
//
    Name = [[NSMutableArray alloc] init];
    
    
    [mysegment setImage:[UIImage imageNamed:@"GMConSel.png"]forSegmentAtIndex:0];
    [mysegment setImage:[UIImage imageNamed:@"Phone.png"]forSegmentAtIndex:1];
    
    //[phoneArray2 addObjectsFromArray:appDelegateObj.PhoneBookArray];
    
    searchbar.tag = 1;
    
    [AlertHandler showAlertForProcess];
    
    //Get friend list
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/friend_list.php?user_id=%i",appDelegateObj.userID];    
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];
    
    //[appDelegateObj getContacts];

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
            
            [number addObject:strnumber];
            [phonAry addObject:strnumber];
            
        }else{
            
            [number addObject:strnumber];
            [phonAry addObject:strnumber];
        }
        ABMultiValueRef emailslistproperty = ABRecordCopyValue(person, kABPersonEmailProperty);
        NSArray* emailslist = (NSArray*)ABMultiValueCopyArrayOfAllValues(emailslistproperty);
        NSLog(@"array emailslist %@",emailslist);
        
        
        NSString *stremaillist1;
        stremaillist1=[emailslist objectAtIndex:0];
        if(stremaillist1==nil)
        {
            stremaillist1=@"No Email Found";
            
            [email addObject:stremaillist1];
            [phonAry addObject:stremaillist1];
            
        }else{
            
            [email addObject:stremaillist1];
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
    [phoneArray2 addObjectsFromArray:Contname];
    
    [phncontacttbl reloadData];
    
}


-(void)showPeoplePickerController
{
    [phoneArray2 removeAllObjects];
    
    ABAddressBookRef addressBook = ABAddressBookCreate();
	// Search for the person named "Appleseed" in the address book
    NSArray *people = (NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
    NSLog(@"%@",people);
  //  ABRecordRef person = (ABRecordRef)[people objectAtIndex:0];
    
    
    
    for (id person in people)
    {
        NSString *name = (NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        [Contname addObject:name];
        
        ABMultiValueRef phoneNumberProperty = ABRecordCopyValue(person, kABPersonPhoneProperty);
        NSArray* phoneNumbers = (NSArray*)ABMultiValueCopyArrayOfAllValues(phoneNumberProperty);
        NSLog(@"array phone number%@",phoneNumbers);
        
        
        
//        NSString *Phone = (NSString *)ABRecordCopyValue(person, kABPersonPhoneProperty);
        for (int j=0; j<[phoneNumbers count]; j++) {
            [number addObject:[phoneNumbers objectAtIndex:j]];
        }
        
        ABMultiValueRef emailslistproperty = ABRecordCopyValue(person, kABPersonEmailProperty);
        NSArray* emailslist = (NSArray*)ABMultiValueCopyArrayOfAllValues(emailslistproperty);
        NSLog(@"array emailslist %@",emailslist);
        
      //  NSString *Email = (NSString *)ABRecordCopyValue(person, kABPersonEmailProperty);
        if (emailslist == NULL) {
            for (int k=0; k<[emailslist count]; k++) {
                [email addObject:@"NoEmail"];
            }
        }
        else
        {
            for (int l=0; l<[emailslist count]; l++) {
                 [email addObject:[emailslist objectAtIndex:l]];
            }
       
        }
        
        NSLog(@"!!!!!! name ---> %@",name);
    }

    NSLog(@"%@",Contname);
    NSLog(@"%@",number);
    NSLog(@"%@",email);
    
    [phoneArray2 addObjectsFromArray:Contname];
    
    
    [phnArray addObjectsFromArray:phoneArray2];
    
    NSLog(@"%@",phnArray);

    
//    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
//    picker.peoplePickerDelegate = self;
//    // Display only a person's phone, email, and birthdate
//    NSArray *displayedItems = [NSArray arrayWithObjects:[NSNumber numberWithInt:kABPersonPhoneProperty], 
//                               [NSNumber numberWithInt:kABPersonEmailProperty],
//                               [NSNumber numberWithInt:kABPersonBirthdayProperty],
//                               [NSNumber numberWithInt:kABPersonFirstNameProperty], nil];
//    
//    
//    picker.displayedProperties = displayedItems;
//    
//    NSLog(@"%i",kABPersonFirstNameProperty);
    
    // Show the picker 
  //  [self presentModalViewController:picker animated:YES];
   // [picker release];	
}


-(void)SearchDatafatch:(NSDictionary*)dictionary
{
    [searchArray removeAllObjects];
    [SearchUserId removeAllObjects];
    [searchEmailList removeAllObjects];
    [searchPhnNo removeAllObjects];
    [searchBdate removeAllObjects];
    [searchLname removeAllObjects];
    
        NSLog(@"%@",dictionary);
        NSMutableArray *tempArray = [dictionary objectForKey:@"Record"];
        NSLog(@"%@",tempArray);
        
        for (int i=0; i<[tempArray count]; i++) {
            NSMutableDictionary *tempDic = [[tempArray objectAtIndex:i]copy];
            [searchArray addObject:[[tempDic valueForKey:@"firstname"] copy]];
            [searchLname addObject:[[tempDic valueForKey:@"lastname"] copy]];
            
            [SearchUserId addObject:[[tempDic valueForKey:@"uid"] copy]];
          //  [searchEmailList addObject:[[tempDic valueForKey:@"email"] copy]];
          //  [searchPhnNo addObject:[[tempDic valueForKey:@"phone"] copy]];
           // [searchBdate addObject:[[tempDic valueForKey:@"bday"] copy]];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[tempDic valueForKey:@"uid"] copy] forKey:[[tempDic valueForKey:@"firstname"] copy]];
            [tempDic release];
            
        }
        
        NSLog(@"%@",searchArray);
        NSLog(@"%@",SearchUserId);
    
        [searchTbl reloadData];
        
    
    /*
    searchArray = [[NSMutableArray alloc] init];
    NSLog(@"%@",dictionary);
    NSMutableArray *tempArray = [dictionary objectForKey:@"Record"];
    NSLog(@"%@",tempArray);
    
    for (int i=0; i<[tempArray count]; i++) {
        NSMutableDictionary *tempDic = [[tempArray objectAtIndex:i]copy];
        [searchArray addObject:[[tempDic valueForKey:@"firstname"] copy]];
        [tempDic release];
    }
    
    NSLog(@"%@",searchArray);
    
    [searchTbl reloadData];
     */
  //  [searchTbl bringSubviewToFront:self.view];
   // [searchTbl setUserInteractionEnabled:YES];
  //  phncontacttbl.hidden = YES;
  //  gluemecontacttbl.hidden = YES;
    
}


-(void)searchwithKeyWord:(UISearchBar*)SearchB{
	
    if (SearchB.tag == 1) {
        phncontacttbl.hidden = YES;
        gluemecontacttbl.hidden = YES;
        searchTbl.hidden = NO;
        if ([SearchB.text isEqualToString:@""]) {
            [searchArray removeAllObjects];
            [searchTbl reloadData];
            [self segmentedControlIndexChanged];
            

        }
        else
        {
            NSLog(@"%@",searchArray);
            
            NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/search_user.php?username=%@",SearchB.text];  
           // http://www.openxcellaus.info/glueme/search_user.php?username=r
            
            
            NSLog(@"%@",urlString);
            
            NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
            
            JSONParser *parser;
            parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(SearchDatafatch:) andHandler:self];
            
        }
        // http://www.openxcellaus.info/glueme/search_user.php
        
		/*
         
         [dataSource removeAllObjects];
         NSDictionary *dic1;
         //NSString *dic;
         for(dic1 in searchNameArray)
         {
         NSString *st =	[dic1 copy];
         
         NSRange rang =[st rangeOfString:SearchB.text options:NSCaseInsensitiveSearch];
         
         
         if (rang.length == [SearchB.text length]) {
         [dataSource addObject:dic1];
         }else {
         [dataSource removeObject:dic1];
         }
         }
         [SearchTbl reloadData];
         */
	}

   
//    [mysegment setImage:[UIImage imageNamed:@"Phone.png"]forSegmentAtIndex:1];
//    [mysegment setImage:[UIImage imageNamed:@"GMCon.png"]forSegmentAtIndex:0];
		/*
        if (SearchB.tag == 1)
        {
        if ([SearchB.text isEqualToString:@""]) {
           
            [searchArray removeAllObjects];
            [SearchUserId removeAllObjects];
            [searchEmailList removeAllObjects];
            [searchPhnNo removeAllObjects];
            [searchBdate removeAllObjects];
            [searchTbl reloadData];
        }
        else
        {
            [searchArray removeAllObjects];
            [SearchUserId removeAllObjects];
            [searchEmailList removeAllObjects];
            [searchPhnNo removeAllObjects];
            [searchBdate removeAllObjects];
           
            NSLog(@"%@",searchArray);
            
            NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/search_user.php?username=%@",SearchB.text];  
            
            
            NSLog(@"%@",urlString);
            
            NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
            
            JSONParser *parser;
            parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(SearchDatafatch:) andHandler:self];
            searchTbl.hidden = FALSE;
            gluemecontacttbl.hidden = TRUE;
            phncontacttbl.hidden = TRUE;
            
        }
        }
        */
		/*
		[Name removeAllObjects];
		NSDictionary *dic1;
		//NSString *dic;
		for(dic1 in contactname)
		{
			NSString *st =	[dic1 copy];
			
			NSRange rang =[st rangeOfString:SearchB.text options:NSCaseInsensitiveSearch];
			
			
			if (rang.length == [SearchB.text length]) {
				[Name addObject:dic1];
			}else {
				[Name removeObject:dic1];
			}
		}
		[gluemecontacttbl reloadData];
		*/
    
    
	if (SearchB.tag == 2) {
		
		[phoneArray2 removeAllObjects];
		NSDictionary *dic2;
		//NSString *dic;
		for(dic2 in Contname)
		{
			NSString *st =	[dic2 copy];
			
			NSRange rang =[st rangeOfString:SearchB.text options:NSCaseInsensitiveSearch];
			
			
			if (rang.length == [SearchB.text length]) {
				[phoneArray2 addObject:dic2];
			}else {
				[phoneArray2 removeObject:dic2];
			}
		}
//        if ([phoneArray2 count] >0) {
        [phncontacttbl bringSubviewToFront:self.view];
        [phncontacttbl setUserInteractionEnabled:YES];
            [phncontacttbl reloadData];
//        }
		
		
	}
     
        
	
}


-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
	[searchBar setShowsCancelButton:YES animated:YES];
	searchBar.showsCancelButton=YES;
	return YES;
}
-(BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
	
    [self performSelector:@selector(searchwithKeyWord:) withObject:searchBar afterDelay:0.2];
	
	return YES;
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
	[searchBar setShowsCancelButton:NO animated:YES];
	[searchBar resignFirstResponder];
	
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
	[searchBar resignFirstResponder];
	[searchBar setShowsCancelButton:NO animated:YES];
}
-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
	
	[self searchwithKeyWord:searchBar];
	return YES;
}



-(IBAction)segmentedControlIndexChanged
{
    searchbar.text = @"";
    
    UIImageView *tableImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, 309, 248)];
    [tableImg setImage:[UIImage imageNamed:@"tblBackGround.png"]];
    
	switch(mysegment.selectedSegmentIndex) 
	{
		case 0:
			gluemecontacttbl.hidden = FALSE;
			phncontacttbl.hidden = TRUE;
            searchTbl.hidden = TRUE;
			//[AlertHandler showAlertForProcess];
            
            [mysegment setImage:[UIImage imageNamed:@"GMConSel.png"]forSegmentAtIndex:0];
            [mysegment setImage:[UIImage imageNamed:@"Phone.png"]forSegmentAtIndex:1];
            searchbar.tag = 1;
            [gluemecontacttbl bringSubviewToFront:self.view];
            [gluemecontacttbl setUserInteractionEnabled:YES];
			[gluemecontacttbl reloadData];
            
            
            //  [gluemecontacttbl setBackgroundView:tableImg];
			
			//[SEGCntrlContacts setImage:[UIImage imageNamed:@"contactsB.png"] forSegmentAtIndex:0];
			//			[SEGCntrlContacts setImage:[UIImage imageNamed:@"inviteW.png"] forSegmentAtIndex:1];
			//			[SEGCntrlContacts setImage:[UIImage imageNamed:@"StatusW.png"]forSegmentAtIndex:2];
			
			
			break;
		case 1:
            
             [self GetPhoneContact];
            
			gluemecontacttbl.hidden=TRUE;
			phncontacttbl.hidden=FALSE;
			searchTbl.hidden = TRUE;
            [mysegment setImage:[UIImage imageNamed:@"GMCon.png"]forSegmentAtIndex:0];
            [mysegment setImage:[UIImage imageNamed:@"PhoneSel.png"]forSegmentAtIndex:1];
            searchbar.tag = 2;
			//[phncontacttbl setBackgroundView:tableImg];
            [phncontacttbl bringSubviewToFront:self.view];
            [phncontacttbl setUserInteractionEnabled:YES];
			[phncontacttbl reloadData];
			
			//[SEGCntrlContacts setImage:[UIImage imageNamed:@"contactsW.png"] forSegmentAtIndex:0];
			//			[SEGCntrlContacts setImage:[UIImage imageNamed:@"inviteB.png"] forSegmentAtIndex:1];
			//			[SEGCntrlContacts setImage:[UIImage imageNamed:@"StatusW.png"]forSegmentAtIndex:2];
			break;
	}
}



-(void)datafatch:(NSDictionary*)dictionary{
    
    [AlertHandler hideAlert];
        
    /*
     -(void)datafatch:(NSDictionary*)dictionary{
     
     //    contactArray = [[NSMutableArray alloc] init];
     //    
     //    contactname = [[NSMutableArray alloc] init];
     //    contactnum = [[NSMutableArray alloc] init];
     //    contactemail = [[NSMutableArray alloc] init];
     if(arremail!=nil){
     [arremail release];
     }
     [nameArray removeAllObjects];
     
     arremail=[[NSMutableArray alloc]init];
     
     NSLog(@"%@",dictionary);
     
     dic = [[NSMutableDictionary alloc] initWithDictionary:dictionary];    
     for (int i=0; i<[[dictionary valueForKey:@"friend_list"]count]; i++) 
     {
     
     
     
     [nameArray addObject:[[[dictionary valueForKey:@"friend_list"] valueForKey:@"firstname"] objectAtIndex:i]];
     [arremail addObject:[[[dictionary valueForKey:@"friend_list"] valueForKey:@"email"] objectAtIndex:i]];
     
     
     NSString *Name = [[[dictionary valueForKey:@"friend_list"] valueForKey:@"firstname"] objectAtIndex:i];
     
     [uidArray addObject:[[[dictionary valueForKey:@"friend_list"] valueForKey:@"uid"] objectAtIndex:i]];
     
     NSString *uid = [[[dictionary valueForKey:@"friend_list"] valueForKey:@"uid"] objectAtIndex:i];
     
     //        
     //        [contactemail addObject:[[[dictionary valueForKey:@"users"] valueForKey:@"email"] objectAtIndex:i]];
     
     
     [uidDic setValue:uid forKey:Name];
     
     
     
     
     }
     [AlertHandler hideAlert];
     
     
     if([arremail count]==0 && [nameArray count]==0){
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"No record found"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
     [alert show];
     [alert release];		
     //[nameArray addObject:@"No record found"];
     }
     
     else
     [tbl reloadData];
     
     
     NSLog(@"%@",nameArray);
     NSLog(@"%@",uidArray);
     NSLog(@"%@",uidDic);
     
     
     }

    */
    
    
    contactArray=[[NSMutableArray alloc]init];
    contactnum=[[NSMutableArray alloc]init];
    contactname=[[NSMutableArray alloc]init];
    contactemail=[[NSMutableArray alloc] init];
    lnamearray=[[NSMutableArray alloc]init];
    bdate=[[NSMutableArray alloc] init];
    
    for (int i=0; i<[[dictionary valueForKey:@"friend_list"]count]; i++) 
    {
        [contactArray addObject:[[[dictionary valueForKey:@"friend_list"] valueForKey:@"user_id"] objectAtIndex:i]];
        [contactname addObject:[[[dictionary valueForKey:@"friend_list"] valueForKey:@"firstname"] objectAtIndex:i]];
        
        [contactnum addObject:[[[dictionary valueForKey:@"friend_list"] valueForKey:@"phone"] objectAtIndex:i]];
        
        [contactemail addObject:[[[dictionary valueForKey:@"friend_list"] valueForKey:@"email"] objectAtIndex:i]];
        
        [lnamearray addObject:[[[dictionary valueForKey:@"friend_list"] valueForKey:@"lastname"] objectAtIndex:i]];
        
        [bdate addObject:[[[dictionary valueForKey:@"friend_list"] valueForKey:@"bday"] objectAtIndex:i]];
        
        
    }
    
    [Name addObjectsFromArray:contactname];
    [gluemecontacttbl bringSubviewToFront:self.view];
    [gluemecontacttbl setUserInteractionEnabled:YES];
    phncontacttbl.hidden = TRUE;
    searchTbl.hidden = TRUE;
    [gluemecontacttbl reloadData];
    
    
}

-(IBAction)onMap:(id)sender{
	
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
     appDelegateObj.count = 0;
    [self.navigationController pushViewController:mymapObj animated:NO];
    
//	whoGlueObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
   
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{ 
    
    if (tableView == searchTbl) {
        contactVwDetail = [[ContactDetailView alloc] initWithNibName:@"ContactDetailView" bundle:nil];
        appDelegateObj.selectedUser = [searchArray objectAtIndex:indexPath.row];
        appDelegateObj.strid=[SearchUserId objectAtIndex:indexPath.row];
        appDelegateObj.selectpage=@"SearchTbl";
      //   appDelegateObj.selectpage=@"SearchTbl";
      //  appDelegateObj.SelectedEmail = [searchEmailList objectAtIndex:indexPath.row];
      //  appDelegateObj.SelectedPhnNo = [searchPhnNo objectAtIndex:indexPath.row];
      // appDelegateObj.selectedBdate = [searchBdate objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:contactVwDetail animated:YES];
        
        
    }
    if (tableView == gluemecontacttbl) {
        
        contactVwDetail = [[ContactDetailView alloc] initWithNibName:@"ContactDetailView" bundle:nil];
        
        
        appDelegateObj.strid=[contactArray objectAtIndex:indexPath.row];
        NSLog(@"%@",appDelegateObj.strid);
        appDelegateObj.selectpage=@"contactdetail";
        appDelegateObj.SelectedEmail=[contactemail objectAtIndex:indexPath.row];
        
        appDelegateObj.selectedUser=[Name objectAtIndex:indexPath.row];
        
        appDelegateObj.SelectedPhnNo=[contactnum objectAtIndex:indexPath.row];
      //  appDelegateObj.selectedBdate = [BdayArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:contactVwDetail animated:YES];
        
        
        
        //selectedRow = indexPath.row;
        //[GlueContactTbl reloadData];
    }

    
    /*if (tableView == gluemecontacttbl) {
        objglue = [[GetGlueViewController alloc] initWithNibName:@"GetGlueViewController" bundle:nil];
        appDelegateObj.contactemail=[contactemail objectAtIndex:indexPath.row];
        appDelegateObj.strid=[contactArray objectAtIndex:indexPath.row];
        
        appDelegateObj.contactname=[contactname objectAtIndex:indexPath.row];
        appDelegateObj.lname=[lnamearray objectAtIndex:indexPath.row];
        
        appDelegateObj.bdateStr=[bdate objectAtIndex:indexPath.row];
        
        
        appDelegateObj.contactnum=[contactnum objectAtIndex:indexPath.row];
        
        [self.navigationController pushViewController:objglue animated:YES];
    }*/
    if (tableView == phncontacttbl) {
       appDelegateObj.selectpage=@"phonebook";
        
        phonebookdetailObj = [[phoneBookDetail alloc] initWithNibName:@"phoneBookDetail" bundle:nil :(NSString *)[Contname objectAtIndex:indexPath.row]];
        appDelegateObj.selectedUser=[phoneArray2 objectAtIndex:indexPath.row];
        
        appDelegateObj.SelectedPhnNo=[[phoneDic objectForKey:appDelegateObj.selectedUser] objectAtIndex:1];
        
        appDelegateObj.SelectedEmail=[[phoneDic objectForKey:appDelegateObj.selectedUser] objectAtIndex:2];
        
        [self.navigationController pushViewController:phonebookdetailObj animated:YES];
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == gluemecontacttbl) {
         return [Name count];
    }
    if (tableView == phncontacttbl) {
        return [phoneArray2 count];
    }
    if (tableView == searchTbl) {
        return [searchArray count];
    }

   
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0,10,270, 57)];
    [cellImg setImage:[UIImage imageNamed:@"CellImg"]];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        [cell.contentView addSubview:cellImg];

    }
    // cell.textLabel.text = [PhoneBookArray objectAtIndex:indexPath.row];
    
//    UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 295, 44)];
//    [cellImg setImage:[UIImage imageNamed:@"contactCellImg.png"]];
//    cell.backgroundView = cellImg;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (tableView == gluemecontacttbl) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",[Name objectAtIndex:indexPath.row],[lnamearray objectAtIndex:indexPath.row]] ;
    }
    else if(tableView == searchTbl)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",[searchArray objectAtIndex:indexPath.row],[searchLname objectAtIndex:indexPath.row]];
    }
    else
    {
        cell.textLabel.font = [UIFont fontWithName:@"arial" size:18];
		//cell.textLabel.textColor=[UIColor whiteColor];
		
        cell.textLabel.text = [phoneArray2 objectAtIndex:indexPath.row];
        
        //cell.detailTextLabel.textColor = [UIColor whiteColor];
		//cell.contentView.backgroundColor=[UIColor clearColor];
		
        cell.textLabel.backgroundColor=[UIColor clearColor];
        
        //phncontacttbl.frame=CGRectMake(20, 155, 280, [appDelegateObj.PhoneBookArray count]*44);
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    
    return cell;
    
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
