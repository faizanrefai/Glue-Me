//
//  DetailViewHistory.m
//  glueme
//
//  Created by APPLE  on 9/21/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import "DetailViewHistory.h"
#import	"whogluedmap.h"
#import "FAQHelp.h"
#import "AlertHandler.h"

@implementation DetailViewHistory
@synthesize LastGluedOn,LastGluedTime,LastGluedTimeDetail,LastGluedOnDetail,pickerViewCBrand,actionSheetCBrand,durationArray,pkrExpArea,Lblname;

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
    
    
   // whoGlueObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];
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

- (void)dealloc
{
    [LastGluedTimeDetail release];
    [LastGluedOnDetail release];
    [LastGluedOn release];
    [LastGluedTime release];
    [super dealloc];
}

-(IBAction)deleteGlueHistory
{
    [AlertHandler showAlertForProcess];
   
        NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/remove_glueme_history.php?user_id=%i&frnd_id=%i",appDelegateObj.userID,appDelegateObj.HistoryId];  
        
    
    
        NSLog(@"%@",urlString);
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        
        JSONParser *parser;
        parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(DeletedHistory:) andHandler:self];
        
   
     
//    LastGluedOn.hidden = YES;
//    LastGluedTime.hidden = YES;
//    LastGluedTimeDetail.hidden = YES;
//    LastGluedOnDetail.hidden =YES;
   // appDelegateObj.isdeleteHistory = TRUE;
    
}

-(void)DeletedHistory:(NSDictionary*)dictionary
{
    [AlertHandler hideAlert];
    
    NSLog(@"%@",dictionary);
    
       
    NSString *msg = [dictionary objectForKey:@"msg"];
    
    // uidArray = [dictionary objectForKey:@"uid"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];

     [self.navigationController popViewControllerAnimated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
        if (buttonIndex==0)
        {
            [AlertHandler showAlertForProcess];
            
            NSLog(@"%i",appDelegateObj.HistoryId);
            NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/send_glueme_req.php?user_id=%i&frnd_id=%i&glueme_time=%i",appDelegateObj.userID,appDelegateObj.HistoryId,d];
            
            
            NSLog(@"%@",urlString);
            
            NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
            
            JSONParser *parser;
            parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(GlueMeRequestFatch:) andHandler:self];    
            

        }
}

-(IBAction)ReGlueMe
{
    
    pkrExpArea = [[UIPickerView alloc] init];
    pkrExpArea.delegate=self;
    pkrExpArea.dataSource=self;
    [pkrExpArea setShowsSelectionIndicator:YES];
    [pkrExpArea selectRow:1 inComponent:0 animated:NO];
    [pkrExpArea setTag:1];
    //[pkrExpArea setFrame:CGRectMake(0, 40, 0, 0)];
    
    UIActionSheet *ExpArea = [[UIActionSheet alloc] initWithTitle:@"Pickup Time\n\n\n\n\n\n\n\n\n\n\n\n" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Set" otherButtonTitles:nil];
    ExpArea.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [ExpArea setBounds:CGRectMake(0, 0, 320, 250)];
    ExpArea.tag=1;
    [ExpArea addSubview:pkrExpArea];
    [ExpArea showInView:self.tabBarController.tabBar];
    [pkrExpArea reloadAllComponents];
    /*
    if (!actionSheetCBrand) {
        
        
//        UIActionSheet *ExpArea = [[UIActionSheet alloc] initWithTitle:@"Pickup Time\n\n\n\n\n\n\n\n\n\n\n\n" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Set" otherButtonTitles:nil];
//        ExpArea.actionSheetStyle = UIActionSheetStyleBlackOpaque;
//        [ExpArea setBounds:CGRectMake(0, 0, 320, 250)];
//        ExpArea.tag=1;
//        [ExpArea addSubview:pickerView];
//        [ExpArea showInView:self.tabBarController.tabBar];
        
        
        actionSheetCBrand = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:@"Ok" destructiveButtonTitle:@"Cancel" otherButtonTitles:nil];
        [actionSheetCBrand setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
        
        CGRect pickerFrame;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            pickerFrame = CGRectMake(0, 40, 768, 800);
        else
            pickerFrame = CGRectMake(0, 40, 320, 700);
        
        pickerViewCBrand = [[UIPickerView alloc] initWithFrame:pickerFrame];
        pickerViewCBrand.showsSelectionIndicator = YES;
        pickerViewCBrand.userInteractionEnabled = TRUE;
        pickerViewCBrand.dataSource = self;
        pickerViewCBrand.delegate = self;
        [actionSheetCBrand addSubview:pickerViewCBrand];
        
//        UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Close"]];
//        closeButton.momentary = YES; 
//        
//        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//            closeButton.frame = CGRectMake(700, 7.0f, 50.0f, 30.0f);
//        else 
//            closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
//        
//        
//        closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
//        closeButton.tintColor = [UIColor blackColor];
//        [closeButton addTarget:self action:@selector(dismissActionSheet) forControlEvents:UIControlEventValueChanged];
//        [actionSheetCBrand addSubview:closeButton];
//        [closeButton release];
//        
        
        CGRect frame;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            frame = CGRectMake(self.view.frame.origin.x, 530, 768.0f,450.0f);
        else
            frame = CGRectMake(self.view.frame.origin.x, 60, 480.0f,400.0f);
        
        [actionSheetCBrand setFrame:frame]; 
        [self.view addSubview:actionSheetCBrand];
        
        
    }
    
   
    
    
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Reglued Me" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//    [alert show];
//    [alert release];
//    
//    appDelegateObj.isReGlued = TRUE;
//    
//    [self.navigationController popViewControllerAnimated:YES];
    
//    LastGluedOn.hidden = NO;
//    LastGluedTime.hidden = NO;
//    LastGluedTimeDetail.hidden = NO;
//    LastGluedOnDetail.hidden =NO;
}


/*
 -(IBAction)OnTimeSelected
 {
 
 /*
 actionsheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Done" destructiveButtonTitle:nil otherButtonTitles:nil];	
 // Add the picker
 pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0,65,0,0)];
 pickerView.delegate = self;
 [pickerView setShowsSelectionIndicator:YES];
 pickerView.userInteractionEnabled = TRUE;
 //    pickerView.datePickerMode = UIDatePickerModeDate;
 //self.pickerView = pickerView;
 [actionsheet addSubview:pickerView];
 [actionsheet showInView:self.view];
 [actionsheet setBounds:CGRectMake(0,0,320, 450)];	
 [pickerView release];
 [actionsheet release];		
     */

/*

if (!actionSheetCBrand) {
    
    actionSheetCBrand = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    [actionSheetCBrand setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    CGRect pickerFrame;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        pickerFrame = CGRectMake(0, 40, 768, 300);
    else
        pickerFrame = CGRectMake(0, 40, 320, 200);
    
    pickerViewCBrand = [[UIPickerView alloc] initWithFrame:pickerFrame];
    pickerViewCBrand.showsSelectionIndicator = YES;
    pickerViewCBrand.userInteractionEnabled = TRUE;
    pickerViewCBrand.dataSource = self;
    pickerViewCBrand.delegate = self;
    [actionSheetCBrand addSubview:pickerViewCBrand];
    
    UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Close"]];
    closeButton.momentary = YES; 
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        closeButton.frame = CGRectMake(700, 7.0f, 50.0f, 30.0f);
    else 
        closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
    
    
    closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
    closeButton.tintColor = [UIColor blackColor];
    [closeButton addTarget:self action:@selector(dismissActionSheet) forControlEvents:UIControlEventValueChanged];
    [actionSheetCBrand addSubview:closeButton];
    [closeButton release];
    
    
    CGRect frame;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        frame = CGRectMake(self.view.frame.origin.x, 630, 768.0f,350.0f);
    else
        frame = CGRectMake(self.view.frame.origin.x, 160, 480.0f,300.0f);
    
    [actionSheetCBrand setFrame:frame]; 
    [self.view addSubview:actionSheetCBrand];
 }
    */
    




}

-(void)GlueMeRequestFatch:(NSDictionary*)dictionary
{
    [AlertHandler hideAlert];
    NSLog(@"%@",dictionary);
    
    NSLog(@"%@",[dictionary objectForKey:@"msg1"]);
    NSString *GMsg =[dictionary objectForKey:@"msg1"];
    
    NSLog(@"%@",[dictionary objectForKey:@"msg"]);
    NSString *FMsg = [dictionary objectForKey:@"msg"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:GMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Info" message:FMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert1 show];
    [alert1 release];
    
    [self dismissActionSheet];
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)dismissActionSheet
{
    
    actionSheetCBrand.hidden = TRUE;
    
    [actionSheetCBrand release];
    actionSheetCBrand=nil;
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    NSString *timeStr = [durationArray objectAtIndex:row];
 
 if ([timeStr isEqualToString:@"24 hours"]) {
 d=24;
 }
 if ([timeStr isEqualToString:@"48 hours"]) {
 d=48;
 }
 if ([timeStr isEqualToString:@"12 hours"]) {
 d=12;
 }
 if ([timeStr isEqualToString: @"6 hours"]) {
 d=6;
 }
 if ([timeStr isEqualToString: @"Forever"]) {
 d=50;
 }
    
    NSLog(@"%i",d);
    
       
    
   // [durationBtn setTitle:[durationArray objectAtIndex:row] forState:normal];
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [durationArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [durationArray objectAtIndex:row];
}


 


-(void)GlueResponse:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);
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
    
    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    BumpBtn.frame = CGRectMake(268,10, 35, 34);
    
    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:BumpBtn]; 
    
    [self.view addSubview:backBtn]; 

   
    appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    durationArray = [[NSMutableArray alloc] init];
    [durationArray addObject:@"Forever"];
    [durationArray addObject:@"48 hours"];
    [durationArray addObject:@"24 hours"];
    [durationArray addObject:@"12 hours"];
    [durationArray addObject:@"6 hours"];

    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
        
    LastGluedOnDetail.text = appDelegateObj.histLastGlOn;
    LastGluedTimeDetail.text = [NSString stringWithFormat:@"%@ hour",appDelegateObj.histLastGLTime];
    Lblname.text = appDelegateObj.histName;
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
