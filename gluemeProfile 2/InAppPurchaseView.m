//
//  InAppPurchaseView.m
//  glueme
//
//  Created by APPLE apple on 1/18/12.
//  Copyright (c) 2012 openxcel. All rights reserved.
//

#import "InAppPurchaseView.h"

@implementation InAppPurchaseView
@synthesize productIdentifierList,productDetailsList,productDisplayTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
  productDetailsList    = [[NSMutableArray alloc] init];  
     productIdentifierList = [[NSMutableArray alloc] init];  
   
     for (short item_count=1; item_count <= 3; item_count++) {  
         [productIdentifierList addObject:[NSString stringWithFormat:@"com.mobiletuts.inappdemo.%d", item_count]];  
     }  
   
     SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithArray:productIdentifierList]];  
   
     request.delegate = self;  
     [request start];  
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
  [productDetailsList addObjectsFromArray: response.products];  
     [productDisplayTableView reloadData];  
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.productDetailsList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *GenericTableIdentifier = @"GenericTableIdentifier";  
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: GenericTableIdentifier];  
     if (cell == nil) {  
         cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier: GenericTableIdentifier] autorelease];  
     }   
   
     NSUInteger row = [indexPath row];  
     SKProduct *thisProduct = [productDetailsList objectAtIndex:row];  
     [cell.textLabel setText:[NSString stringWithFormat:@"%@ - %@", thisProduct.localizedTitle, thisProduct.price]];   
   
     return cell;
}


-(void)requestDidFinish:(SKRequest *)request
{
     [request release];   
}

-(void)request:(SKRequest *)request didFailWithError:(NSError *)error
{
     NSLog(@"Failed to connect with error: %@", [error localizedDescription]); 
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
