//
//  Story.m
//  Postscript
//
//  Created by Jeremy Cohen on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Story.h"
#import "TBXML.h"
#import "Link.h"

@implementation Story

@synthesize headline;
@synthesize brief;
@synthesize link;
@synthesize imageLink;
@synthesize image;

- (id) initWithXML: (TBXMLElement *) element {
	if (self = [super init]){
		
		TBXMLElement *headlineElement = [TBXML childElementNamed:@"headline" parentElement:element];
		if (headlineElement)
			headline = [TBXML textForElement:headlineElement];
		
		TBXMLElement *briefElement = [TBXML childElementNamed:@"brief" parentElement:element];
		if (briefElement)
			brief = [TBXML textForElement:briefElement];
		
		TBXMLElement *linkElement = [TBXML childElementNamed:@"link" parentElement:element];
		if (linkElement)
			link = [[Link alloc] initWithXML: linkElement];
		
		TBXMLElement *imageLinkElement = [TBXML childElementNamed:@"image" parentElement:element];
		if (imageLinkElement)
			imageLink = [TBXML valueOfAttributeNamed:@"url" forElement:imageLinkElement];
		
		if (imageLink){
			[self loadImageFromURL: [NSURL URLWithString: imageLink]];
		}
	}
	return self;
}

- (void)loadImageFromURL:(NSURL*)url {
    NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    [connection scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [connection start];
}


- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {
    if (data==nil) {
		data = [[NSMutableData alloc] initWithCapacity:2048];
    }
    [data appendData:incrementalData];
}

- (void) connection:(NSURLConnection *)theConnection didFailWithError:(NSError *)error{
}

- (void) connection:(NSURLConnection *) theConnection didReceiveResponse:(NSURLResponse *)response {
}

- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
    connection=nil;
	self.image = [UIImage imageWithData:data];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"ImageDidLoad" object:self];
    data=nil;
}

- (NSString *) imageXML {
    if (imageLink)
        return [NSString stringWithFormat:@"<link file='%@'", imageLink];
    return @"";
}

- (NSString *) toXML {
    NSString *xml = [NSString stringWithString:@"<story>"];
    if (headline)
        xml = [xml stringByAppendingFormat: @"<headline>%@</headline>", self.headline];
    if (brief)
        xml = [xml stringByAppendingFormat: @"<brief>%@</brief>", self.brief];
    if (imageLink)
        xml = [xml stringByAppendingFormat: @"<image url='%@' />", self.imageLink];
    if (link)
        xml = [xml stringByAppendingString: [self.link toXML]];
    xml = [xml stringByAppendingString: @"</story>"];
    return xml;
}

@end
