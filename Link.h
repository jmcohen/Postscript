//
//  Link.h
//  Postscript
//
//  Created by Jeremy Cohen on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"

@interface Link : NSObject {
	NSString *year;
	NSString *month;
	NSString *section;
	NSString *idString;
}

- (id) initWithXML:(TBXMLElement *)element;
- (NSString *) toXML;
- (NSString *) xmlLink;
- (NSString *) iPhoneArticleLink;
- (NSString *) webArticleLink;

@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSString *section;
@property (nonatomic, strong) NSString *idString;

@end
