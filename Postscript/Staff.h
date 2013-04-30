//
//  Staff.h
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Staff : NSObject{
    NSMutableArray *titles;
    NSMutableArray *persons;
}

@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *persons;

- (void) updateFromAddress: (NSString *) link;

@end
