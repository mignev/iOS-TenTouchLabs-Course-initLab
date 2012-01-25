//
//  ZodiacAppDelegate.h
//  Zodiac
//
//  Created by Ivelin Georgiev on 1/18/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

@interface ZodiacAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

