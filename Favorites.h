//
//  Favorites.h
//  Postscript
//
//  Created by Jeremy Cohen on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Story;
@class Section;

@interface Favorites : NSObject {
    
}

+ (NSString *) pathWithFilename: (NSString *) filename;
+ (void) saveFavorites: (Section *) stories;
+ (Section *) loadFavorites;
+ (void) addFavorite: (Story *) favorite;

@end
