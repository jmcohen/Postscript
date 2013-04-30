//
//  AppDelegate.m
//  Postscript
//
//  Created by Jeremy Cohen on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "Postscript.h"
#import "Staff.h"
#import "ASIFormDataRequest.h"
#import "PostscriptViewController.h"
#import "SectionViewController.h"
#import "AboutViewController.h"
#import "Favorites.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize staff, textFontSize;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
    (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
      
    textFontSize = 100;
    
    //TODO: make staff a singleton class
    self.staff = [[Staff alloc] init];
    [self.staff updateFromAddress:@"http://www.parkpostscript.com/iphone/masthead.xml"];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    NSURL *url = [NSURL URLWithString:@"http://www.parkpostscript.com/iphone/add_device.php"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request addPostValue:deviceToken forKey:@"device_token"];
    [request startSynchronous];
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error{
	NSLog(@"Failed to get token, error: %@", error);
}

- (void) makeTextFontSizeBigger {
	self.textFontSize += 25;
	if (self.textFontSize > 200)
		self.textFontSize = 200;
}

- (void) makeTextFontSizeSmaller {
	self.textFontSize -= 25;
	if (self.textFontSize < 75)
		self.textFontSize = 75;
}


// TODO: MAKE THIS A CATEGORY OF UICOLOR!
+ (UIColor *) postscriptColor {
    return [UIColor colorWithRed:0 green:.4 blue:.275 alpha:1];
}

@end
