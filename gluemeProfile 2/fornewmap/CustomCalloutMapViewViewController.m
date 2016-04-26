//
//  CustomCalloutMapViewViewController.m
//  CustomCalloutMapView
//
//  Created by Jakob Ericsson on 2009-11-01.
//  Copyright JAKERI AB 2009. All rights reserved.
//

#import "CustomCalloutMapViewViewController.h"
#import "MyAnnotationView.h"
#import "JSONParser.h"
#import "MapWithRoutesViewController.h"
#import "Bump.h"
#import "AlertHandler.h"
#import "listwhoglued.h"
#import "DDAnnotation.h"
#import "DDAnnotationView.h"

@implementation CustomCalloutMapViewViewController

@synthesize mapView, touchView, moreInfoView,annValues,annotations,backGroundImg;

NSString * const GMAP_ANNOTATION_SELECTED = @"gmapselected";

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication]delegate];
    self.navigationController.navigationBar.alpha = 0.0;
    
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
   
   
	
    topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
    //[topbarImg setImage:[UIImage imageNamed:@"Group9.png"]];
    
    
     if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
     [topbarImg setImage:[UIImage imageNamed:@"GreyTopBar.png"]];
         
         [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"GreyBkGround.png"]];
         
     }
     else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
     {
     [topbarImg setImage:[UIImage imageNamed:@"PurpleTopBar.png"]];
         
         [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"purpleBkGround.png"]];
        
     }
     else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
     {
     [topbarImg setImage:[UIImage imageNamed:@"OrangeTopBar.png"]];
         
         [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"OrangeBkGround.png"]];
         
         
     }
     else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
     {
     [topbarImg setImage:[UIImage imageNamed:@"BlackTopBar.png"]];
         
         [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"blackBkGround.png"]];
         
         
     }
     else
     {
     [topbarImg setImage:[UIImage imageNamed:@"Group9.png"]];
         [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"back.2.png"]];
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
    inFunction =FALSE;

}
-(void)displayindicator{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    {
        [AlertHandler showAlertForProcess];
    }
    [pool release];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    if (appDelegateObj.isthemechanged) {
        
        //    self.navigationController.navigationBar.alpha = 0.0;
        //    
        //    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
        //    topbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 46)];
        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fall"] isEqualToString:@"1"]) {
            [topbarImg setImage:[UIImage imageNamed:@"GreyTopBar.png"]];
            
            [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"GreyBkGround.png"]];
            
        }
        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Purple"] isEqualToString:@"1"])
        {
            [topbarImg setImage:[UIImage imageNamed:@"PurpleTopBar.png"]];
            
            [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"purpleBkGround.png"]];
            
        }
        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Fire and Ice"] isEqualToString:@"1"])
        {
            [topbarImg setImage:[UIImage imageNamed:@"OrangeTopBar.png"]];
            
            [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"OrangeBkGround.png"]];
            
            
        }
        else if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Basic"] isEqualToString:@"1"])
        {
            [topbarImg setImage:[UIImage imageNamed:@"BlackTopBar.png"]];
            
            [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"blackBkGround.png"]];
            
            
        }
        else
        {
            [topbarImg setImage:[UIImage imageNamed:@"Group9.png"]];
            [appDelegateObj.backGroundImg setImage:[UIImage imageNamed:@"back.2.png"]];
        }
    }
    
    if(inFunction)
    {
        inFunction =FALSE;
        return;
    }
    
    touchView = [[TouchView alloc] initWithFrame:CGRectMake(0, 30, 320, 400)];
	touchView.delegate = self;
	touchView.callAtHitTest = @selector(stopFollowLocation);
	
    //Next we create the MKMapView object, which will be added as a subview of viewTouch
    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 30, 320, 352)];
	mapView.delegate = self;
    [touchView addSubview:mapView];
	
    //And we display everything!
    [self.view addSubview:touchView];   
	
    locationManager = [[CLLocationManager alloc]init];
	if([CLLocationManager locationServicesEnabled])
	{
		locationManager = [[CLLocationManager alloc] init];
		locationManager.desiredAccuracy = kCLLocationAccuracyBest; 
		locationManager.delegate = self;
		//locationManager.location.coordinate.latitude;
		[locationManager startUpdatingLocation];
		
        MKCoordinateRegion region;  
        MKCoordinateSpan span;  
        span.latitudeDelta=0.02;  
        span.longitudeDelta=0.02;  
        CLLocationCoordinate2D location; 
        
        location.latitude = [appDelegateObj.latitude floatValue];
        
        location.longitude = [appDelegateObj.longitude floatValue];
        
        NSLog(@"%f",location.latitude);
        NSLog(@"%f",location.longitude);
        
        
        region.span=span;  
        region.center=location;  
        
        [mapView setRegion:region animated:TRUE];  
        [mapView regionThatFits:region];
        
        
		//	appDelegateObj.latitude= [[NSString alloc]initWithFormat:@"%g",locationManager.];
		//appDelegateObj.longitude = [[NSString alloc]initWithFormat:@"%g",locationManager.longitude];
		//		
		
	}

	
    imageViewPro = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"ProfileLogo.png"]];
    [imageViewPro setFrame:CGRectMake(5, 14, 80, 80)];
	self.moreInfoView.frame = CGRectMake(0.0, 250.0  + 310.0, self.moreInfoView.frame.size.width, self.moreInfoView.frame.size.height);
   
    
    [moreInfoView addSubview:imageViewPro];
    
    
	[self.touchView addSubview:self.moreInfoView];
   
    annotations =[[NSMutableArray alloc] init];
    annValues =[[NSMutableArray alloc] init];
//    [annotations removeAllObjects];
//    [annValues removeAllObjects];
    [NSThread detachNewThreadSelector:@selector(displayindicator) toTarget:self withObject:nil];
  [self getUSer];
}



#pragma mark -
#pragma mark CLLocationManagerDelegate
#define MINIMUM_DISTANCE 200

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	//NSLog(@"Accuracy [%f]",newLocation.horizontalAccuracy);
	
	
        
    CLLocationCoordinate2D location1;  
	
	location1.latitude = newLocation.coordinate.latitude ;
	location1.longitude = newLocation.coordinate.longitude;
     
	
	appDelegateObj.latitude= [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.latitude];
	appDelegateObj.longitude = [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.longitude];
	
	NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/update_lat_lon.php?uid=%d&lat=%@&lon=%@",appDelegateObj.userID,appDelegateObj.latitude,appDelegateObj.longitude];
    
    //  NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
	JSONParser *parser;
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatchupdate:) andHandler:self];
    //	NSLog(@"from login lat n lon :%@  %@",  GlueAppDelegateObj.latitude,GlueAppDelegateObj.longitude);
	
	//if (currentLocation) {
    //		[currentLocation release];
    //		currentLocation = nil;
    //	}
    //	currentLocation = [newLocation retain];
    //	
    //	if (currentLocation.horizontalAccuracy <= MINIMUM_DISTANCE) {
    //		//[self startReverseGeocodingWithCurrentLocation];
    //	}
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Location manager FAIL");
}

-(void)datafatchupdate:(NSDictionary*)dictionary{
	
}

-(void)Back
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)Bump
{
    NSLog(@"BumpClicked");
    Bump *bumpObj = [[Bump alloc] initWithNibName:@"Bump" bundle:nil];
    [self.navigationController pushViewController:bumpObj animated:YES];
    
}
-(void)getUSer{
	
    
	NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/user_list.php?userid=%d",appDelegateObj.userID]]];
	JSONParser *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(userResult:) andHandler:self];
	
     NSLog(@"%@",parser);
	
}
-(void)userResult:(NSDictionary*)dictionary{
    
    //Populate some test annotations.
      NSMutableArray *tempuserArr =[dictionary valueForKey:@"Record"];
	
	[annValues addObject:[[tempuserArr objectAtIndex:0]retain]];
	[self getFriend];
	
}

-(void)getFriend{
    
	NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/glueMe_friend_list.php?user_id=%d",appDelegateObj.userID]]];
	JSONParser *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(frndResult:) andHandler:self];
    NSLog(@"%@",parser);
    
}
-(void)frndResult:(NSDictionary*)dictionary{
    
    //Populate some test annotations.
    NSMutableArray *tempfrndArr =[dictionary valueForKey:@"glueMe_friend_list"];
	frndCnt = [tempfrndArr count];
    
    for(int i=0;i<[tempfrndArr count];i++){
        [annValues addObject:[[tempfrndArr objectAtIndex:i]retain]];
        
        if([[[tempfrndArr objectAtIndex:i] valueForKey:@"user_id"]isEqualToString:appDelegateObj.strIdsel0]){
            
        
        MKCoordinateRegion region;  
        MKCoordinateSpan span;  
        span.latitudeDelta=0.020;  
        span.longitudeDelta=0.020;  
        CLLocationCoordinate2D location; 
        
        location.latitude = [[[tempfrndArr objectAtIndex:i] valueForKey:@"lat"]floatValue];
        
        location.longitude = [[[tempfrndArr objectAtIndex:i] valueForKey:@"lon"]floatValue];
        
        region.span=span;  
        region.center=location;  
        
        [mapView setRegion:region animated:TRUE];  
        [mapView regionThatFits:region];
            NSLog(@"Zoom");
    }

    
    }
    
    
	
	[self getMeeting];
	
}
-(void)getMeeting{
    
	NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/glueMe_meeting_list.php?user_id=%d",appDelegateObj.userID]]];
	JSONParser *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(meetinResult:) andHandler:self];
     NSLog(@"%@",parser);
    
}
-(void)meetinResult:(NSDictionary*)dictionary{

    if (annotations) {
        annotations =[[NSMutableArray alloc] init];
    }
    if (!annValues) {
        annValues =[[NSMutableArray alloc] init];
    }
    

    
      NSMutableArray *tempmeetingArr =[dictionary valueForKey:@"glueMe_meeting_list"];
    meetingCnt =[tempmeetingArr count];
    //Populate some test annotations.
    for(int i=0;i<[tempmeetingArr count];i++){
        [annValues addObject:[[tempmeetingArr objectAtIndex:i]retain]];
        
    }
	for(int j =0;j<[annValues count];j++){
       
        NSMutableDictionary *t =[annValues objectAtIndex:j];
        float lat =[[t valueForKey:@"lat"] floatValue];
         float lon =[[t valueForKey:@"lon"] floatValue];
        
       // NSMutableDictionary *t1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Set Meeting On this place",@"Place",nil];
        
       // CLLocationCoordinate2D coord2dSetM = {lat+1.1,lon+1.1};
        
         CLLocationCoordinate2D coord2d = {lat,lon};
        MyAnnotation *anno;
       // MyAnnotation *anno1;
        if(j==0){
        anno = [[MyAnnotation alloc] initWithCoords:coord2d name:t type:@"User"];
           // anno1 = [[MyAnnotation alloc] initWithCoords:coord2dSetM name:t1 type:@"SetMeeting"];
        }
        else if(j>0&& j<= frndCnt){
            anno = [[MyAnnotation alloc] initWithCoords:coord2d name:t type:@"Friend"];
        }
        else{
            anno = [[MyAnnotation alloc] initWithCoords:coord2d name:t type:@"Meeting"];;
        }
                                  
        [annotations addObject:[anno retain]];
       // [annotations addObject:[anno1 retain]];
        
    }

	[AlertHandler hideAlert];
	[mapView addAnnotations:[annotations retain]];
	
	[annotations release];
	
	
}

- (void) stopFollowLocation {
	//NSLog(@"stopFollowLocation called. Good place to put stop follow location annotation code.");
	
	MyAnnotation* annotation;
	for (annotation in mapView.selectedAnnotations) {
		[mapView deselectAnnotation:annotation animated:NO];
	}
	
	[self hideAnnotation];
	
}

- (void) annotationClicked: (id <MKAnnotation>) annotation {
	MyAnnotation* ann = (MyAnnotation*) annotation;
	NSLog(@"Annotation clicked: %@", ann.type);
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"CustomCalloutMapView" message:[NSString stringWithFormat:@"You clicked at annotation: %@",ann.type] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
	[alert show];
	[alert release];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	
	MKAnnotationView* annotationView = nil;
	
	MyAnnotation *myAnnotation = (MyAnnotation*) annotation;
    NSLog(@"%@",myAnnotation.val);
	NSString* identifier = @"Pin";
	
	if([myAnnotation.type isEqualToString:@"User"]){
        
        MKPinAnnotationView* annView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if(nil == annView) {
            annView = [[[MKPinAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
        }
        
        [annView addObserver:self
                  forKeyPath:@"selected"
                     options:NSKeyValueObservingOptionNew
                     context:GMAP_ANNOTATION_SELECTED];
        
        user_ann = myAnnotation;
	[annView setPinColor:MKPinAnnotationColorGreen];
        
        annotationView = annView;
        
    }
     else if([myAnnotation.type isEqualToString:@"Friend"]){
         
         MKPinAnnotationView* annView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
         
         if(nil == annView) {
             annView = [[[MKPinAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
         }
         
         [annView addObserver:self
                   forKeyPath:@"selected"
                      options:NSKeyValueObservingOptionNew
                      context:GMAP_ANNOTATION_SELECTED];
         
        [annView setPinColor:MKPinAnnotationColorPurple];
         
         annotationView = annView;
        
    }
    else if([myAnnotation.type isEqualToString:@"Meeting"]){
        
        MKPinAnnotationView* annView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if(nil == annView) {
            annView = [[[MKPinAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
        }
        
        [annView addObserver:self
                  forKeyPath:@"selected"
                     options:NSKeyValueObservingOptionNew
                     context:GMAP_ANNOTATION_SELECTED];
        
       // [annView setPinColor:nil];
        annView.image =[UIImage imageNamed:@"Layer1.png"];
        
        annotationView = annView;
        
    }
    else if([myAnnotation.type isEqualToString:@"SetMeeting"])
    {
        
       MKPinAnnotationView* annViewpin = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        [annViewpin setPinColor:MKPinAnnotationColorRed];
        [annViewpin setDraggable:TRUE];
        
        if(nil == annViewpin) {
            annViewpin = [[[MKPinAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
        }
        
        [annViewpin addObserver:self
                  forKeyPath:@"selected"
                     options:NSKeyValueObservingOptionNew
                     context:GMAP_ANNOTATION_SELECTED];
        
        
//        DDAnnotationView *annView = (DDAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
//        
//        
//        [annView setUserInteractionEnabled:TRUE];
//        
//        if(nil == annView) {
//            annView = [DDAnnotationView annotationViewWithAnnotation:myAnnotation reuseIdentifier:identifier mapView:self.mapView];
//        }
//        
//        [annView addObserver:self
//                  forKeyPath:@"selected"
//                     options:NSKeyValueObservingOptionNew
//                     context:GMAP_ANNOTATION_SELECTED];
        //[annView dragState];
        //annView.draggable = YES;
     //        [annView setDragState:MKAnnotationViewDragStateDragging animated:YES];
        //annView.
        
        annotationView = annViewpin;
    }
	
	//CGPoint notNear = CGPointMake(100.0,100.0);
	//annView.calloutOffset = notNear;
	
	
	[annotationView setEnabled:YES];
	[annotationView setCanShowCallout:NO];
	
	return annotationView;
	
	
	/*
	 MKAnnotationView* annotationView = nil;
	 
	 MyAnnotation *myAnnotation = (MyAnnotation*) annotation;
	 NSString* identifier = @"Pin";
	 MyAnnotationView* annView = (MyAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
	 
	 if(nil == annView) {
	 annView = [[[MyAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
	 }
	 
	 [annView addObserver:self
	 forKeyPath:@"selected"
	 options:NSKeyValueObservingOptionNew
	 context:GMAP_ANNOTATION_SELECTED];
	 
	 //[pin setPinColor:MKPinAnnotationColorGreen];
	 
	 annotationView = annView;
	 
	 [annotationView setEnabled:YES];
	 [annotationView setCanShowCallout:YES];
	 
	 return annotationView;
	 */
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)annotationView didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState {
	
	if (oldState == MKAnnotationViewDragStateDragging) {
        
       // [self showAnnotation:annotationView.annotation];        
		DDAnnotation *annotation = (DDAnnotation *)annotationView.annotation;
		annotation.subtitle = [NSString	stringWithFormat:@"%f %f", annotation.coordinate.latitude, annotation.coordinate.longitude];		
	}
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
	
    NSString *action = (NSString*)context;
	
    if([action isEqualToString:GMAP_ANNOTATION_SELECTED]){
		BOOL annotationAppeared = [[change valueForKey:@"new"] boolValue];
		if (annotationAppeared) {
			[self showAnnotation:((MyAnnotationView*) object).annotation];
		}
		else {
			NSLog(@"annotation deselected %@", ((MyAnnotationView*) object).annotation.title);
			[self hideAnnotation];
		}
	}
 
}


-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Set the meeting." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        
    }

}


- (void)showAnnotation:(MyAnnotation*)annotation {
    destination_ann =annotation;

    if([annotation.type isEqualToString:@"SetMeeting"])
    {
        
        
        self.moreInfoView.hidden = YES;
        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"You want to set meeting to this place?" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
//        [alert show];
//        [alert release];
    }
    else if(![annotation.type isEqualToString:@"Meeting"]){
        self.moreInfoView.meetingView.hidden =YES;
        self.moreInfoView.personView.hidden =FALSE;
         imageViewPro.hidden =FALSE;
    [self setLoadImageg:[annotation.val valueForKey:@"image"]];
        self.moreInfoView.text1.text = [NSString stringWithFormat:@"%@ %@",[annotation.val valueForKey:@"firstname"],[annotation.val valueForKey:@"lastname"]];
        self.moreInfoView.text2.text = [annotation.val valueForKey:@"add"];
        
    }
    else{
         imageViewPro.hidden =TRUE;
        self.moreInfoView.meetingView.hidden =FALSE;
        self.moreInfoView.personView.hidden =TRUE;
        
        self.moreInfoView.text1m.text = [annotation.val valueForKey:@"add"];
        self.moreInfoView.text2m.text = [NSString stringWithFormat:@"Time %@ to %@",[annotation.val valueForKey:@"start_date_time"],[annotation.val valueForKey:@"end_date_time"]];

    
    }
  
	[UIView beginAnimations: @"moveCNGCallout" context: nil];
	[UIView setAnimationDelegate: self];
	[UIView setAnimationDuration: 0.2];
	[UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
	self.moreInfoView.frame = CGRectMake(0.0, 273.0, self.moreInfoView.frame.size.width, self.moreInfoView.frame.size.height);
	[UIView commitAnimations];	
	
}

- (void)hideAnnotation {
	self.moreInfoView.text1.text = nil;
    self.moreInfoView.text2.text = nil;
	[UIView beginAnimations: @"moveCNGCalloutOff" context: nil];
	[UIView setAnimationDelegate: self];
	[UIView setAnimationDuration: 0.2];
	[UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
	self.moreInfoView.frame = CGRectMake(0.0, 250.0 + 300, self.moreInfoView.frame.size.width, self.moreInfoView.frame.size.height);
	[UIView commitAnimations];
}
- (IBAction)onNavigation:(id)sender{ 
    
	 
    MapWithRoutesViewController *obj= [[MapWithRoutesViewController alloc] init ];
    
    Place *s =[[[Place alloc]init]autorelease];
    s.name = [user_ann.val valueForKey:@"firstname"];
	s.description =[user_ann.val valueForKey:@"add"];   
    
	s.latitude = [[user_ann.val valueForKey:@"lat"]floatValue];    
	s.longitude = [[user_ann.val valueForKey:@"lon"] floatValue];
    
    Place *d =[[[Place alloc]init]autorelease];
    
    if([destination_ann.type isEqualToString:@"Meeting"]){
        d.name = [destination_ann.val valueForKey:@"start_date_time"];  

        d.description =[destination_ann.val valueForKey:@"add"];
    }
   else{
       d.name = [destination_ann.val valueForKey:@"firstname"];  
       
       d.description =[destination_ann.val valueForKey:@"add"];
       
   }
	d.latitude = [[destination_ann.val valueForKey:@"lat"]floatValue];
	d.longitude =  [[destination_ann.val valueForKey:@"lon"] floatValue];
    [obj setSource:s];
    [obj setDestination:d];
//    [obj setPlaces:s:d];
     inFunction =TRUE;
    
    [self.navigationController pushViewController:obj animated:YES];
    
   // [self.view addSubview:obj.view ];
    //[self.navigationController presentModalViewController:obj animated:YES];
  //  [obj release]; 
  
    
}

-(IBAction)onMail:(id)sender{
    inFunction =TRUE;
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject:@"From GlueMe"];
    NSArray *toRecipients = [NSArray arrayWithObject:[destination_ann.val valueForKey:@"email"]]; 
    
                             [controller setToRecipients:toRecipients];
    [controller setMessageBody:@"My message here." isHTML:NO]; 
    if (controller) [self presentModalViewController:controller animated:YES];
    [controller release];

    
}

- (void)mailComposeController:(MFMailComposeViewController*)controller  
          didFinishWithResult:(MFMailComposeResult)result 
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)onMessage:(id)sender{
    
        MFMessageComposeViewController *controller = [[[MFMessageComposeViewController alloc] init] autorelease];
        controller.delegate = self;
        if([MFMessageComposeViewController canSendText])
        {
            controller.body = @"Hello from Mugunth";
            controller.recipients = [NSArray arrayWithObjects:[destination_ann.val valueForKey:@"contact_number"], nil];
            controller.messageComposeDelegate = self;
            [self presentModalViewController:controller animated:YES];
        }
    

    
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
	switch (result) {
		case MessageComposeResultCancelled:
			NSLog(@"Cancelled");
			break;
		case MessageComposeResultFailed:
        {
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"MyApp" message:@"Unknown Error"
														   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			[alert release];
			break;
        }
		case MessageComposeResultSent:
            
			break;
		default:
			break;
	}
    
	[self dismissModalViewControllerAnimated:YES];
}
- (IBAction)onclose:(id)sender{
    [self hideAnnotation];
    
}
- (IBAction)onMeeting:(id)sender{
    
    NSLog(@"%i",appDelegateObj.userID);
    NSLog(@"%@",[destination_ann.val valueForKey:@"user_id"]);
    
    if ([destination_ann.val valueForKey:@"user_id"] == NULL) 
    {
//    if ([[NSString stringWithFormat:@"%i",appDelegateObj.userID] isEqualToString:[NSString stringWithFormat:@"%@",[destination_ann.val valueForKey:@"user_id"]]]) 
//    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"You have to choose another to set meeting." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    else
    {
    appDelegateObj.selectedFrnd = @"";
    
    appDelegateObj.selectedFrnd = [NSString stringWithFormat:@"%@",[destination_ann.val valueForKey:@"firstname"]];
    appDelegateObj.stremailselect0 = [NSString stringWithFormat:@"%@",[destination_ann.val valueForKey:@"email"]];
    
    meetingpointview *obj = [[meetingpointview alloc]init];
	[self.navigationController pushViewController:obj animated:YES];

    }
}
- (IBAction)onCall:(id)sender{
    NSString *phoneNumber = [@"tel://" stringByAppendingString:[destination_ann.val valueForKey:@"contact_number"]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];

    
}
-(IBAction)onDelete:(id)sender{
   NSLog( @"%@", [destination_ann.val valueForKey:@"gmid"]);
    NSLog(@"%@",[destination_ann.val valueForKey:@"user_id"]);
    
    if ([[destination_ann.val valueForKey:@"user_id"] intValue] == appDelegateObj.userID) {
        
        NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/remove_glueMe_meeting.php?gmid=%@&user_id=%@",[destination_ann.val valueForKey:@"gmid"],[destination_ann.val valueForKey:@"user_id"]];
        
        NSLog(@"%@",urlString);
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        
        JSONParser *parser;
        parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(RemoveMetData:) andHandler:self];
        
    }
    else
    {
        NSString *urlString = [NSString stringWithFormat:@"http://www.openxcellaus.info/glueme/remove_glueMe_meeting.php?gmid=%@&frnd_id=%i",[destination_ann.val valueForKey:@"gmid"],appDelegateObj.userID];
        
        NSLog(@"%@",urlString);
        
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        
        JSONParser *parser;
        parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(RemoveMetFrnd:) andHandler:self];
        

    }

}

-(void)RemoveMetData:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);
    
    [mapView release];
    
        if(inFunction)
    {
        inFunction =FALSE;
        return;
    }
    
    touchView = [[TouchView alloc] initWithFrame:CGRectMake(0, 30, 320, 400)];
	touchView.delegate = self;
	touchView.callAtHitTest = @selector(stopFollowLocation);
	
    //Next we create the MKMapView object, which will be added as a subview of viewTouch
    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 30, 320, 352)];
	mapView.delegate = self;
    [touchView addSubview:mapView];
	
    //And we display everything!
    [self.view addSubview:touchView];   
	
    locationManager = [[CLLocationManager alloc]init];
	if([CLLocationManager locationServicesEnabled])
	{
		locationManager = [[CLLocationManager alloc] init];
		locationManager.desiredAccuracy = kCLLocationAccuracyBest;
		locationManager.delegate = self;
		//locationManager.location.coordinate.latitude;
		[locationManager startUpdatingLocation];
		
        MKCoordinateRegion region;  
        MKCoordinateSpan span;  
        span.latitudeDelta=0.02;  
        span.longitudeDelta=0.02;  
        CLLocationCoordinate2D location; 
        
//        MKCoordinateRegion region;  
//        MKCoordinateSpan span;  
//        span.latitudeDelta=0.2;  
//        span.longitudeDelta=0.2;  
//        CLLocationCoordinate2D location; 
        region.span=span;  
        region.center=location;  
        
        [mapView setRegion:region animated:TRUE];  
        [mapView regionThatFits:region];
        
        
		//	appDelegateObj.latitude= [[NSString alloc]initWithFormat:@"%g",locationManager.];
		//appDelegateObj.longitude = [[NSString alloc]initWithFormat:@"%g",locationManager.longitude];
		//		
		
	}

	
    imageViewPro = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"ProfileLogo.png"]];
    [imageViewPro setFrame:CGRectMake(5, 14, 80, 80)];
	self.moreInfoView.frame = CGRectMake(0.0, 250.0  + 310.0, self.moreInfoView.frame.size.width, self.moreInfoView.frame.size.height);
    
    
    [moreInfoView addSubview:imageViewPro];
    
    
	[self.touchView addSubview:self.moreInfoView];
    
    annotations =[[NSMutableArray alloc] init];
    annValues =[[NSMutableArray alloc] init];
    //    [annotations removeAllObjects];
    //    [annValues removeAllObjects];
    [NSThread detachNewThreadSelector:@selector(displayindicator) toTarget:self withObject:nil];
    [self getUSer];

    
   // [mapView release];
    
//    isMetDeleted = TRUE;
//    
//    [self viewWillAppear:YES];
    
}

-(void)RemoveMetFrnd:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);
    
    [mapView release];
    
       if(inFunction)
    {
        inFunction =FALSE;
        return;
    }
    
    touchView = [[TouchView alloc] initWithFrame:CGRectMake(0, 30, 320, 400)];
	touchView.delegate = self;
	touchView.callAtHitTest = @selector(stopFollowLocation);
	
    //Next we create the MKMapView object, which will be added as a subview of viewTouch
    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 30, 320, 352)];
	mapView.delegate = self;
    [touchView addSubview:mapView];
	
    //And we display everything!
    [self.view addSubview:touchView];   
	
    locationManager = [[CLLocationManager alloc]init];
	if([CLLocationManager locationServicesEnabled])
	{
		locationManager = [[CLLocationManager alloc] init];
		locationManager.desiredAccuracy = kCLLocationAccuracyBest;
		locationManager.delegate = self;
		//locationManager.location.coordinate.latitude;
		[locationManager startUpdatingLocation];
		
        MKCoordinateRegion region;  
        MKCoordinateSpan span;  
        span.latitudeDelta=0.2;  
        span.longitudeDelta=0.2;  
        CLLocationCoordinate2D location; 
        region.span=span;  
        region.center=location;  
        
        [mapView setRegion:region animated:TRUE];  
        [mapView regionThatFits:region];
        
        
		//	appDelegateObj.latitude= [[NSString alloc]initWithFormat:@"%g",locationManager.];
		//appDelegateObj.longitude = [[NSString alloc]initWithFormat:@"%g",locationManager.longitude];
		//		
		
	}

	
    imageViewPro = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"ProfileLogo.png"]];
    [imageViewPro setFrame:CGRectMake(5, 14, 80, 80)];
	self.moreInfoView.frame = CGRectMake(0.0, 250.0  + 310.0, self.moreInfoView.frame.size.width, self.moreInfoView.frame.size.height);
    
    
    [moreInfoView addSubview:imageViewPro];
    
    
	[self.touchView addSubview:self.moreInfoView];
    
    annotations =[[NSMutableArray alloc] init];
    annValues =[[NSMutableArray alloc] init];
    //    [annotations removeAllObjects];
    //    [annValues removeAllObjects];
    [NSThread detachNewThreadSelector:@selector(displayindicator) toTarget:self withObject:nil];
    [self getUSer];

    
    
    
//    isMetDeleted = TRUE;
//    
//    [self viewWillAppear:YES];
    
}


-(void)setLoadImageg:(NSString*)loadimage
{    
    imageViewPro.imageURL = [NSURL URLWithString:loadimage];
    
}

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
    [annValues release];
    [annotations release];
    [mapView release];
    [touchView release];
    [moreInfoView release];
   }

@end
