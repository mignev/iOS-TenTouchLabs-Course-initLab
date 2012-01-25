//
//  SearchVC.h
//  NavigationTests
//
//  Created by Dani Rangelov on 1/18/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface SearchVC : UIViewController {
    
	ViewController *rvController;
}

@property (nonatomic, retain) ViewController *rvController;


@end
