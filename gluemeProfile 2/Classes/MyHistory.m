//
//  MyHistory.m
//  glueme
//
//  Created by APPLE  on 9/21/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import "MyHistory.h"
#import "whogluedmap.h"
#import "FAQHelp.h"
#import "AlertHandler.h"

@implementation MyHistory
@synthesize HistoryListTbl,historyList,FetchedDic,fetchedArray,HistUid,lastGluedTime,
lastGluedOn;



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
    [historyList release];
    [HistoryListTbl release];
    [super dealloc];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [HistNmae count];
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
    
  //  NSLog(@"%@",historyList);
    cell.textLabel.text = [HistNmae objectAtIndex:indexPath.row];
//    [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    
//    UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    [cellImg setImage:[UIImage imageNamed:@"contactCellImg.png"]];
//    cell.backgroundView = cellImg;
    
    cell.textLabel.textColor = [UIColor blackColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"%@",historyList);
//    NSMutableDictionary *tempDic = [[NSMutableDictionary alloc]init];
//    tempDic = [historyList objectAtIndex:indexPath.row];
//    
//    NSLog(@"%@",tempDic);
    appDelegateObj.HistoryId = [[HistUid objectAtIndex:indexPath.row] intValue];
   // appDelegateObj.HistoryId = [[tempDic objectForKey:@"frnd_id"] intValue]; 
    appDelegateObj.histName = [HistNmae objectAtIndex:indexPath.row];
    appDelegateObj.histLastGlOn = [lastGluedOn objectAtIndex:indexPath.row];
    appDelegateObj.histLastGLTime = [lastGluedTime objectAtIndex:indexPath.row];
    NSLog(@"%i",appDelegateObj.HistoryId);
    
    detailVwHistryObj = [[DetailViewHistory alloc] initWithNibName:@"DetailViewHistory" bundle:nil];
    [self.navigationController pushViewController:detailVwHistryObj animated:YES];
}


-(void)GlueHistoryList
{
    [AlertHandler showAlertForProcess];
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/glueMe_history_list.php?user_id=%i",appDelegateObj.userID];  
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(Histdatafatch:) andHandler:self];
    
}

-(void)Histdatafatch:(NSDictionary*)dictionary
{
//    [historyList removeAllObjects];
    [HistNmae removeAllObjects];
    [HistUid removeAllObjects];
    [lastGluedTime removeAllObjects];
    [lastGluedOn removeAllObjects];
    
    [AlertHandler hideAlert];
    
    NSLog(@"%@",dictionary);
    
    historyList = [[[dictionary valueForKey:@"glueMe_history_list"] copy]retain];
    
    NSLog(@"%@",historyList);
//    
    for (int i=0; i<[historyList count]; i++) {
        FetchedDic = [[NSMutableDictionary alloc] init];

        FetchedDic = [historyList objectAtIndex:i];
        NSLog(@"%@",FetchedDic);
        
        [HistUid addObject:[[FetchedDic objectForKey:@"user_id"]copy]];
        [HistNmae addObject:[[FetchedDic objectForKey:@"firstname"]copy]];
        [lastGluedTime addObject:[[FetchedDic objectForKey:@"glueme_time"]copy]];
        [lastGluedOn  addObject:[[FetchedDic objectForKey:@"current_date_time"]copy]];
        
        NSLog(@"%@",HistNmae);
        [FetchedDic release];

    }
    
    [HistoryListTbl reloadData];
//  NSString *msg = [dictionary objectForKey:@"glueMe_history_list"];
    
    
    
   // uidArray = [dictionary objectForKey:@"uid"];
    
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
//       [alert release];
    
}


-(IBAction)onMap:(id)sender{
	
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
   
    
	//whoGlueObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
    appDelegateObj.count = 0;
     [self.navigationController pushViewController:mymapObj animated:NO];
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
    
    [self.view addSubview:backBtn]; 
    
    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    BumpBtn.frame = CGRectMake(268,10, 35, 34);
    
    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:BumpBtn]; 

    
    
    lastGluedTime = [[NSMutableArray alloc] init];
    lastGluedOn=[[NSMutableArray alloc] init];
    
    appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication] delegate];
    
        HistUid = [[NSMutableArray alloc] init];
    HistNmae = [[NSMutableArray alloc] init];
       fetchedArray = [[NSMutableArray alloc] init];
    historyList = [[NSMutableArray alloc] init];
//    [historyList addObject:@"john carter"];
//    [historyList addObject:@"Bill Harper"];
//    [historyList addObject:@"Terra Nelson"];
//    [historyList addObject:@"Mike Mosby"];
//    [historyList addObject:@"Chris Jericho"];
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
//    [self.view addSubview:backBtn]; 
//    
//    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    BumpBtn.frame = CGRectMake(268,10, 35, 34);
//    
//    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:BumpBtn]; 

    }
    
    [self GlueHistoryList];
    
    [HistoryListTbl setRowHeight:70.0];
//    if (appDelegateObj.isdeleteHistory) {
//        [historyList removeObjectAtIndex:[historyList count]-1];
//        [HistoryListTbl reloadData];
//        appDelegateObj.isdeleteHistory = FALSE;
//    }
    
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
