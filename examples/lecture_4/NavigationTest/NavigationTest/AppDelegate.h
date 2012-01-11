//
//  AppDelegate.h
//  NavigationTest
//
//  Created by Velislava Yanchina on 1/8/12.
//  Copyright (c) 2012 Bwin.party. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
     UINavigationController *navigationController;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) ViewController *viewController;

@end
