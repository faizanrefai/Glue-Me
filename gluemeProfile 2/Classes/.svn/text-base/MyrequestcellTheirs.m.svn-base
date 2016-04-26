//
//  MyrequestcellTheirs.m
//  glueme
//
//  Created by APPLE  on 10/14/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import "MyrequestcellTheirs.h"


@implementation MyrequestcellTheirs

@synthesize NameLbl,timeLbl,dateLbl,statusLbl;




-(void)awakeFromNib
{
    
    
    NSDate *currentDate = [NSDate date];
    
    //    NSLog(@"%@",currentDate);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSLog(@"%@",currentDate);
    
    
    
    NSDateFormatter *formatterTime = [[NSDateFormatter alloc] init];
    [formatterTime setDateFormat:@"HH:MM"];
    
    timeLbl.text = [formatterTime stringFromDate:currentDate];
    dateLbl.text = [formatter stringFromDate:currentDate];
    
    
}





- (void)dealloc
{
    [statusLbl release];
    [timeLbl release];
    [dateLbl release];
    [NameLbl release];
    [super dealloc];
}

-(void)setParentObj:(MineRequest*)obj{
	parentObj =obj;
}
@end
