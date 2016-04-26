//
//  MineRequest.m
//  glueme
//
//  Created by APPLE  on 9/20/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import "MineRequest.h"
#import "MyRequestCell.h"
#import "whogluedmap.h"
#import "FAQHelp.h"
#import "MyrequestcellTheirs.h"
#import "AlertHandler.h"

@implementation MineRequest
@synthesize RequestTbl,requestSegment,statusArray,nameArray,TheirNameArray,TheirStatusArray,ind,DateArray,TimeArray,TheirDateArray,TheirTimeArray,lNameArray,TheirlNameArray,frndReqArray,GMReqArray,Accepted,Blocked;

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
    
    
	//whoGlueVwObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
    appDelegateObj.count = 0;
    [self.navigationController pushViewController:mymapObj animated:NO];
	//whogluedmap		*gluemap=[[whogluedmap alloc]initWithNibName:@"whogluedmap" bundle:nil];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (requestSegment.selectedSegmentIndex == 0) {
        return [nameArray count];
    }
    else
    {
        return [TheirNameArray count];
    }
    return 0;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
//    }
    
        
    if (requestSegment.selectedSegmentIndex == 0) {
        
        static NSString *CellIdentifier = @"MyRequestCell";
        
        MyRequestCell *cell = (MyRequestCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {			
            NSArray *nib = nil;		
            nib = [[NSBundle mainBundle] loadNibNamed:@"MyRequestCell" owner:nil options:nil];
            cell = [nib objectAtIndex:0];	
            [cell setParentObj:self];
            
            //[cell setParentObject:self];
        }	

        
        
          cell.statusLbl.text = [statusArray objectAtIndex:indexPath.row];
        cell.NameLbl.text = [NSString stringWithFormat:@"%@ %@",[nameArray objectAtIndex:indexPath.row],[lNameArray objectAtIndex:indexPath.row]];
       cell.dateLbl.text = [DateArray objectAtIndex:indexPath.row];
        cell.timeLbl.text = [TimeArray objectAtIndex:indexPath.row];
        cell.timeLbl.textColor = [UIColor blackColor];
        cell.dateLbl.textColor = [UIColor blackColor];
        cell.NameLbl.textColor = [UIColor blackColor];
        cell.statusLbl.textColor = [UIColor blackColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        ind = indexPath.row;
        
        if ([cell.statusLbl.text isEqualToString:@"Blocked"]) {
            UIButton *dltBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [dltBtn setTitle:@"Ignore" forState:UIControlStateNormal];
            dltBtn.frame = CGRectMake(262, 15, 18, 18);
            [dltBtn setImage:[UIImage imageNamed:@"delete.png"] forState:UIControlStateNormal];
            [dltBtn addTarget:self action:@selector(deleteCell) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:dltBtn];
        }
        
        UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        [cellImg setImage:[UIImage imageNamed:@"contactCellImg.png"]];
        cell.backgroundView = cellImg;
        
      //  cell.textLabel.textColor = [UIColor blackColor];
        
        return cell;
    }
    else
    {
        
        static NSString *CellIdentifier = @"MyrequestcellTheirs";
        
        MyrequestcellTheirs *cell = (MyrequestcellTheirs *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {			
            NSArray *nib = nil;		
            nib = [[NSBundle mainBundle] loadNibNamed:@"MyrequestcellTheirs" owner:nil options:nil];
            cell = [nib objectAtIndex:0];	
            [cell setParentObj:self];
            
            //[cell setParentObject:self];
        }	

        
        
        cell.frame = CGRectMake(0, 0, 280, 87);
        cell.statusLbl.text = [ReqArray objectAtIndex:indexPath.row];
        cell.NameLbl.text = [NSString stringWithFormat:@"%@ %@",[TheirNameArray objectAtIndex:indexPath.row],[TheirlNameArray objectAtIndex:indexPath.row]];
        cell.dateLbl.text = [TheirDateArray objectAtIndex:indexPath.row];
        cell.timeLbl.text = [TheirTimeArray objectAtIndex:indexPath.row];
//        if ([cell.statusLbl.text isEqualToString:@"GlueMe for 2 hours"]) {
//           
//            IgnoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//            [IgnoreBtn setTitle:@"Ignore" forState:UIControlStateNormal];
//            IgnoreBtn.frame = CGRectMake(204, 54, 72, 25);
//            [IgnoreBtn setImage:[UIImage imageNamed:@"Ignore.png"] forState:UIControlStateNormal];
//            [IgnoreBtn addTarget:self action:@selector(ClickOnReject) forControlEvents:UIControlEventTouchUpInside];
//           
//          AcceptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//            [AcceptBtn setTitle:@"Accept" forState:UIControlStateNormal];
//            AcceptBtn.frame = CGRectMake(133, 55, 67, 24);
//            [AcceptBtn setImage:[UIImage imageNamed:@"Accept.png"] forState:UIControlStateNormal];
//            [AcceptBtn addTarget:self action:@selector(ClickOnAccept) forControlEvents:UIControlEventTouchUpInside];
//            
//            [cell.contentView addSubview:IgnoreBtn];
//            [cell.contentView addSubview:AcceptBtn];
//        }
       // else
        //{
          BlockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            BlockBtn.tag=indexPath.row;
            
            [BlockBtn setTitle:@"Block" forState:UIControlStateNormal];
            BlockBtn.frame = CGRectMake(204, 54, 72, 25);
            [BlockBtn setImage:[UIImage imageNamed:@"Block.png"] forState:UIControlStateNormal];
            [BlockBtn addTarget:self action:@selector(ClickOnBlock:) forControlEvents:UIControlEventTouchUpInside];

           IgnoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [IgnoreBtn setTitle:@"Ignore" forState:UIControlStateNormal];
            IgnoreBtn.frame = CGRectMake(133, 55, 67, 24);
            [IgnoreBtn setImage:[UIImage imageNamed:@"Ignore.png"] forState:UIControlStateNormal];
            [IgnoreBtn addTarget:self action:@selector(ClickOnReject:) forControlEvents:UIControlEventTouchUpInside];
            IgnoreBtn.tag=indexPath.row;
            
           AcceptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [AcceptBtn setTitle:@"Accept" forState:UIControlStateNormal];
            AcceptBtn.frame = CGRectMake(60, 55, 67, 24);
            [AcceptBtn setImage:[UIImage imageNamed:@"Accept.png"] forState:UIControlStateNormal];
        //if ([cell.statusLbl.text isEqualToString:@"Friend Request"]) {
            [AcceptBtn addTarget:self action:@selector(ClickOnAccept:) forControlEvents:UIControlEventTouchUpInside];
//        }
//        else
//        {
//            http://www.openxcellaus.info/glueme/accept_reject_glueme_req.php?user_id=10&frnd_id=11&accepted=1
//        }
            
            AcceptBtn.tag=indexPath.row;
            
            [cell.contentView addSubview:IgnoreBtn];
            [cell.contentView addSubview:AcceptBtn];
            [cell.contentView addSubview:BlockBtn];
       // }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 87)];
        [cellImg setImage:[UIImage imageNamed:@"contactCellImg.png"]];
        cell.backgroundView = cellImg;
        cell.timeLbl.textColor = [UIColor blackColor];
        cell.dateLbl.textColor = [UIColor blackColor];
        cell.NameLbl.textColor = [UIColor blackColor];
        cell.statusLbl.textColor = [UIColor blackColor];
        
        //cell.textLabel.textColor = [UIColor blackColor];
        
        return cell;

    }
}

-(void)deleteCell
{
    [nameArray removeObjectAtIndex:ind];
    [RequestTbl reloadData];
}

-(void)ClickOnBlock:(id)sender;
{
   UIButton *btn=(UIButton *)sender;
    
    int i=btn.tag;
    NSString *udid;
    udid=[arrtheirid objectAtIndex:i];
    
    
    NSString *LoginID;
	
	LoginID = [[NSUserDefaults standardUserDefaults] valueForKey:@"Login"];
    
	// [self.navigationController popToRootViewControllerAnimated:YES];
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/accept_reject.php?user_id=%i&frnd_id=%i&accepted=0&blocked=1",LoginID,udid];
    
    
    
    
    
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];

}

-(void)ClickOnAccept:(id)sender;
{UIButton *btn=(UIButton *)sender;
    
    int i=btn.tag;
    NSString *udid;
    udid=[arrtheirid objectAtIndex:i];
    NSString *s_val =[ReqArray objectAtIndex:i];
    
    NSString *LoginID;
	
	LoginID = [[NSUserDefaults standardUserDefaults] valueForKey:@"Login"];
    NSString *urlString;
	// [self.navigationController popToRootViewControllerAnimated:YES];
    if ([s_val isEqualToString:@"Friend Request"]) {
        urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/accept_reject.php?user_id=%@&frnd_id=%i&accepted=1&blocked=0",udid,appDelegateObj.userID];
    }
    else
    {
       urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/accept_reject_glueme_req.php?user_id=%@&frnd_id=%i&accepted=1",udid,appDelegateObj.userID];
     //http://www.openxcellaus.info/glueme/accept_reject_glueme_req.php?user_id=10&frnd_id=11&accepted=1
    }
    [AlertHandler showAlertForProcess];
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];
}

-(void)datafatch:(NSDictionary*)dictionary{
    
    [AlertHandler hideAlert];
    
    NSString *error;
    
    error = [[NSString alloc] initWithFormat:@"%@",[dictionary valueForKey:@"msg"]];
    NSLog(@"%@",error);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:error delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    
  //  [self GetMyFriendRequestList];
    [self GetSentFriendRequestList];
    
}

-(void)ClickOnReject:(id)sender;
{
    UIButton *btn=(UIButton *)sender;
    
    int i=btn.tag;
    NSString *udid;
    udid=[arrtheirid objectAtIndex:i];
    NSString *s_val =[ReqArray objectAtIndex:i];
    
    NSString *LoginID;
    NSString *urlString;
	LoginID = [[NSUserDefaults standardUserDefaults] valueForKey:@"Login"];
    if ([s_val isEqualToString:@"Friend Request"]) {
        urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/accept_reject.php?user_id=%@&frnd_id=%i&accepted=-1&blocked=0",udid,appDelegateObj.userID];

    }
    else
    {
        urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/accept_reject_glueme_req.php?user_id=%@&frnd_id=%i&accepted=-1",udid,appDelegateObj.userID];
        //http://www.openxcellaus.info/glueme/accept_reject_glueme_req.php?user_id=10&frnd_id=11&accepted=1
    }

	// [self.navigationController popToRootViewControllerAnimated:YES];
        
    
    
    
    
    
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self];

    
    //    acceptrequestObj = [[AcceptRequest alloc] initWithNibName:@"AcceptRequest" bundle:nil];
    //    [parentObj.navigationController pushViewController:acceptrequestObj animated:YES];
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (requestSegment.selectedSegmentIndex == 0) {
        return 50;
    }
    else
    {
        return 87;
    }
}

- (IBAction) EditTable:(id)sender{
	if(self.editing){
		[super setEditing:NO animated:NO]; 
		[RequestTbl setEditing:NO animated:NO];
        //        if (didDelete) {
        //            GoalDetails = [obj getCurrentGoalDetail : [catList objectAtIndex:catId]];
        //            arryData = GoalDetails;
        //            //cnt = [arryData count];
        //        }
        //
        //        if (didDelete) {
        //            arryData = tempData;
        //        }
		[RequestTbl reloadData];
        
        [self.navigationItem.rightBarButtonItem setTitle:@"Edit"];
		[self.navigationItem.rightBarButtonItem setStyle:UIBarButtonItemStylePlain];
	}
	else{
		[super setEditing:YES animated:YES]; 
		[RequestTbl setEditing:YES animated:YES];
		[RequestTbl reloadData];
		[self.navigationItem.rightBarButtonItem setTitle:@"Done"];
		[self.navigationItem.rightBarButtonItem setStyle:UIBarButtonItemStyleDone];
	}
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    // No editing style if not editing or the index path is nil.
    //if (self.editing == NO || !indexPath) return UITableViewCellEditingStyleNone;
    //    // Determine the editing style based on whether the cell is a placeholder for adding content or already 
    //    // existing content. Existing content can be deleted.    
    //    if (self.editing && indexPath.row == ([arryData count])) {
    //		return UITableViewCellEditingStyleInsert;
    //	} else {
    //		return UITableViewCellEditingStyleDelete;
    //	}
    //    return UITableViewCellEditingStyleNone;
    /*if (didDelete) {
     arryData = tempData;
     }*/
    
	return UITableViewCellEditingStyleDelete;
    
}

// Update the data model according to edit actions delete or insert.
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath {
	
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
              
        if (requestSegment.selectedSegmentIndex == 0) {
            [nameArray removeObjectAtIndex:indexPath.row];
        }
       else
       {
           [TheirNameArray removeObjectAtIndex:indexPath.row];
       }
       
        [RequestTbl reloadData];
       
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
		[RequestTbl reloadData];
    }

}


- (void)dealloc
{
    [DateArray release];
    [TimeArray release];
    [TheirDateArray release];
    [TheirTimeArray release];
    [TheirStatusArray release];
    [TheirNameArray release];
    [nameArray release];
    [statusArray release];
    [requestSegment release];
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
    self.navigationController.navigationBar.alpha = 0.0;
    arrtheirid = [[NSMutableArray alloc] init];
    nameArrayid = [[NSMutableArray alloc] init];
    lNameArray = [[NSMutableArray alloc] init];
    TheirlNameArray = [[NSMutableArray alloc] init];
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
    
	DateArray = [[NSMutableArray alloc]init];
    TimeArray = [[NSMutableArray alloc]init];
    TheirDateArray = [[NSMutableArray alloc]init];
    TheirTimeArray = [[NSMutableArray alloc]init];
    statusArray = [[NSMutableArray alloc] init];
    nameArray = [[NSMutableArray alloc] init];
    TheirNameArray = [[NSMutableArray alloc] init];
    TheirStatusArray = [[NSMutableArray alloc] init];
//    [TheirStatusArray addObject:@"Friend Request"];
//    [TheirStatusArray addObject:@"GlueMe for 2 hours"];
      
    
   // [statusArray addObject:@"Pending"];
   // [statusArray addObject:@"Blocked"];
       appDelegateObj = (gluemeAppDelegate*)[[UIApplication sharedApplication]delegate];
    
    ReqArray = [[NSMutableArray alloc] init];
    
    
    [self GetMyFriendRequestList];
    
    [super viewDidLoad];
   }





-(void)GetMyFriendRequestList{
    
    [AlertHandler showAlertForProcess];
    
    NSString *loginid=[[NSUserDefaults standardUserDefaults]valueForKey:@"Login"];
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/pending_friend_req_list.php?user_id=%@",loginid];
  //  http://www.openxcellaus.info/glueme/pending_friend_req_list.php?user_id=8
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch1:) andHandler:self];
    
    
}



-(void)GetSentFriendRequestList{

    [AlertHandler showAlertForProcess];

    NSString *loginid=[[NSUserDefaults standardUserDefaults]valueForKey:@"Login"];
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/pending_friend_req_list.php?frnd_id=%i",appDelegateObj.userID];
    
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch3:) andHandler:self];
    


}







-(void)datafatch1:(NSDictionary*)dictionary{
       
    [AlertHandler hideAlert];
    
    NSLog(@"%@",dictionary);
    
    [nameArrayid removeAllObjects];
    [nameArray removeAllObjects];
    [lNameArray removeAllObjects];
    [DateArray removeAllObjects];
    [TimeArray removeAllObjects];
    NSLog(@"%@",[dictionary valueForKey:@"pending_friend_list"]);
    for (int i=0; i<[[dictionary valueForKey:@"pending_friend_list"]count]; i++) 
    {
        
         NSLog(@"%@",[[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"firstname"] objectAtIndex:i]);
        
        [nameArray addObject:[[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"firstname"] objectAtIndex:i]];
        NSLog(@"%@",[[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"lastname"] objectAtIndex:i]);
        [lNameArray addObject:[[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"lastname"] objectAtIndex:i]];
         NSLog(@"%@",[[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"uid"] objectAtIndex:i]);
        [nameArrayid addObject:[[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"uid"] objectAtIndex:i]];
       
        NSLog(@"%@",[[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"current_date_time"] objectAtIndex:i]);
          NSString *dtStr = [[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"current_date_time"] objectAtIndex:i];
      
        NSString *list = dtStr;
        NSArray *listItems = [list componentsSeparatedByString:@" "];
        
        [DateArray addObject:[listItems objectAtIndex:0]];
        [TimeArray addObject:[listItems objectAtIndex:1]];
        
        
//        NSDateFormatter* df = [[NSDateFormatter alloc] init];
//        [df setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//        NSDate* d = [df dateFromString:dtStr];
//        NSLog(@"%@", d); 
//        
//        NSDate *date = d;
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        [formatter setDateFormat:@"dd-MM-yyyy"];
//        [DateArray addObject:[formatter stringFromDate:date]];
//        NSLog(@"%@",DateArray);
//        
//        NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
//        [formatter1 setDateFormat:@"HH:MM:SS"];
//        NSString *TimeStr = [[formatter1 stringFromDate:date] copy];
//        NSLog(@"%@",TimeStr);
//        [TimeArray addObject:[NSString stringWithFormat:@"%@",TimeStr]]; 
//        NSLog(@"%@",TimeArray);
        
        Accepted = [[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"accepted"] objectAtIndex:i];
               
        Blocked = [[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"accepted"] objectAtIndex:i];
        
        if ([Accepted isEqualToString:@"0"] && [Blocked isEqualToString:@"0"]) {
            [statusArray addObject:@"Friend Request Pending"];
        }
        else if([Accepted isEqualToString:@"0"] && [Blocked isEqualToString:@"1"])
        {
            [statusArray addObject:@"Friend Request Blocked"];
        }
        
    }
    
    for (int i=0; i<[[dictionary valueForKey:@"GlueMe_pending_friend_list"]count]; i++) 
    {
        
        
        
        [nameArray addObject:[[[dictionary valueForKey:@"GlueMe_pending_friend_list"] valueForKey:@"firstname"] objectAtIndex:i]];
        [lNameArray addObject:[[[dictionary valueForKey:@"GlueMe_pending_friend_list"] valueForKey:@"lastname"] objectAtIndex:i]];
        [nameArrayid addObject:[[[dictionary valueForKey:@"GlueMe_pending_friend_list"] valueForKey:@"uid"] objectAtIndex:i]];
       
        NSString *dtStr = [[[dictionary valueForKey:@"GlueMe_pending_friend_list"] valueForKey:@"current_date_time"] objectAtIndex:i];
        
        NSString *list = dtStr;
        NSArray *listItems = [list componentsSeparatedByString:@" "];
        
        [DateArray addObject:[listItems objectAtIndex:0]];
        [TimeArray addObject:[listItems objectAtIndex:1]];

        
//        NSDateFormatter* df = [[NSDateFormatter alloc] init];
//        [df setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//        NSDate* d = [df dateFromString:dtStr];
//        NSLog(@"%@", d); 
//        
//        NSDate *date = d;
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        [formatter setDateFormat:@"dd-MM-yyyy"];
//        [DateArray addObject:[formatter stringFromDate:date]];
//        NSLog(@"%@",DateArray);
//        
//        NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
//        [formatter1 setDateFormat:@"HH:MM:SS"];
//        NSString *TimeStr = [[formatter1 stringFromDate:date] copy];
//        NSLog(@"%@",TimeStr);
//        [TimeArray addObject:[NSString stringWithFormat:@"%@",TimeStr]]; 
//        NSLog(@"%@",TimeArray);
       
        Accepted = [[[dictionary valueForKey:@"GlueMe_pending_friend_list"] valueForKey:@"accepted"] objectAtIndex:i];
        
        Blocked = [[[dictionary valueForKey:@"GlueMe_pending_friend_list"] valueForKey:@"accepted"] objectAtIndex:i];
        
        if ([Accepted isEqualToString:@"0"] && [Blocked isEqualToString:@"0"]) {
            [statusArray addObject:@"GlueMe Request Pending"];
        }
        else if([Accepted isEqualToString:@"0"] && [Blocked isEqualToString:@"1"])
        {
            [statusArray addObject:@"GlueMe Request Blocked"];
        }

        
       
        
        
    }

    
    [RequestTbl reloadData];
	    
    
   // [self GetSentFriendRequestList];
    
    
  }







-(void)datafatch3:(NSDictionary*)dictionary{
       
    [AlertHandler hideAlert];
    
    [arrtheirid removeAllObjects];
    [TheirNameArray removeAllObjects];
    [TheirlNameArray removeAllObjects];
    [TheirTimeArray removeAllObjects];
    [TheirDateArray removeAllObjects];
    [ReqArray removeAllObjects];
    for (int i=0; i<[[dictionary valueForKey:@"pending_friend_list"]count]; i++) 
    {
        
        [TheirNameArray addObject:[[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"firstname"] objectAtIndex:i]];
        
        [TheirlNameArray addObject:[[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"lastname"] objectAtIndex:i]];
        
        [arrtheirid addObject:[[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"uid"] objectAtIndex:i]];
        [ReqArray addObject:@"Friend Request"];

        NSLog(@"%@",[[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"current_date_time"] objectAtIndex:i]);
        NSString *dtStr = [[[dictionary valueForKey:@"pending_friend_list"] valueForKey:@"current_date_time"] objectAtIndex:i];

        
//        NSDateFormatter* df = [[NSDateFormatter alloc] init];
//        [df setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//        NSDate* d = [df dateFromString:dtStr];
//        NSLog(@"%@", d); 
        
        NSString *list = dtStr;
        NSArray *listItems = [list componentsSeparatedByString:@" "];
        
        [TheirDateArray addObject:[listItems objectAtIndex:0]];
        [TheirTimeArray addObject:[listItems objectAtIndex:1]];
        
//        NSDate *date = d;
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        [formatter setDateFormat:@"dd-MM-yyyy"];
//        [TheirDateArray addObject:[formatter stringFromDate:date]];
//        
//        NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
//        [formatter1 setDateFormat:@"HH:MM:SS"];
//        NSString *TimeStr = [[formatter1 stringFromDate:date] copy];
//        NSLog(@"%@",TimeStr);
//        [TheirTimeArray addObject:[NSString stringWithFormat:@"%@",TimeStr]]; 
//        NSLog(@"%@",TheirTimeArray);
        
    }
    
    
    

        for (int i=0; i<[[dictionary valueForKey:@"GlueMe_pending_friend_list"]count]; i++) 
        {
            
            [TheirNameArray addObject:[[[dictionary valueForKey:@"GlueMe_pending_friend_list"] valueForKey:@"firstname"] objectAtIndex:i]];
            
            [TheirlNameArray addObject:[[[dictionary valueForKey:@"GlueMe_pending_friend_list"] valueForKey:@"lastname"] objectAtIndex:i]];

            
            [arrtheirid addObject:[[[dictionary valueForKey:@"GlueMe_pending_friend_list"] valueForKey:@"uid"] objectAtIndex:i]];
             [ReqArray addObject:[NSString stringWithFormat:@"Glue Me for %@ hours",[[[dictionary valueForKey:@"GlueMe_pending_friend_list"] valueForKey:@"glueme_time"] objectAtIndex:i]]];
            
            NSLog(@"%@",[[[dictionary valueForKey:@"GlueMe_pending_friend_list"] valueForKey:@"current_date_time"] objectAtIndex:i]);
            NSString *dtStr = [[[dictionary valueForKey:@"GlueMe_pending_friend_list"] valueForKey:@"current_date_time"] objectAtIndex:i];
            
            
            NSString *list = dtStr;
            NSArray *listItems = [list componentsSeparatedByString:@" "];
            
            [TheirDateArray addObject:[listItems objectAtIndex:0]];
            [TheirTimeArray addObject:[listItems objectAtIndex:1]];
            
//            NSDateFormatter* df = [[NSDateFormatter alloc] init];
//            [df setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//            NSDate* d = [df dateFromString:dtStr];
//            NSLog(@"%@", d); 
//            
//            NSDate *date = d;
//            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//            [formatter setDateFormat:@"dd-MM-yyyy"];
//            [TheirDateArray addObject:[formatter stringFromDate:date]];
//            
//            NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
//            [formatter1 setDateFormat:@"HH:MM:SS"];
//            NSString *TimeStr = [[formatter1 stringFromDate:date] copy];
//            NSLog(@"%@",TimeStr);
//            [TheirTimeArray addObject:[NSString stringWithFormat:@"%@",TimeStr]]; 
//            NSLog(@"%@",TheirTimeArray);
        }

    
    [RequestTbl reloadData];
	[self getReqCount];


}
-(void)getReqCount{
	NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/pending_friend_req_list_count.php?frnd_id=%d",appDelegateObj.userID];
	
	NSLog(@"%@",urlString);
	
	NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
	
	JSONParser *parser;
	parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatchcount:) andHandler:self];
	
	
	
	
}

-(void)datafatchcount:(NSDictionary*)dictionary{
	NSString *str_p =[dictionary  valueForKey:@"count"];
	int val =[str_p intValue];
	if(val==0)
	{
		[[[[[self tabBarController] tabBar] items] objectAtIndex:1] setBadgeValue:nil];	
		[UIApplication sharedApplication].applicationIconBadgeNumber = val ;
		BadgeImgView.hidden =TRUE;
		BadgeLbl.hidden =TRUE;
		
	}
	else {
		[[[[[self tabBarController] tabBar] items] objectAtIndex:1] setBadgeValue:[NSString stringWithFormat:@"%d",val]];	
		[UIApplication sharedApplication].applicationIconBadgeNumber = val ;
		BadgeImgView.hidden =FALSE;
		
		BadgeLbl.hidden =FALSE;
		BadgeLbl.text=[NSString stringWithFormat:@"%d",val];// str_p;

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


-(IBAction)SegmentChanged
{
    
   
   
    
//    NSIndexPath *ind = [NSIndexPath indexPathForRow:i inSection:0]; 
//    MyRequestCell *cell = (MyRequestCell *)[RequestTbl cellForRowAtIndexPath:ind];
//    
        if (requestSegment.selectedSegmentIndex == 1) {
            [self GetSentFriendRequestList];
            self.navigationItem.rightBarButtonItem=nil;
            [requestSegment setImage:[UIImage imageNamed:@"MineSe.png"]forSegmentAtIndex:0];
            [requestSegment setImage:[UIImage imageNamed:@"TheirsSel.png"]forSegmentAtIndex:1];
            
//            if ([nameArray count]<5) 
//            {
//                RequestTbl.frame=CGRectMake(20, 142, 280, [nameArray count]*87);
//            }

            
        }
        else{
            
             [self GetMyFriendRequestList];
            UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:self action:@selector(EditTable:)];
            [self.navigationItem setRightBarButtonItem:addButton];

            [requestSegment setImage:[UIImage imageNamed:@"MineSeg.png"]forSegmentAtIndex:0];
            [requestSegment setImage:[UIImage imageNamed:@"Theirs.png"]forSegmentAtIndex:1];
            
//            if ([nameArray count]<5) 
//            {
//                RequestTbl.frame=CGRectMake(20, 142, 280, [nameArray count]*50);
//            }
//
        }
        
           
}

-(void)viewWillAppear:(BOOL)animated
{
    if (appDelegateObj.isthemechanged) {
//        self.navigationController.navigationBar.alpha = 0.0;
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
    
	[self getReqCount];
    [requestSegment setImage:[UIImage imageNamed:@"MineSeg.png"]forSegmentAtIndex:0];
    [requestSegment setImage:[UIImage imageNamed:@"Theirs.png"]forSegmentAtIndex:1];
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
