//
//  MyTableViewController.h
//  Zodiac
//
//  Created by Ivelin Georgiev on 1/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate> {

	NSMutableArray *tableContent;
	
}

@end
