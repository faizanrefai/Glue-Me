//
//  Themes.m
//  glueme
//
//  Created by apple1 on 9/21/11.
//  Copyright 2011 openxcek. All rights reserved.
//

#import "Themes.h"
#import "FAQHelp.h"
#import "whogluedmap.h"

@implementation Themes
//@synthesize ObjLogin;

#pragma mark -
#pragma mark View lifecycle


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

        
	arrThemes=[[NSMutableArray alloc]initWithObjects:@"Fire and Ice",@"Fall",@"Basic",@"Purple",@"Default",nil];

    appDelegateObj = (gluemeAppDelegate*)[[UIApplication sharedApplication]delegate];
   // ObjLogin = appDelegateObj.objLogin;
    [tblThemes setRowHeight:60.0];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

-(IBAction)onMap:(id)sender{
	
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
   
    
//	 whoGlueVwObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
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


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [arrThemes count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0,10,270, 57)];
    [cellImg setImage:[UIImage imageNamed:@"CellImg"]];
       
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        [cell.contentView addSubview:cellImg];

    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
	cell.text = [arrThemes	objectAtIndex:indexPath.row];
	cell.textLabel.textColor = [UIColor blackColor];
	cell.accessoryType = UITableViewCellAccessoryNone;
    // Configure the cell...
    
//    UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    [cellImg setImage:[UIImage imageNamed:@"contactCellImg.png"]];
//    cell.backgroundView = cellImg;
    
    return cell;
}

-(IBAction)onFAQ:(id)sender
{
	FAQHelp *faqhelp=[[FAQHelp alloc]initWithNibName:@"FAQHelp" bundle:nil];
	[self.navigationController pushViewController:faqhelp animated:YES];
	[faqhelp release];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
    
    if (indexPath.row == 0) {
        [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"Fire and Ice"];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Fall"];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Basic"];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Purple"];
         [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Default"];
        [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"OrangeBkGround.png"]];
         [topbarImg setImage:[UIImage imageNamed:@"OrangeTopBar.png"]];
        appDelegateObj.isthemechanged = TRUE;
    }
    if (indexPath.row == 1) {
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Fire and Ice"];
        [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"Fall"];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Basic"];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Purple"];
         [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Default"];
        [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"GreyBkGround.png"]];
                appDelegateObj.isthemechanged = TRUE;
//        CGRect frame = CGRectMake(-2, 0, 480, 180);
//		UIView *v = [[UIView alloc] initWithFrame:frame];
//        
//        appDelegateObj.objLogin.i = [UIImage imageNamed:@"greyBottomBar.png"];
//        UIColor *c = [[UIColor alloc] initWithPatternImage:appDelegateObj.objLogin.i];
//		v.backgroundColor = c;
//		[c release];
//		
//		//[appDelegateObj.objLogin.tabBar.tabBar insertSubview:v atIndex:appDelegateObj.tabbarIndCnt];
//         appDelegateObj.tabbarIndCnt++;
//		//[v sendSubviewToBack:appDelegateObj.objLogin.tabBar.tabBar];
//       	[v release];
        
        [topbarImg setImage:[UIImage imageNamed:@"GreyTopBar.png"]];
        
    }
    if (indexPath.row == 2) {
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Fire and Ice"];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Fall"];
        [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"Basic"];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Purple"];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Default"];
        [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"blackBkGround.png"]];
         [topbarImg setImage:[UIImage imageNamed:@"BlackTopBar.png"]];
        appDelegateObj.isthemechanged = TRUE;
    }
    if (indexPath.row == 3) {
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Fire and Ice"];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Fall"];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Basic"];
        [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"Purple"];
         [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Default"];
        [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"purpleBkGround.png"]];
        appDelegateObj.isthemechanged = TRUE;
//        CGRect frame1 = CGRectMake(-2, 0, 480, 180);
//		UIView *v1 = [[UIView alloc] initWithFrame:frame1];
//        NSLog(@"%@",v1);
//        appDelegateObj.objLogin.i = [UIImage imageNamed:@"purpleBottomBar.png"];
//        UIColor *c1 = [[UIColor alloc] initWithPatternImage:appDelegateObj.objLogin.i];
//         NSLog(@"%@",c1);
//		v1.backgroundColor = c1;
//		[c1 release];
//		
//		//[appDelegateObj.objLogin.tabBar.tabBar insertSubview:v1 atIndex:appDelegateObj.tabbarIndCnt];
//        appDelegateObj.tabbarIndCnt++;
//		//[v1 sendSubviewToBack:appDelegateObj.objLogin.tabBar.tabBar];
//       	[v1 release];
        
        [topbarImg setImage:[UIImage imageNamed:@"PurpleTopBar.png"]];
    }
    if (indexPath.row == 4) {
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Fire and Ice"];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Fall"];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Basic"];
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"Purple"];
         [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"Default"];
        [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"back.2.png"]];
        [topbarImg setImage:[UIImage imageNamed:@"Group9.png"]];
        appDelegateObj.isthemechanged = TRUE;
    }

}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

