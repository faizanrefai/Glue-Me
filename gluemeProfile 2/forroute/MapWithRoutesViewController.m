////
//  MapWithRoutesViewController.m
//  MapWithRoutes
//
//  Created by kadir pekel on 5/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MapWithRoutesViewController.h"
#import "Bump.h"


@implementation MapWithRoutesViewController
@synthesize source,destination;




// The designated initializer. Override to perform setup that is required before the view is loaded.


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [bgImg setImage:[UIImage imageNamed:@"Back.png"]];
    
    [self.view addSubview:bgImg];
    
    UIImageView *topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
    [topbarImg setImage:[UIImage imageNamed:@"Group9.png"]];
    
    [self.view addSubview:topbarImg];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(5,10, 76, 28);
    
    [backBtn addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backBtn]; 
    
    UIButton *BumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    BumpBtn.frame = CGRectMake(268,10, 35, 34);
    
    [BumpBtn addTarget:self action:@selector(Bump) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:BumpBtn]; 
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button addTarget:self 
//               action:@selector(onClose:)
//     forControlEvents:UIControlEventTouchUpInside];
//    [button setTitle:@"Close View" forState:UIControlStateNormal];
//    button.frame = CGRectMake(0.0,0.0, 320, 35.0);
//    [self.view addSubview:button];

   
    mapView = [[MapView alloc] initWithFrame:
                CGRectMake(0, 44, self.view.frame.size.width, 452)];
	
	[self.view addSubview:mapView];
	
	[mapView showRouteFrom:source to:destination];
  
    
}
-(void)Back
{
    [self.navigationController popViewControllerAnimated:YES];
    
   // [self.view removeFromSuperview];
    //[self dismissModalViewControllerAnimated:YES];
}


-(void)Bump
{
    NSLog(@"BumpClicked");
    Bump *bumpObj = [[Bump alloc] initWithNibName:@"Bump" bundle:nil];
    [self.navigationController pushViewController:bumpObj animated:YES];
    
}


-(IBAction)onClose:(id)sender{
    [self.view removeFromSuperview];
    //[self dismissModalViewControllerAnimated:YES];
}

-(void)setPlaces:(Place*)s_p:(Place*)d_p{
    self.source =s_p;
    self.destination =d_p;

}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
