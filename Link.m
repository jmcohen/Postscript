//
//  Link.m
//  Postscript
//
//  Created by Jeremy Cohen on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Link.h"
#import "TBXML.h"


@implementation Link

@synthesize year;
@synthesize month;
@synthesize section;
@synthesize idString;

- (id) initWithXML: (TBXMLElement *) linkElement {
	if (self = [super init]){		
		year = [TBXML valueOfAttributeNamed:@"year" forElement:linkElement];
		month = [TBXML valueOfAttributeNamed:@"month" forElement:linkElement];
		section = [TBXML valueOfAttributeNamed:@"section" forElement:linkElement];
		idString = [TBXML valueOfAttributeNamed:@"id" forElement:linkElement];
	}
	return self;
}

- (NSString *) toXML {
    return [NSString stringWithFormat:@"<link year='%@' month='%@' section='%@' id='%@' />", year, month, section, idString];
}

- (NSString *) xmlLink {
	return [NSString stringWithFormat:@"http://www.parkpostscript.com/%@/%@/%@/%@.xml", year, month, section, idString];
}

- (NSString *) iPhoneArticleLink {
	return [NSString stringWithFormat:@"http://www.parkpostscript.com/iphone/article_iphone.php?year=%@&month=%@&section=%@&id=%@", year, month, section, idString];

}

- (NSString *) webArticleLink{
	return [NSString stringWithFormat:@"http://www.parkpostscript.com/article_web.php?year=%@&month=%@&section=%@&id=%@", year, month, section, idString];
}


@end
