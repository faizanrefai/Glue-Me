//
//  MKStoreObserver.m
//
//  Created by Mugunth Kumar on 17-Oct-09.
//  Copyright 2009 Mugunth Kumar. All rights reserved.
//

#import "MKStoreObserver.h"
#import "MKStoreManager.h"

@implementation MKStoreObserver
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
	for (SKPaymentTransaction *transaction in transactions)
	{
		switch (transaction.transactionState)
		{
			case SKPaymentTransactionStatePurchased:
				
                [self completeTransaction:transaction];
				
                break;
				
            case SKPaymentTransactionStateFailed:
				
                [self failedTransaction:transaction];
				
                break;
				
            case SKPaymentTransactionStateRestored:
				
                [self restoreTransaction:transaction];
				
            default:
				
                break;
		}			
	}
}

- (void) failedTransaction: (SKPaymentTransaction *)transaction
{	
    if (transaction.error.code != SKErrorPaymentCancelled)		
    {		
        // Optionally, display an error here.
		NSLog(@"failllll");
		NSLog(@"%@",[transaction.error description]);

    }	
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];	
}

- (void) completeTransaction: (SKPaymentTransaction *)transaction
{		
	
	appDelegate=(gluemeAppDelegate*)[[UIApplication sharedApplication]delegate];
	NSInteger InAppToken = [[NSUserDefaults standardUserDefaults] integerForKey:@"InAppToken"];
	InAppToken = InAppToken + 5;
	[[NSUserDefaults standardUserDefaults] setInteger:InAppToken forKey:@"InAppToken"];
	[[NSUserDefaults standardUserDefaults] synchronize];
//	NSLog(@"Success:%d",[[NSUserDefaults standardUserDefaults] integerForKey:@"InAppToken"]);
    [[MKStoreManager sharedManager] provideContent: transaction.payment.productIdentifier shouldSerialize:YES];	
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
//	if([[[ComeGetMeAppDelegate getGlobalInfo]valueForKey:@"Purchase"]isEqualToString:@"1"]){
//		
//		[[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"Chapter1"];
//		[[NSUserDefaults standardUserDefaults] synchronize];
//		NSLog(@"purchaseeeeeee");
////		[appDelegate pushview];
//				
//	}
//	else if([[[ComeGetMeAppDelegate getGlobalInfo]valueForKey:@"Purchase"]isEqualToString:@"2"]){
//		
//		[[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"Chapter2"];
//		[[NSUserDefaults standardUserDefaults] synchronize];
//		NSLog(@"purchaseeeeeee");
//		
////		[appDelegate pushview];
//	}
	
//	else if([[[ComeGetMeAppDelegate getGlobalInfo]valueForKey:@"Purchase"]isEqualToString:@"3"]){
//		
//		[[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"TheLoveCopPro"];
//		[[NSUserDefaults standardUserDefaults] synchronize];
//		NSLog(@"purchaseeeeeee");
//		
/////		[appDelegate pushview];
//	}
}

- (void) restoreTransaction: (SKPaymentTransaction *)transaction
{	
	NSLog(@"purchaseeeeeee");
    [[MKStoreManager sharedManager] provideContent: transaction.originalTransaction.payment.productIdentifier shouldSerialize:YES];	
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];	
}

@end
