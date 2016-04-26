//
//  meetingpointview.m
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import "meetingpointview.h"
#import "whogluedmap.h"
#import "FAQHelp.h"
#import "AlertHandler.h"

@implementation meetingpointview
@synthesize currentLat,currentLon,allPlacesArray,searchTblArray,searchTbl,searchText;


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
-(IBAction)setmeeting
{
    
    appDelegateObj.selectedFrnd = [NSString stringWithFormat:@""];
    meetingpointview *obj = [[meetingpointview alloc]init];
    [self.navigationController pushViewController:obj animated:YES];
    
//    listVwObj = [[listwhoglued alloc] initWithNibName:@"listwhoglued" bundle:nil];
//    [self.navigationController pushViewController:listVwObj animated:NO];
}

-(IBAction)onMap:(id)sender{
	
    
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
   
    
	//[self.navigationController popViewControllerAnimated:YES];
//	whoGlueVwObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
    appDelegateObj.count = 0;
     [self.navigationController pushViewController:mymapObj animated:NO];
  //  [self.navigationController pushViewController:whoGlueVwObj animated:NO];
	
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
    
    city = @"";
    
    allPlacesArray = [[NSMutableArray alloc] init];
	searchTblArray = [[NSMutableArray alloc] init];
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
    
    appDelegateObj = (gluemeAppDelegate*)[[UIApplication sharedApplication]delegate];
    
	tabelarr = [[NSMutableArray alloc]init];
	DetailArray = [[NSMutableArray alloc]init];
	
//	[tabelarr addObject:@"Cafe Inn"];
//	[tabelarr addObject:@"Cafe Inns"];
//	[tabelarr addObject:@"Cafe Rio"];
//	[DetailArray addObject:@"-Downtown"];
//	[DetailArray addObject:@"-Street Way"];
//	[DetailArray addObject:@"-Chicago"];
	//[tabelarr addObject:@"nepal"];
	
	
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
    
    searchbar.text = @"";
    
    [searchTbl setHidden:YES];
    [tbl setHidden:NO];
    [tbl reloadData];
    
    searchTbl.rowHeight = 70.0;
    tbl.rowHeight = 70.0;
    
    searchbar.tintColor = [UIColor whiteColor];

    [AlertHandler showAlertForProcess];
    locationManager = [[CLLocationManager alloc]init];
    
    
    NSString *deviceType = [UIDevice currentDevice].model;
    
    
	if([deviceType isEqualToString:@"iPod touch"]||[deviceType isEqualToString:@"iPhone"]||[deviceType isEqualToString:@"iPad"]){
        
        if([CLLocationManager locationServicesEnabled])
        {
            locationManager.delegate = self;
            locationManager.desiredAccuracy  = kCLLocationAccuracyKilometer;
            locationManager.distanceFilter = 1000.0f;
            [locationManager startUpdatingLocation];
            
            
            
            //	appDelegateObj.latitude= [[NSString alloc]initWithFormat:@"%g",locationManager.];
            //appDelegateObj.longitude = [[NSString alloc]initWithFormat:@"%g",locationManager.longitude];
            
        }
    }
    else{
        currentLat = 23.062100;
        currentLon = 72.553300;
        
        NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=23.062100,72.553300&radius=8046.72&sensor=false&key=AIzaSyAnToGW2ITMg8nIvMjDjkjYO-_1TVDdt_g"];
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];
    }
    
   
    
         
    
//    UIImageView *tblImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
//    [tblImg setImage:[UIImage imageNamed:@"tblBg.png"]];
//    
   // [tbl setBackgroundView:tblImg];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	NSString *strlat;
    NSString *strlong;
    NSString *deviceType = [UIDevice currentDevice].model;
    
    
	if([deviceType isEqualToString:@"iPod touch"]||[deviceType isEqualToString:@"iPhone"]||[deviceType isEqualToString:@"iPad"]){
        
    strlat= [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.latitude];
	strlong = [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.longitude];
        
        currentLat = newLocation.coordinate.latitude;
        currentLon = newLocation.coordinate.longitude;
        
    }
    else{
    
        strlat= @"23.062100";
        strlong = @"72.553300";
        
        currentLat = 23.062100;
        currentLon = 72.553300;

    }
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%@,%@&radius=8046.72&sensor=false&key=AIzaSyAnToGW2ITMg8nIvMjDjkjYO-_1TVDdt_g",strlat,strlong];
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];
    

    
    
}
-(void)datafatch:(NSDictionary*)dictionary{
    
    [AlertHandler hideAlert];
    
    resultArray =[[NSMutableArray alloc]init];
   
    NSLog(@"Dictionary Data :: %@",dictionary);
    
    for (int i=0; i<[[dictionary valueForKey:@"results"]count]; i++) 
    {
        
         NSMutableDictionary *tempDic = [[NSMutableDictionary alloc] init];
       
         [tempDic setValue:[[[[[dictionary valueForKey:@"results"] valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lat"] objectAtIndex:i] forKey:@"placeLat"];
        
        [tempDic setValue:[[[[[dictionary valueForKey:@"results"] valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lng"] objectAtIndex:i] forKey:@"placeLng"];
        
        [tempDic setValue:[[[dictionary valueForKey:@"results"] valueForKey:@"name"] objectAtIndex:i] forKey:@"placeName"];

        [tabelarr addObject:[NSString stringWithFormat:@"%@",[tempDic valueForKey:@"placeName"]]];
        
        [tempDic setValue:[[[dictionary valueForKey:@"results"] valueForKey:@"vicinity"] objectAtIndex:i] forKey:@"placeVicinity"];

        [resultArray addObject:tempDic];
        
//        [tempDic release];
    }
//    [gluemecontacttbl reloadData];
    
    
    
    NSLog(@"%@",tabelarr);
if([tabelarr count]<1)
{

    UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"No data Found" message:@"No Cafe Available" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert1 show];
    [alert1 release];
    
}
else    {
    
    searcharr=[[NSMutableArray alloc] initWithArray:tabelarr];

    [tbl reloadData];
}
}

-(void)Back
{
    [self.navigationController popViewControllerAnimated:YES];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(void)SearchDatafatch:(NSDictionary*)dictionary
{
    
    
    [allPlacesArray removeAllObjects];
    
    NSLog(@"%@",dictionary);
    NSMutableDictionary *temp = [[dictionary valueForKey:@"responseData"] copy];
    NSLog(@"%d",[temp count]);
    NSMutableDictionary *resultDic = [[temp objectForKey:@"results"] copy];
    NSLog(@"%@",resultDic);
    NSLog(@"%@",[resultDic valueForKey:@"addressLines"]);
    NSMutableArray *finalSearchAry = [[resultDic valueForKey:@"addressLines"] copy];
    
//    NSLog(@"%@",[finalSearchAry objectAtIndex:0]);
//     NSLog(@"%@",[finalSearchAry objectAtIndex:1]);
//     NSLog(@"%@",[finalSearchAry objectAtIndex:2]);
//     NSLog(@"%@",[finalSearchAry objectAtIndex:3]);
    
    NSLog(@"%d",[finalSearchAry count]);
    
    for (int P = 0; P<[finalSearchAry count]; P++) {
        
        NSString *listItems = [[finalSearchAry objectAtIndex:P] objectAtIndex:0];
         NSString *listItems1 = [[finalSearchAry objectAtIndex:P] objectAtIndex:1];
        
        NSLog(@"%@",listItems);
        NSLog(@"%@",listItems1);
        
        NSMutableDictionary *placeDict = [[NSMutableDictionary alloc] init];
        
        int strCnt;
        strCnt = 0;
        
        NSString *PlaceS = @"";
        NSString *placeA = @"";
        NSString *addStr = @"";
        
    NSArray *SepStr = [listItems componentsSeparatedByString:@","];
    
        for (int k=0; k<[SepStr count]; k++) {
            
            if (strCnt<3) {
             NSString *str1  = [SepStr objectAtIndex:k];
            
            if ([addStr isEqualToString:@""]) {
                
                PlaceS = [addStr stringByAppendingFormat:@"%@",str1];
                addStr = [addStr stringByAppendingFormat:@"%@",str1];
                
                
                
              //  [allPlacesArray addObject:addStr];
                strCnt++;
            }
            else
            {
                if ([placeA isEqualToString:@""]) {
                placeA = [addStr stringByAppendingFormat:@"%@",str1];
                addStr = [addStr stringByAppendingFormat:@",%@",str1];
                strCnt++;
                }
                else
                {
                    placeA = [addStr stringByAppendingFormat:@",%@",str1];
                    addStr = [addStr stringByAppendingFormat:@",%@",str1];
                    strCnt++;

                }
            }
            }
        }
        
        NSArray *SepStr1 = [listItems1 componentsSeparatedByString:@","];
        
        if (strCnt<3) {
            for (int k=0; k<[SepStr1 count]; k++) {
                 if (strCnt<3) {
                NSString *str2  = [SepStr1 objectAtIndex:k];
               
                if ([addStr isEqualToString:@""]) {
                    PlaceS = [addStr stringByAppendingFormat:@"%@",str2];
                    addStr = [addStr stringByAppendingFormat:@"%@",str2];
                   
                    strCnt++;
                }
                else
                {
                    if ([placeA isEqualToString:@""]) {
                        placeA = [addStr stringByAppendingFormat:@"%@",str2];
                    addStr = [addStr stringByAppendingFormat:@",%@",str2];
                    strCnt++;
                    }
                    else
                    {
                        placeA = [addStr stringByAppendingFormat:@",%@",str2];
                        addStr = [addStr stringByAppendingFormat:@",%@",str2];
                        strCnt++;

                    }
                }
                }
            }

        }
        
        [placeDict setValue:PlaceS forKey:@"place"];
        [placeDict setValue:placeA forKey:@"Add"];
        
        [allPlacesArray addObject:placeDict];
        
//    [allPlacesArray addObject:addStr];
        
        [placeDict release];
        
    NSLog(@"%@",allPlacesArray);
    }
    NSLog(@"%@",allPlacesArray);
    [searchTbl reloadData];
}

-(void)searchwithKeyWord:(UISearchBar*)SearchB{
    
    
     if ([SearchB.text isEqualToString:@""]) {
         [searchTbl setHidden:YES];
         [tbl setHidden:NO];
         [tbl reloadData];
    }
   
    
	
//	if (SearchB == searchbar) {
//		
//		
//		[searcharr removeAllObjects];
//		NSDictionary *dic;
//		//NSString *dic;
//		for(dic in tabelarr)
//		{
//			NSString *st =	[dic copy];
//			
//			NSRange rang =[st rangeOfString:SearchB.text options:NSCaseInsensitiveSearch];
//			
//			if (rang.length == [SearchB.text length]) {
//				[searcharr addObject:dic];
//			}else {
//				[searcharr removeObject:dic];
//			}
//		}
//		[tbl reloadData];
//		
//    }
	
	
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

-(void)getAddress:(NSString *)Lat:(NSString*)Long
{
    
    /* NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@,%@&output=json&sensor=false",Lat,Long];
     
     NSLog(@"%@",urlString);
     
     NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
     
     JSONParser *parser;
     parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(AddressFatch:) andHandler:self];
     */
    
    NSLog(@"%@",Lat);
    NSLog(@"%@",Long);
    
    NSString *URL = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@,%@&output=csv&sensor=false",Lat,Long];
    NSLog(@"%@",URL);
    NSURLRequest *rq = [NSURLRequest requestWithURL:[NSURL URLWithString:URL]];
    conn1 = [[NSURLConnection alloc] initWithRequest:rq delegate:self];
    webData = [[NSMutableData data] retain];
    
    
    //  
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [webData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    //    [self hideHUD];
    //  [customealert showAlert:@"Error" message:@"Error while setting connection." delegate:self];
    NSLog(@"ERROR with theConenction");
    [connection release];
    [webData release];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    
    
    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(@"xml : %@",theXML);
    
    NSString *list = theXML;
    NSArray *listItems = [list componentsSeparatedByString:@","];
    
   
    NSString *str1  = [listItems objectAtIndex:5];
    
    city = str1;
    
    NSLog(@"%@",searchTblArray);
    
    NSLog(@"%@",searchText);
    NSLog(@"%@",city);
    NSString *urlString = [NSString stringWithFormat:@"https://ajax.googleapis.com/ajax/services/search/local?v=1.0&q=%@,%@&rsz=8&start=1",searchText,city];
    
   // NSString *urlString = [NSString stringWithFormat:@"http://ajax.googleapis.com/ajax/services/search/local?v=1.0&q=%@,%@",searchText,city];  
    // http://www.openxcellaus.info/glueme/search_user.php?username=r
    
    NSString *urlStr = [urlString stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    
    NSLog(@"%@",urlStr);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(SearchDatafatch:) andHandler:self];
    
    
//    Address = [NSString stringWithFormat:@"%@, %@.",str1,str2];
//    NSLog(@"%@",Address);
//    
//    
//    if (c>=latCnt) {
//        [AddArray addObject:Address];
//        [UserAddress addObject:Address];
//    }
//    else
//    {
//        [UserAddress addObject:Address];
//    }
//    c++;  
//    
//    if (c == [latArray count]) {
//        [self loadOurAnnotations];
//    }
    
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
	[searchBar setShowsCancelButton:NO animated:YES];
    
    [searchTbl setHidden:NO];
    [tbl setHidden:YES];
       
    NSLog(@"%@",searchBar.text);
    
    
        searchText = [[NSString stringWithFormat:@"%@",searchBar.text] copy];
        
        
    if (searchBar == searchbar) {
		
		
        tbl.hidden = YES;
        //   searchTbl.hidden = NO;
        if ([searchBar.text isEqualToString:@""]) {
            [searchTblArray removeAllObjects];
           // [searchTbl reloadData];
            [searchTbl setHidden:YES];
            [tbl setHidden:NO];
            [tbl reloadData];
            
            
        }
        else
        {
           
            [self getAddress:[NSString stringWithFormat:@"%f",currentLat] :[NSString stringWithFormat:@"%f",currentLon]];
        }
		
   
    }
    
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    if (tableView == tbl) {
        return [searcharr count];
    }
    else
    {
	   return [allPlacesArray count];
    }
    
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0,10,270, 57)];
    [cellImg setImage:[UIImage imageNamed:@"CellImg"]];
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        [cell.contentView addSubview:cellImg];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
	cell.textLabel.font = [UIFont fontWithName:@"arial" size:12];
    cell.detailTextLabel.font = [UIFont fontWithName:@"arial" size:10];
	//cell.textLabel.textColor=[UIColor whiteColor];
    if (tableView == tbl) {
       NSMutableDictionary *tempDic = [resultArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [searcharr objectAtIndex:indexPath.row];
    //cell.textLabel.text = [NSString stringWithFormat:@"%@",[tempDic valueForKey:@"placeName"]];
    cell.detailTextLabel.text= [NSString stringWithFormat:@"%@",[tempDic valueForKey:@"placeVicinity"]];
    }
    else
    {
        
        NSMutableDictionary *tempDic1 = [allPlacesArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [tempDic1 valueForKey:@"place"];
        //cell.textLabel.text = [NSString stringWithFormat:@"%@",[tempDic valueForKey:@"placeName"]];
        cell.detailTextLabel.text= [tempDic1 valueForKey:@"Add"];

        
//         cell.textLabel.text = [allPlacesArray objectAtIndex:indexPath.row];
//        cell.detailTextLabel.text= [NSString stringWithFormat:@"%@",[tempDic valueForKey:@"placeVicinity"]];

    }
//	cell.textLabel.text = [searcharr objectAtIndex:indexPath.row];
//	cell.detailTextLabel.text= [DetailArray objectAtIndex:indexPath.row];
	//cell.detailTextLabel.textColor = [UIColor whiteColor];
	//cell.contentView.backgroundColor=[UIColor clearColor];
	cell.textLabel.backgroundColor=[UIColor clearColor];
	cell.detailTextLabel.backgroundColor=[UIColor clearColor];
    
//    UIImageView *cellImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    [cellImg1 setImage:[UIImage imageNamed:@"contactCellImg.png"]];
//    cell.backgroundView = cellImg1;
//    
//    cell.textLabel.textColor = [UIColor blackColor];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    if (tableView == tbl) {
    meetingpointdetail *obj = [[meetingpointdetail alloc]init];
    
    NSMutableDictionary *tempDic = [resultArray objectAtIndex:indexPath.row];
    
    appDelegateObj.placeString = [NSString stringWithFormat:@"%@",[tempDic valueForKey:@"placeName"]];
    
	[self.navigationController pushViewController:obj animated:YES];
    }
    else
    {
        meetingpointdetail *obj = [[meetingpointdetail alloc]init];
        
        NSMutableDictionary *tempDic = [allPlacesArray objectAtIndex:indexPath.row];
        
        appDelegateObj.placeString = [NSString stringWithFormat:@"%@",[tempDic valueForKey:@"place"]];
        
        [self.navigationController pushViewController:obj animated:YES];
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
     [locationManager release];
}


@end
