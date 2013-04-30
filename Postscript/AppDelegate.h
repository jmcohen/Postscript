//
//  AppDelegate.h
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Staff;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    Staff *staff;
    NSInteger textFontSize;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Staff *staff;
@property (nonatomic) NSInteger textFontSize;

- (void) makeTextFontSizeBigger;
- (void) makeTextFontSizeSmaller;
+ (UIColor *) postscriptColor;

@end
