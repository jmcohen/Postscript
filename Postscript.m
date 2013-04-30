//
//  Postscript.m
//  Postscript
//
//  Created by Jeremy Cohen on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Postscript.h"
#import "AppDelegate.h"
#import "TBXML+HTTP.h"
#import "TBXML.h"
#import "Section.h"
#import "Favorites.h"
#import "Connectivity.h"

@implementation Postscript

@synthesize sections;

- (id) init {
    if (self = [super init]){
        sections = [[NSArray alloc] init];
    }
    return self;
}

- (void) updateFromAddress: (NSString *) link {
	if ([Connectivity checkConnectivity]){
        TBXMLSuccessBlock successBlock = ^(TBXML *xml) {
            TBXMLElement *article_list = xml.rootXMLElement;
            TBXMLElement *curSection = [TBXML childElementNamed:@"section" parentElement: article_list];
            NSMutableArray *newSections = [[NSMutableArray alloc] init];
            while (curSection){ 
                Section* section = [[Section alloc] initWithXMLElement: curSection];
                [newSections addObject: section];
                curSection = curSection->nextSibling;
            }
            self.sections = newSections;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"DownloadComplete" object:nil];
        };
        
        TBXMLFailureBlock failureBlock = ^(TBXML *tbxmlDocument, NSError * error) {
            NSLog(@"Error! %@ %@", [error localizedDescription], [error userInfo]);
        };
        
        [[TBXML alloc] initWithURL:[NSURL URLWithString: link] success:successBlock failure:failureBlock];
    }
}

- (NSArray *) sectionNames {
    NSMutableArray *names = [[NSMutableArray alloc] initWithCapacity: self.sections.count];
    for (Section *s in self.sections)
        [names addObject: s.sectionName];
    return names;
}


@end
