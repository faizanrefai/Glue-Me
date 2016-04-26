//
//  InAppPurchaseView.h
//  glueme
//
//  Created by APPLE apple on 1/18/12.
//  Copyright (c) 2012 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h> 

@interface InAppPurchaseView : UIViewController<SKProductsRequestDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *productIdentifierList;  
     NSMutableArray *productDetailsList;  
     IBOutlet UITableView *productDisplayTableView; 
}

@property(nonatomic, retain) NSMutableArray *productIdentifierList;  
@property(nonatomic, retain) NSMutableArray *productDetailsList;  
@property(nonatomic, retain) UITableView *productDisplayTableView; 

@end
