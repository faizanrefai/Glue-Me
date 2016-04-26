//
//  iCodeBlogAnnotationView.m
//  iCodeMap
//
//  Created by Collin Ruffenach on 7/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "iCodeBlogAnnotationView.h"
#import "WhoGlueViewController.h"

@implementation iCodeBlogAnnotationView

@synthesize imageView;

#define kHeight 100
#define kWidth  100
#define kBorder 2


- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
	iCodeBlogAnnotation* myAnnotation = (iCodeBlogAnnotation*)annotation;
	appDelegateObj = (gluemeAppDelegate *)[[UIApplication sharedApplication]delegate];    
    
	if([myAnnotation annotationType] == iCodeBlogAnnotationTypeApple)
	{
		self = [super initWithAnnotation:myAnnotation reuseIdentifier:reuseIdentifier];
		self.frame = CGRectMake(0, 0, kWidth, kHeight);
		self.backgroundColor = [UIColor clearColor];
		
		imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
		//imageView.frame = CGRectMake(kBorder, kBorder, kWidth - 2 * kBorder, kWidth - 2 * kBorder);
        
        imageView.frame = CGRectMake(0, 0, 10, 10);
        UIButton *profImgBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        
        
     //   [profImgBtn setImage:[appDelegateObj.ImgArray objectAtIndex:appDelegateObj.count] forState:UIControlStateNormal];
        profImgBtn.frame = CGRectMake(0, 0, 10, 10);
        
      //  [profImgBtn setTag:appDelegateObj.count];
      //  appDelegateObj.count++;
      //  [profImgBtn sendSubviewToBack:imageView];
      
        
        
//		UIImageView *imageViews = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"p2.png"]];
//		imageViews.frame = CGRectMake(kBorder+25, kBorder-10, (kWidth - 2 * kBorder)-50, (kWidth - 2 * kBorder)-40);
        
        [self addSubview:imageView];
		[self addSubview:profImgBtn];
        [self bringSubviewToFront:profImgBtn];
        [profImgBtn addTarget:self action:@selector(showViewParent:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	else if([myAnnotation annotationType] == iCodeBlogAnnotationTypeEDU)
	{
		self = [super initWithAnnotation:myAnnotation reuseIdentifier:reuseIdentifier];
		self.frame = CGRectMake(0, 0, kWidth, kHeight);
		self.backgroundColor = [UIColor clearColor];
		
		imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
	//	imageView.frame = CGRectMake(kBorder, kBorder, kWidth - 2 * kBorder, kWidth - 2 * kBorder);
      imageView.frame = CGRectMake(0, 0, 10, 10);  
        UIButton *profImgBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     //   [profImgBtn setImage:[UIImage imageNamed:[appDelegateObj.ImgArray objectAtIndex:appDelegateObj.count]] forState:UIControlStateNormal];
        profImgBtn.frame = CGRectMake(0, 0, 10, 10);
        
       // [profImgBtn setTag:appDelegateObj.count];
       // appDelegateObj.count++;
     //   [profImgBtn sendSubviewToBack:imageView];
        
        
//		UIImageView *imageViews = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"p3.png"]];
//		imageViews.frame = CGRectMake(kBorder+25, kBorder-10, (kWidth - 2 * kBorder)-50, (kWidth - 2 * kBorder)-40);
        [self addSubview:imageView];
		[self addSubview:profImgBtn];
        [self bringSubviewToFront:profImgBtn];
        
        
        [profImgBtn addTarget:self action:@selector(showViewParent:) forControlEvents:UIControlEventTouchUpInside];
		
	}
	
	else if([myAnnotation annotationType] == iCodeBlogAnnotationTypeTaco)
	{
		self = [super initWithAnnotation:myAnnotation reuseIdentifier:reuseIdentifier];
		self.frame = CGRectMake(0, 0, kWidth, kHeight);
		self.backgroundColor = [UIColor clearColor];
		imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
		//imageView.frame = CGRectMake(kBorder, kBorder, kWidth - 2 * kBorder, kWidth - 2 * kBorder);
       imageView.frame = CGRectMake(0, 0, 10, 10); 
        UIButton *profImgBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     //   [profImgBtn setImage:[UIImage imageNamed:@"p4.png"] forState:UIControlStateNormal];
        profImgBtn.frame = CGRectMake(0, 0, 10, 10);
        
      //  [profImgBtn setTag:appDelegateObj.count];
      //  appDelegateObj.count++;
    
      //  [profImgBtn sendSubviewToBack:imageView];
               
//		UIImageView *imageViews = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"p4.png"]];
//		imageViews.frame = CGRectMake(kBorder+25, kBorder-10, (kWidth - 2 * kBorder)-50, (kWidth - 2 * kBorder)-40);
        [self addSubview:imageView];
		[self addSubview:profImgBtn];
        [self bringSubviewToFront:profImgBtn];
        [profImgBtn addTarget:self action:@selector(showViewParent:) forControlEvents:UIControlEventTouchUpInside];
		
	}
	
	[imageView setContentMode:UIViewContentModeScaleAspectFill];
	
	return self;
}

-(void)setParentObj:(WhoGlueViewController*)obj{
    WhoGlueViewControllerObj=[[WhoGlueViewController alloc]init];
    WhoGlueViewControllerObj =obj;

}

-(IBAction)showViewParent:(id)sender{
    
    UIButton *btn = (UIButton*)sender;
    
    NSLog(@"%d",btn.tag);
    
    [WhoGlueViewControllerObj showView:btn.tag];

}
@end
