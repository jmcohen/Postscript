//
//  Connectivity.m
//  Postscript
//
//  Created by Jeremy Cohen on 7/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Connectivity.h"
#import "Reachability.h"

@implementation Connectivity

+ (BOOL) checkConnectivity {
    Reachability *internetReachable = [Reachability reachabilityForInternetConnection];        
    NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
    
    Reachability *hostReachable = [Reachability reachabilityWithHostname: @"parkpostscript.com"];
    NetworkStatus hostStatus = [hostReachable currentReachabilityStatus];
    
    if (internetStatus == NotReachable){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Internet Connection Error" message:@"Device could not connect to internet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
        
    } else if (hostStatus == NotReachable){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Host Connection Error" message:@"Device could not connect to host." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
        
    } else {
        return YES;
    } 
}

@end
