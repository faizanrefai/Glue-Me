//
//  AlertRegistering.m
//  glueme
//
//  Created by APPLE  on 10/18/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import "AlertRegistering.h"


@implementation AlertRegistering

UIAlertView *av; 
UIActivityIndicatorView *actInd;

+(void)showAlertForProcess{
	if(av!=nil && [av retainCount]>0){
		[av release]; av=nil; 
	} 
	if(actInd!=nil && [actInd retainCount]>0){
		[actInd removeFromSuperview];
		[actInd release]; actInd=nil; 
	}
	av=[[UIAlertView alloc] initWithTitle:@"Registering..." message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil]; 
	actInd=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray]; 
	[actInd setFrame:CGRectMake(120, 50, 30, 30)];
	[actInd startAnimating];
	//av.transform = CGAffineTransformTranslate( av.transform, 0.0, 100.0 );
	[av addSubview:actInd]; 
	[av show]; 
} 
+(void)hideAlert{
	[av dismissWithClickedButtonIndex:0 animated:YES]; 
	if(av!=nil && [av retainCount]>0){ [av release]; av=nil; 
	} 
	if(actInd!=nil && [actInd retainCount]>0){ 
		[actInd removeFromSuperview];[actInd release]; actInd=nil; 
	} 
}

@end
