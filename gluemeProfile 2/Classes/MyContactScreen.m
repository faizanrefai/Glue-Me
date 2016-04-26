//
//  MyContactScreen.m
//  glueme
//
//  Created by APPLE  on 9/21/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import "MyContactScreen.h"
#import "phoneBookDetail.h"
#import "FAQHelp.h"
#import "whogluedmap.h"
#include <AddressBook/AddressBook.h>
#import "AlertHandler.h"

@implementation MyContactScreen

@synthesize searchbar,SearchTbl,contactArray,searchNameArray,contactSegment,GlueContactTbl,PhonebookTbl,phonebookcell,selectedRow,nameArray2,Contname,SearchUserId,searchEmailList,searchPhnNo,searchBdate,BdayArray,phoneDic,phonAry;
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
    appDelegateObj.count = 0;
    [self.navigationController pushViewController:mymapObj animated:NO];
    
	//whoGlueObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
	
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

-(IBAction)segmentedControlIndexChanged
{
    searchbar.text = @"";
    switch(contactSegment.selectedSegmentIndex) 
    {
        
        case 0:
            
            searchbar.text = @"";
           
            SearchTbl.hidden = NO;
            GlueContactTbl.hidden = YES;
            PhonebookTbl.hidden = YES;
                      
            [contactSegment setImage:[UIImage imageNamed:@"SearchSel.png"]forSegmentAtIndex:0];
            [contactSegment setImage:[UIImage imageNamed:@"GlueMeCont.png"]forSegmentAtIndex:1];
            [contactSegment setImage:[UIImage imageNamed:@"Phonebook.png"] forSegmentAtIndex:2];
            
            searchbar.tag = 1;
            
            //[SEGCntrlContacts setImage:[UIImage imageNamed:@"contactsB.png"] forSegmentAtIndex:0];
            //            [SEGCntrlContacts setImage:[UIImage imageNamed:@"inviteW.png"] forSegmentAtIndex:1];
            //            [SEGCntrlContacts setImage:[UIImage imageNamed:@"StatusW.png"]forSegmentAtIndex:2];
            
            
            break;
        case 1:
            
            
            SearchTbl.hidden = YES;
            GlueContactTbl.hidden = NO;
            PhonebookTbl.hidden = YES;
            
            [contactSegment setImage:[UIImage imageNamed:@"SearchSeg.png"]forSegmentAtIndex:0];
            [contactSegment setImage:[UIImage imageNamed:@"GlueMeContSel.png"]forSegmentAtIndex:1];
            [contactSegment setImage:[UIImage imageNamed:@"Phonebook.png"] forSegmentAtIndex:2];
            
            searchbar.tag = 2;

            
            //[SEGCntrlContacts setImage:[UIImage imageNamed:@"contactsW.png"] forSegmentAtIndex:0];
            //            [SEGCntrlContacts setImage:[UIImage imageNamed:@"inviteB.png"] forSegmentAtIndex:1];
            //            [SEGCntrlContacts setImage:[UIImage imageNamed:@"StatusW.png"]forSegmentAtIndex:2];
            break;
        case 2:
            
            SearchTbl.hidden = YES;
            GlueContactTbl.hidden = YES;
            PhonebookTbl.hidden = NO;
            
            [contactSegment setImage:[UIImage imageNamed:@"SearchSeg.png"]forSegmentAtIndex:0];
            [contactSegment setImage:[UIImage imageNamed:@"GlueMeCont.png"]forSegmentAtIndex:1];
            [contactSegment setImage:[UIImage imageNamed:@"PhonebookSel.png"] forSegmentAtIndex:2];
            
            searchbar.tag = 3;
            
           // [self chooseContacts];
            
            break;
    }
}

- (void)dealloc
{
   // [PhoneBookArray release];
    [searchNameArray release];
    [PhonebookTbl release];
    [GlueContactTbl release];
    [contactSegment release];
    [super dealloc];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == SearchTbl) {
        return [dataSource count];
    }
    if (tableView == GlueContactTbl) {
        return [contactname count];
    }
    if (tableView == PhonebookTbl) {
        return [phoneArray2 count];
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
    
    
    if (tableView == SearchTbl) {
        
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
            [cell.contentView addSubview:cellImg];  

        }
        
//        UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 295, 44)];
//        [cellImg setImage:[UIImage imageNamed:@"contactCellImg.png"]];
       
       
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = [dataSource objectAtIndex:indexPath.row];
        cell.textLabel.textColor = [UIColor blackColor];
//        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    else if(tableView == GlueContactTbl)
    {
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
            [cell.contentView addSubview:cellImg];  
            
        }
        // cell.textLabel.text = [PhoneBookArray objectAtIndex:indexPath.row];
//        UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 295, 44)];
//        [cellImg setImage:[UIImage imageNamed:@"contactCellImg.png"]];
//        cell.backgroundView = cellImg;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
//        UIButton *dltBtn;
//        UIButton *lblBtn;
//        UILabel *nameLbl;
//        
//        lblBtn = (UIButton *)[cell.contentView viewWithTag:1];
//        dltBtn = (UIButton *)[cell.contentView viewWithTag:2];
//        nameLbl = (UILabel *)[cell.contentView viewWithTag:3];
//        nameLbl.textColor = [UIColor blackColor];
       // nameLbl.text = [[NSString alloc] initWithFormat:@"%@",[[[dic valueForKey:@"Record"] valueForKey:@"firstname"] objectAtIndex:indexPath.row]];
        cell.textLabel.text = [contactname objectAtIndex:indexPath.row];
        
//        [lblBtn addTarget:self action:@selector(lblBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [lblBtn setTag:indexPath.row];
//        [dltBtn addTarget:self action:@selector(dltBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [dltBtn setTag:indexPath.row];
////        if (selectedRow == indexPath.row) {
//            [lblBtn setImage:[UIImage imageNamed:@"selectedPoint.png"] forState:UIControlStateNormal];
        
//        }
    }
    else if(tableView == PhonebookTbl)
    {
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
            [cell.contentView addSubview:cellImg];  

        }
        //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
//        UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 295, 44)];
//        [cellImg setImage:[UIImage imageNamed:@"contactCellImg.png"]];
//        cell.backgroundView = cellImg;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = [phoneArray2 objectAtIndex:indexPath.row];
        cell.textLabel.textColor = [UIColor blackColor];
        //[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
    }
    return cell;

}

-(void)lblBtnClicked:(id)sender
{
    UIButton *Btn= (UIButton*)sender;
    NSLog(@"%d",Btn.tag);
}

-(void)dltBtnClicked:(id)sender
{
    UIButton *Btn= (UIButton*)sender;
    
    [contactArray removeObjectAtIndex:Btn.tag];
    [GlueContactTbl reloadData];
    
    NSLog(@"%d",Btn.tag);
}

-(IBAction)onFAQ:(id)sender
{
	FAQHelp *faqhelp=[[FAQHelp alloc]initWithNibName:@"FAQHelp" bundle:nil];
	[self.navigationController pushViewController:faqhelp animated:YES];
	[faqhelp release];
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == SearchTbl) {
        contactVwDetail = [[ContactDetailView alloc] initWithNibName:@"ContactDetailView" bundle:nil];
        appDelegateObj.selectedUser = [dataSource objectAtIndex:indexPath.row];
        appDelegateObj.strid = [SearchUserId objectAtIndex:indexPath.row];
        appDelegateObj.selectpage=@"SearchTbl";
      //  appDelegateObj.SelectedEmail = [searchEmailList objectAtIndex:indexPath.row];
      //  appDelegateObj.SelectedPhnNo = [searchPhnNo objectAtIndex:indexPath.row];
      //  appDelegateObj.selectedBdate = [searchBdate objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:contactVwDetail animated:YES];
        
        
    }
    if (tableView == GlueContactTbl) {
        
        contactVwDetail = [[ContactDetailView alloc] initWithNibName:@"ContactDetailView" bundle:nil];

        
        appDelegateObj.strid=[contactArray objectAtIndex:indexPath.row];
        appDelegateObj.selectpage=@"contactdetail";
        appDelegateObj.SelectedEmail=[contactemail objectAtIndex:indexPath.row];
        
        appDelegateObj.selectedUser=[contactname objectAtIndex:indexPath.row];
        
        appDelegateObj.SelectedPhnNo=[contactnum objectAtIndex:indexPath.row];
        appDelegateObj.selectedBdate = [BdayArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:contactVwDetail animated:YES];
        
         

       //selectedRow = indexPath.row;
        //[GlueContactTbl reloadData];
    }
    if (tableView == PhonebookTbl) {
        appDelegateObj.selectpage=@"phonebook";
        
        phonebookdetailObj = [[phoneBookDetail alloc] initWithNibName:@"phoneBookDetail" bundle:nil :(NSString *)[Contname objectAtIndex:indexPath.row]];
        appDelegateObj.selectedUser=[phoneArray2 objectAtIndex:indexPath.row];
        
        appDelegateObj.SelectedPhnNo=[[phoneDic objectForKey:appDelegateObj.selectedUser] objectAtIndex:1];
        
        appDelegateObj.SelectedEmail=[[phoneDic objectForKey:appDelegateObj.selectedUser] objectAtIndex:2];
        
        [self.navigationController pushViewController:phonebookdetailObj animated:YES];
    }
    
}

-(void)getRegisteredUserForSearch
{
    NSString *urlString = @"http://www.openxcellaus.info/glueme/search_user.php";  
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(Regdatafatch:) andHandler:self];

}

-(void)Regdatafatch:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);
    NSMutableArray *tempArray = [dictionary objectForKey:@"Record"];
    NSLog(@"%@",tempArray);
    
    for (int i=0; i<[tempArray count]; i++) {
        NSMutableDictionary *tempDic = [tempArray objectAtIndex:i];
        [searchNameArray addObject:[tempDic valueForKey:@"firstname"]];
        [tempDic release];
    }
    
    NSLog(@"%@",searchNameArray);
    
}

-(void)SearchDatafatch:(NSDictionary*)dictionary
{
    SearchUserId = [[NSMutableArray alloc] init];
    dataSource = [[NSMutableArray alloc] init];
    searchEmailList = [[NSMutableArray alloc] init];
    searchPhnNo = [[NSMutableArray alloc] init];
    searchBdate = [[NSMutableArray alloc] init];
    NSLog(@"%@",dictionary);
    NSMutableArray *tempArray = [dictionary objectForKey:@"Record"];
    NSLog(@"%@",tempArray);
    
    for (int i=0; i<[tempArray count]; i++) {
        NSMutableDictionary *tempDic = [[tempArray objectAtIndex:i]copy];
        [dataSource addObject:[[tempDic valueForKey:@"firstname"] copy]];
        [SearchUserId addObject:[[tempDic valueForKey:@"uid"] copy]];
      //  [searchEmailList addObject:[[tempDic valueForKey:@"email"] copy]];
      //  [searchPhnNo addObject:[[tempDic valueForKey:@"phone"] copy]];
      //  [searchBdate addObject:[[tempDic valueForKey:@"bday"] copy]];
        
        [[NSUserDefaults standardUserDefaults] setValue:[[tempDic valueForKey:@"uid"] copy] forKey:[[tempDic valueForKey:@"firstname"] copy]];
        [tempDic release];
        
    }
    
    NSLog(@"%@",dataSource);
     NSLog(@"%@",SearchUserId);
    [SearchTbl reloadData];
    
}

-(void)searchwithKeyWord:(UISearchBar*)SearchB{
	
    
	if (SearchB.tag == 1) {
        
        if ([SearchB.text isEqualToString:@""]) {
            [dataSource removeAllObjects];
            [SearchTbl reloadData];
        }
        else
        {
        NSLog(@"%@",dataSource);

        NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/search_user.php?username=%@",SearchB.text];  
        
        
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
	if (SearchB.tag == 2) {
		
		
		[contactname removeAllObjects];
		NSDictionary *dic1;
		//NSString *dic;
		for(dic1 in nameArray2)
		{
			NSString *st =	[dic1 copy];
			
			NSRange rang =[st rangeOfString:SearchB.text options:NSCaseInsensitiveSearch];
			
			
			if (rang.length == [SearchB.text length]) {
				[contactname addObject:dic1];
			}else {
				[contactname removeObject:dic1];
			}
		}
        [GlueContactTbl reloadData];

		
	}
    if (SearchB.tag == 3) {
		
		
		[phoneArray2 removeAllObjects];
		NSDictionary *dic1;
		//NSString *dic;
		for(dic1 in Contname)
		{
			NSString *st =	[dic1 copy];
			
			NSRange rang =[st rangeOfString:SearchB.text options:NSCaseInsensitiveSearch];
			
			
			if (rang.length == [SearchB.text length]) {
				[phoneArray2 addObject:dic1];
			}else {
				[phoneArray2 removeObject:dic1];
			}
		}
       // if ([phoneArray2 count] >0) {
            [PhonebookTbl reloadData];
      //  }
		
		
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
    UIImageView *topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
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

    
    phoneDic = [[NSMutableDictionary alloc] init];
    phonAry = [[NSMutableArray alloc] init];
    
    appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication]delegate];
       
    
    contactSegment.selectedSegmentIndex = 0;
    SearchTbl.hidden = NO;
    GlueContactTbl.hidden = YES;
    PhonebookTbl.hidden = YES;
    
      
   // contactArray = [[NSMutableArray alloc] init];
   
   // http://www.openxcellaus.info/glueme/user_list.php
    
     
    searchbar.tag = 1;
    
    
//    [contactArray addObject:@"Ace Vantura"];
//    [contactArray addObject:@"Eddie Vedder"];
//    [contactArray addObject:@"Mark Webber"];
//    [contactArray addObject:@"Ozzy Osbourne"];
//    [contactArray addObject:@"Sabastian Vettel"];
    
   // PhoneBookArray = [[NSMutableArray alloc] init];
//    [PhoneBookArray addObject:@"Ashton Kutcher"];
//    [PhoneBookArray addObject:@"David Bowie"];
//    [PhoneBookArray addObject:@"Eminem"];
//    [PhoneBookArray addObject:@"Jim Morrison"];
//    [PhoneBookArray addObject:@"Tony Stark"];
    
    names = [[NSMutableArray alloc] init];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



-(void)datafatch:(NSDictionary*)dictionary{
    Contname = [[NSMutableArray alloc] init];
    
    searchNameArray = [[NSMutableArray alloc] init];
    
    
    contactArray = [[NSMutableArray alloc] init];
    
    nameArray2 = [[NSMutableArray alloc] init];
    contactnum = [[NSMutableArray alloc] init];
    contactemail = [[NSMutableArray alloc] init];
    phoneArray2 = [[NSMutableArray alloc] init];
    contactname = [[NSMutableArray alloc] init];
    BdayArray = [[NSMutableArray alloc]init];
    [AlertHandler hideAlert];
    
    dic = [[NSMutableDictionary alloc] initWithDictionary:dictionary];   
    
    NSLog(@"%@",dic);
    
    NSLog(@"%@",[[dic valueForKey:@"friend_list"] valueForKey:@"firstname"]);
    
    [self GetPhoneContact];
    
       
    for (int i=0; i<[[dic valueForKey:@"friend_list"]count]; i++) 
    {
        
        
        
        [contactArray addObject:[[[dic valueForKey:@"friend_list"] valueForKey:@"user_id"] objectAtIndex:i]];
        
        [nameArray2 addObject:[[[dic valueForKey:@"friend_list"] valueForKey:@"firstname"] objectAtIndex:i]];
        
        [contactnum addObject:[[[dic valueForKey:@"friend_list"] valueForKey:@"phone"] objectAtIndex:i]];
        
        [contactemail addObject:[[[dic valueForKey:@"friend_list"] valueForKey:@"email"] objectAtIndex:i]];
        [BdayArray addObject:[[[dic valueForKey:@"friend_list"] valueForKey:@"bday"] objectAtIndex:i]];
        
    }
    
  //  searchNameArray=[NSMutableArray arrayWithArray:[nameArray2 arrayByAddingObjectsFromArray:phoneArray2]];
    
    
   // [searchNameArray addObjectsFromArray:nameArray2];
    //[searchNameArray addObjectsFromArray:phoneArray2];
    
   
    
     //NSLog(@"%@",nameArray2);
    [contactname addObjectsFromArray:nameArray2];
       [GlueContactTbl reloadData];
   // [searchNameArray addObjectsFromArray:contactname];

    [searchNameArray addObjectsFromArray:Contname];
    
    
  //  [dataSource addObjectsFromArray:searchNameArray];
    [SearchTbl reloadData];

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
    
    [PhonebookTbl reloadData];

}

-(void)Bump
{
    NSLog(@"BumpClicked");
    bumpObj = [[Bump alloc] initWithNibName:@"Bump" bundle:nil];
    [self.navigationController pushViewController:bumpObj animated:YES];
    
}

-(void)reloadMyTbl
{

    
    [PhonebookTbl reloadData];
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
    
    appDelegateObj.selectedUser = @"";
    appDelegateObj.SelectedEmail = @"";
    appDelegateObj.SelectedPhnNo = @"";
    appDelegateObj.selectedBdate = @"";
  //  [appDelegateObj getContacts];
    [SearchTbl reloadData];
    
    searchbar.text = @"";
    
    SearchTbl.hidden = NO;
    GlueContactTbl.hidden = YES;
    PhonebookTbl.hidden = YES;
    
    [contactSegment setImage:[UIImage imageNamed:@"SearchSel.png"]forSegmentAtIndex:0];
    [contactSegment setImage:[UIImage imageNamed:@"GlueMeCont.png"]forSegmentAtIndex:1];
    [contactSegment setImage:[UIImage imageNamed:@"Phonebook.png"] forSegmentAtIndex:2];
    
    searchbar.tag = 1;
    
    SearchTbl.rowHeight = 70.0;
    GlueContactTbl.rowHeight = 70.0;
    PhonebookTbl.rowHeight = 70.0;
    
    number=[[NSMutableArray alloc]init];
    email=[[NSMutableArray alloc]init];
    bdate=[[NSMutableArray alloc]init];
    
     [AlertHandler showAlertForProcess];
   
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/friend_list.php?user_id=%i",appDelegateObj.userID];  
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];

    //[self getRegisteredUserForSearch];
    
}




-(void)Back
{
    [self.navigationController popViewControllerAnimated:YES];
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
