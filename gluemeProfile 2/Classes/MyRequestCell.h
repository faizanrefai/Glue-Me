//
//  MyRequestCell.h
//  glueme
//
//  Created by APPLE  on 9/20/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineRequest.h"
#import "AcceptRequest.h"

@class MineRequest,AcceptRequest;
@interface MyRequestCell : UITableViewCell {
    
    AcceptRequest *acceptrequestObj;
    
    IBOutlet UILabel *NameLbl;
    IBOutlet UILabel *dateLbl;
    IBOutlet UILabel *timeLbl;
    IBOutlet UILabel *statusLbl;
    MineRequest *parentObj;
//    IBOutlet UIButton *RejectBtn;
//    IBOutlet UIButton *AcceptBtn;
//    IBOutlet UIButton *blockBtn;
   
	}

//@property (nonatomic,retain)  UIButton *AcceptBtn;
//@property (nonatomic, retain) UIButton *RejectBtn;
//@property (nonatomic, retain) UIButton *blockBtn;
@property (nonatomic, retain) UILabel *statusLbl;
@property (nonatomic, retain)UILabel *timeLbl;
@property (nonatomic, retain)UILabel *NameLbl;
@property (nonatomic, retain)UILabel *dateLbl;
-(void)setParentObj:(MineRequest*)obj;


@end
