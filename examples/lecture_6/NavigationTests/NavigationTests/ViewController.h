//
//  ViewController.h
//  NavigationTests
//
//  Created by Dani Rangelov on 1/4/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchVC.h"

@interface ViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate> {
    NSMutableArray *tableContents;
    NSMutableArray *copyListOfItems;
    UISearchBar *searchBar;
    BOOL searching;
    BOOL letUserSelectRow;
    
    SearchVC *searchController;
}


- (void) searchTableView;
- (void) doneSearching_Clicked:(id)sender;

@end
