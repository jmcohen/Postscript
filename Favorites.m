//
//  Favorites.m
//  Postscript
//
//  Created by Jeremy Cohen on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Favorites.h"
#import "Story.h"
#import "Section.h"
#import "TBXML.h"


@implementation Favorites

+ (NSString *) pathWithFilename: (NSString *) filename {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [NSString stringWithFormat: @"%@/%@", documentsDirectory, filename];
    return path;
}

+ (void) saveFavorites: (Section *) section  {
    NSString *xmlString = @"<section section_name='Favorites'>";
    for (Story *story in section.stories)
        xmlString = [xmlString stringByAppendingString: [story toXML]]; 
    xmlString = [xmlString stringByAppendingString: @"</section>"];
    
    [xmlString writeToFile:[Favorites pathWithFilename: @"favorites.xml"] atomically:YES encoding:NSUTF8StringEncoding error:NULL];
}

+ (Section *) loadFavorites {
    NSString *path = [Favorites pathWithFilename: @"favorites.xml"];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath: path];
    if (fileExists){
        NSString *xmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL]; 
        TBXML *xml = [[TBXML alloc] initWithXMLString: xmlString error: NULL];
        TBXMLElement *sectionElement = xml.rootXMLElement;
        Section *favoritesSection = [[Section alloc] initWithXMLElement: sectionElement];
        return favoritesSection;
    } else {
        return [[Section alloc] initWithSectionName:@"Favorites"];
    }
}

+ (void) addFavorite:(Story *)favorite {
    Section *favoritesSection = [Favorites loadFavorites];
    [favoritesSection.stories addObject:favorite];
    [Favorites saveFavorites:favoritesSection];
}


@end
