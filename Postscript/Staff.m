//
//  Staff.m
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Staff.h"
#import "TBXML+HTTP.h"

@implementation Staff

@synthesize titles, persons;

- (id) init
{
    if (self = [super init]){        
        titles = [NSMutableArray array];
        persons = [NSMutableArray array];
    }
    return self;
}

- (void) updateFromAddress: (NSString *) link {
    TBXMLSuccessBlock successBlock = ^(TBXML *xml) {
        TBXMLElement *masthead = xml.rootXMLElement;
        TBXMLElement *curTitle = [TBXML childElementNamed:@"title" parentElement: masthead];
        while (curTitle){
            NSString *titleString = [TBXML valueOfAttributeNamed:@"name" forElement:curTitle];
            NSMutableArray *titleHolders = [[NSMutableArray alloc] init];
            TBXMLElement *curPerson = [TBXML childElementNamed:@"person" parentElement:curTitle];
            while (curPerson){
                [titleHolders addObject: [TBXML valueOfAttributeNamed:@"name" forElement:curPerson]];
                curPerson = curPerson->nextSibling;
            }
            [titles addObject:titleString];
            [persons addObject:titleHolders];
            
            curTitle = curTitle->nextSibling;
        }
    };
    
    TBXMLFailureBlock failureBlock = ^(TBXML *xml, NSError * error){
        NSLog(@"Error: %@", [error description]);
    };
    
    [[TBXML alloc] initWithURL:[NSURL URLWithString:link] success:successBlock failure:failureBlock];

}

@end
