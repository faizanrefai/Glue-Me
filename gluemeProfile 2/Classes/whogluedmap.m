//
//  whogluedmap.m
//  glueme
//
//  Created by apple on 9/21/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import "whogluedmap.h"
#import "FAQHelp.h"

@implementation whogluedmap
@synthesize mapView;
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

-(void)displayMyMap
{
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    span.latitudeDelta = 02.569722 ;
    span.longitudeDelta = 08.369722;
    
    //    NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@&output=csv",
    //                           [addressField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    CLLocationCoordinate2D location ;  
    
	location.latitude = 22.569722 ;
	location.longitude = 88.369722;
    
    region.span = span;
    region.center = location;
    
    [mapView setRegion:region animated:TRUE];  
    [mapView regionThatFits:region];  
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
    
    mapView.delegate = self;
    
    [self.view addSubview:mapView];
    [NSThread detachNewThreadSelector:@selector(displayMyMap) toTarget:self withObject:nil];
    
    
    self.navigationController.navigationBar.alpha = 0.0;
    
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
    UIImageView *topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
    [topbarImg setImage:[UIImage imageNamed:@"topBar.png"]];
    
    [self.view addSubview:topbarImg];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(5,10, 76, 28);
    
    [backBtn addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:backBtn];  
    
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
        self.navigationController.navigationBar.alpha = 0.0;
        
        self.navigationController.navigationBar.tintColor = [UIColor clearColor];
        UIImageView *topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
        [topbarImg setImage:[UIImage imageNamed:@"topBar.png"]];
        
        [self.view addSubview:topbarImg];
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(5,10, 76, 28);
        
        [backBtn addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        [self.view addSubview:backBtn];  

    }
    
    appDelegateObj = (gluemeAppDelegate*)[[UIApplication sharedApplication]delegate];
}

-(void)Back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)btnmeetingpoint_clicked:(id)sender
{
	meetingpointview *obj = [[meetingpointview alloc]init];
	[self.navigationController pushViewController:obj animated:YES];
	
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
