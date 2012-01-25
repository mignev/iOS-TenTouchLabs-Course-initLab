//
//  AnotherVC.h
//  NavigationTests
//
//  Created by Dani Rangelov on 1/4/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomView;

@interface AnotherVC : UIViewController <UIGestureRecognizerDelegate> {
    CustomView *containerView;
}


@property(nonatomic, copy, getter = anotherGetter) NSString *myString;

@end
