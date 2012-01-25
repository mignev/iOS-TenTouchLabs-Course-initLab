//
//  ZodiacAppDelegate.m
//  Zodiac
//
//  Created by Ivelin Georgiev on 1/18/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "ZodiacAppDelegate.h"
#import "RootViewController.h"


@implementation ZodiacAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end