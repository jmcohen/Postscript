//
//  Story.h
//  Postscript
//
//  Created by Jeremy Cohen on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"
@class Link;
@class ArticleViewController;

@interface Story : NSObject<NSURLConnectionDelegate> {
	NSString *headline;
	NSString *brief;
	UIImage *image;
	
	NSString *imageLink;
	Link *link;
	
	NSURLConnection* connection;
    NSMutableData* data;
}

@property (nonatomic, strong) NSString *headline;
@property (nonatomic, strong) NSString *brief;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) Link *link;
@property (nonatomic, strong) NSString *imageLink;

- (id) initWithXML: (TBXMLElement *) storyElement;
- (void)loadImageFromURL:(NSURL*)url;
- (NSString *) toXML;

@end
