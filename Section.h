//
//  Section.h
//  Postscript
//
//  Created by Jeremy Cohen on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"

@interface Section : NSObject {
	NSString *sectionName;
	NSMutableArray *stories;
}

@property (nonatomic, strong) NSString *sectionName;
@property (nonatomic, strong) NSMutableArray *stories;

- (id) initWithSectionName: (NSString *) sectionName;
- (id) initWithXMLElement: (TBXMLElement *) element;

@end
