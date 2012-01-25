//
//  SearchVC.m
//  NavigationTests
//
//  Created by Dani Rangelov on 1/18/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import "SearchVC.h"
#import "ViewController.h"

@implementation SearchVC

@synthesize rvController;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
	[rvController doneSearching_Clicked:nil];
}


- (void)dealloc {
	[rvController release];
    [super dealloc];
}
@end
