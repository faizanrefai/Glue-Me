//
//  MyrequestcellTheirs.h
//  glueme
//
//  Created by APPLE  on 10/14/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineRequest.h"
#import "AcceptRequest.h"

@interface MyrequestcellTheirs : UITableViewCell {
    AcceptRequest *acceptrequestObj;
    
    IBOutlet UILabel *NameLbl;
    IBOutlet UILabel *dateLbl;
    IBOutlet UILabel *timeLbl;
    IBOutlet UILabel *statusLbl;
    MineRequest *parentObj;
}

@property (nonatomic, retain) UILabel *statusLbl;
@property (nonatomic, retain)UILabel *timeLbl;
@property (nonatomic, retain)UILabel *NameLbl;
@property (nonatomic, retain)UILabel *dateLbl;
-(void)setParentObj:(MineRequest*)obj;

@end
