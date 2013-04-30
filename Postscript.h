//
//  Postscript.h
//  Postscript
//
//  Created by Jeremy Cohen on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Reachability;


@interface Postscript : NSObject {
    NSArray *sections;
}

@property (nonatomic, strong) NSArray *sections;


- (void) updateFromAddress: (NSString *) link;
- (NSArray *) sectionNames;

@end
