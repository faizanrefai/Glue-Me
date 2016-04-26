//
//  forgetpassword.m
//  glueme
//
//  Created by apple on 9/19/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import "forgetpassword.h"
#import "whogluedmap.h"
#import "AlertHandler.h"
#import "GdataParser.h"
#import "FAQHelp.h"

static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;

@implementation forgetpassword

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
    
    appDelegateObj = (gluemeAppDelegate*)[[UIApplication sharedApplication] delegate];
    
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
    topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
        [topbarImg setImage:[UIImage imageNamed:@"GreTopBar3.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"PurpleTopBar3.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"OrangeTopBar3.png"]];
    }
    else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
    {
        [topbarImg setImage:[UIImage imageNamed:@"BlackTopBar3.png"]];
    }
    else
    {
        [topbarImg setImage:[UIImage imageNamed:@"loginTitle.png"]];
    }

    
    
    [self.view addSubview:topbarImg];
    [self.navigationController.navigationBar sendSubviewToBack:topbarImg];
    
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(void)viewWillAppear:(BOOL)animated
{
    if (appDelegateObj.isthemechanged) {
//        self.navigationController.navigationBar.alpha = 0.0;
//        
//        appDelegateObj = (gluemeAppDelegate*)[[UIApplication sharedApplication] delegate];
//        
//        self.navigationController.navigationBar.tintColor = [UIColor clearColor];
//        UIImageView *topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
            [topbarImg setImage:[UIImage imageNamed:@"GreTopBar3.png"]];
        }
        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
        {
            [topbarImg setImage:[UIImage imageNamed:@"PurpleTopBar3.png"]];
        }
        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
        {
            [topbarImg setImage:[UIImage imageNamed:@"OrangeTopBar3.png"]];
        }
        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
        {
            [topbarImg setImage:[UIImage imageNamed:@"BlackTopBar3.png"]];
        }
        else
        {
            [topbarImg setImage:[UIImage imageNamed:@"loginTitle.png"]];
        }
        
        
        
//        [self.view addSubview:topbarImg];
//        [self.navigationController.navigationBar sendSubviewToBack:topbarImg];

    }
}


-(IBAction)onMap:(id)sender{
	
    CustomCalloutMapViewViewController *mymapObj =[[CustomCalloutMapViewViewController alloc] initWithNibName:@"CustomCalloutMapViewViewController" bundle:nil];
    
   
    
//	whoGlueVwObj = [[WhoGlueViewController alloc] initWithNibName:@"WhoGlueViewController" bundle:nil];

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

-(IBAction)OnRetrieve
{
    [self PassData];
}

-(IBAction)OnCancel
{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)PassData
{
    [AlertHandler showAlertForProcess];
    
    //    NSLog(@"%@",[NSString stringWithFormat:@"%d",objAppdel.userId]);
    //    NSLog(@"%@",[NSString stringWithFormat:@"%d",objAppdel.chatWithUserId]);
    //    NSLog(@"%@",ChatTxt.text);
    //    
    //    NSString *encodedString = [ChatTxt.text stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    //    NSLog(@"%@",encodedString);
    //    
	NSString *RegURL = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/forgot_password.php?email=%@",emailtext.text];
    //NSString *RegURL = [NSString stringWithFormat:@"http://openxcellaus.info/leopard/chatting.php?from_user_id=7&to_user_id=8&text=heyfrndssssssss"];
    
	//    NSString *RegURL = @"http://www.openxcellaus.info/leopard/near_by_users.php?lat=23.41670000&long=72.91670000";
    
    
	GdataParser *parser = [[GdataParser alloc] init];
	[parser downloadAndParse:[NSURL URLWithString:RegURL] 
				 withRootTag:@"Record"
					withTags:[NSDictionary dictionaryWithObjectsAndKeys:@"msg",@"msg",nil] 
						 sel:@selector(finishGetData:) 
				  andHandler:self];
	
}

-(void)finishGetData:(NSDictionary*)dictionary{
	[AlertHandler hideAlert];
    
    NSLog(@"%@",dictionary);
    NSMutableArray *tempArray;
    tempArray = [dictionary objectForKey:@"array"];
    NSLog(@"%@",tempArray);
    NSMutableDictionary *tempDic = [tempArray objectAtIndex:0];
    NSLog(@"%@",[tempDic objectForKey:@"msg"]);
    NSString *temp = [tempDic objectForKey:@"msg"];
    if ([temp isEqualToString:@"Email Id do not match"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Email Id do not match" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    else
    {
        [self dismissModalViewControllerAnimated:YES];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Your New Password sent successfully via mail" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    
}

- (void)textFieldDidBeginEditing:(UITextField*)textField
{
    
    
    CGRect textFieldRect =[self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =[self.view.window convertRect:self.view.bounds fromView:self.view];
    
    CGFloat midline = textFieldRect.origin.y + 1.0 * textFieldRect.size.height;
    CGFloat numerator =midline - viewRect.origin.y- MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)* viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    animatedDistance = floor(162.0 * heightFraction);
    
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
    
	CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
	
    
}




-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	
	[emailtext resignFirstResponder];
	[numbertext resignFirstResponder];
	
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
