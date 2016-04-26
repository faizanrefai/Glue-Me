//
//  TextSendView.m
//  glueme
//
//  Created by OPENXCELL TECHNOLABS on 9/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TextSendView.h"
#import "whogluedmap.h"

@implementation TextSendView
@synthesize textSend,ToText;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.4;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 1.2;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.6;

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
   
	
	//whogluedmap	*gluemap=[[whogluedmap alloc]initWithNibName:@"whogluedmap" bundle:nil];
    appDelegateObj.count = 0;
     [self.navigationController pushViewController:mymapObj animated:NO];
	//[self.navigationController pushViewController:gluemap animated:YES];
	//[gluemap release];
	
	
}
-(void) textViewDidBeginEditing:(UITextView *)textView{
    
	CGRect textFieldRect =[self.view.window convertRect:textView.bounds fromView:textView];
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
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range 
 replacementText:(NSString *)text
{
	if([textSend.text isEqualToString:@"Write Here......"]){
        textSend.text=@"";
	}
	
	// Any new character added is passed in as the "text" parameter
    if ([text isEqualToString:@"\n"]) {
        // Be sure to test for equality using the "isEqualToString" message
        [textView resignFirstResponder];
		
        // Return FALSE so that the final '\n' character doesn't get added
        return FALSE;
    }
    // For any other character return TRUE so that the text gets added to the view
    return TRUE;
}

-(void) textViewDidEndEditing:(UITextView *)textView{
	self.view.frame = CGRectMake(0,20, 320, 440);
	
	[textSend resignFirstResponder];
	
    [UIView commitAnimations];   
	
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [super viewDidLoad];
}

-(IBAction)onSend:(id)sender{
	UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Send successfully"
														message:nil delegate:self 
											  cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    [self dismissModalViewControllerAnimated:YES];
	
}
-(IBAction)onCancel:(id)Sender{
	[self dismissModalViewControllerAnimated:YES];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	if(buttonIndex ==0)
		[self dismissModalViewControllerAnimated:YES];
		
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
   // [ToText resignFirstResponder];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [textSend resignFirstResponder];
    
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
