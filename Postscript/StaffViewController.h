//
//  StaffViewController.h
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Staff;

@interface StaffViewController : UITableViewController {
    Staff *staff;
}

@property (nonatomic, strong) Staff *staff;

@end
