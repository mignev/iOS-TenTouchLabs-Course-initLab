//
//  BlueVC.h
//  NavigationTests
//
//  Created by Dani Rangelov on 1/4/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlueVC : UIViewController <UIGestureRecognizerDelegate, UITableViewDelegate, UITableViewDataSource> {
    
	UITableView		*tableView;
	NSMutableArray	*dataForMyTable;

	UIView			*containerView;
}

@end
