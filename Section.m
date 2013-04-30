//
//  Section.m
//  Postscript
//
//  Created by Jeremy Cohen on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Story.h"
#import "Section.h"
#import "TBXML.h"
#import "Link.h"

@implementation Section

@synthesize sectionName;
@synthesize stories;

- (id) initWithSectionName: (NSString *) theSectionName {
    if (self = [super init]){
        sectionName = theSectionName;
    }
    return self;
}

- (id) initWithXMLElement: (TBXMLElement *) element {
	if (self = [super init]){
		sectionName = [TBXML valueOfAttributeNamed:@"section_name" forElement: element];
		stories = [[NSMutableArray alloc] init];
		
		TBXMLElement *curStory = [TBXML childElementNamed:@"story" parentElement:element];
		
		while (curStory != nil){ 
			Story *story = [[Story alloc] initWithXML: curStory]; 
			[stories addObject:story];
			curStory = curStory->nextSibling;
		}	
	}
	return self;
}

@end
