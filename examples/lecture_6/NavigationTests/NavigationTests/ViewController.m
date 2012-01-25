//
//  ViewController.m
//  NavigationTests
//
//  Created by Dani Rangelov on 1/4/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import "ViewController.h"
#import "AnotherVC.h"

@implementation ViewController

#pragma mark - View lifecycle

- (void)dealloc {
	
    [copyListOfItems release];
	[tableContents release];
    
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	//Initialize the array.
	tableContents = [[NSMutableArray alloc] init];
	
	NSArray *contentOneArr = [NSArray arrayWithObjects:@"Apple", @"Barnes & Noble", @"Cisco", @"Dell", @"EVGA Corporation", @"Hewlett-Packard", @"Intel", nil];
	NSDictionary *contentOne = [NSDictionary dictionaryWithObject:contentOneArr forKey:@"trademarks"];
	
	NSArray *contentTwoArr = [NSArray arrayWithObjects:@"Acer", @"ASRock", @"Asus", @"MSI", nil];
	NSDictionary *contentTwo = [NSDictionary dictionaryWithObject:contentTwoArr forKey:@"trademarks"];
    
    NSArray *contentThreeArr = [NSArray arrayWithObjects:@"Nintendo", @"Panasonic", nil];
	NSDictionary *contentThree = [NSDictionary dictionaryWithObject:contentThreeArr forKey:@"trademarks"];
    
    NSArray *contentFourArr = [NSArray arrayWithObjects:@"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", nil];
	NSDictionary *contentFour = [NSDictionary dictionaryWithObject:contentFourArr forKey:@"trademarks"];
    
	[tableContents addObject:contentOne];
	[tableContents addObject:contentTwo];
    [tableContents addObject:contentThree];
    [tableContents addObject:contentFour];
	
    NSLog(@"tableContents = %@", tableContents);
    
	//Set the title
	self.navigationItem.title = @"Foxconn manufactures products";
    
    //Initialize the copy array.
	copyListOfItems = [[NSMutableArray alloc] init];
    
    searchBar = [[UISearchBar alloc] init];
    searchBar.placeholder = @"Type your search master";
    searchBar.tintColor = [UIColor blackColor];
    
    searchBar.delegate = self;
    
    [searchBar sizeToFit];
    searching= NO;
    
    [searchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [searchBar sizeToFit];
    
    self.tableView.tableHeaderView = searchBar;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	if (searching)
		return 1;
	else
		return [tableContents count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
	
	if(searching)
		return nil;
	
	NSMutableArray *tempArray = [[NSMutableArray alloc] init];
	[tempArray addObject:@"USA"];
	[tempArray addObject:@"JP"];
	[tempArray addObject:@"TW"];
	[tempArray addObject:@"Ot"];
    
	return tempArray;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	if(searching)
		return @"Search Results";
	
    switch (section) {
        case 0:
            return @"USA";
        case 1:
            return @"Taiwan";
        case 2:
            return @"Japan";
        default:
            return @"Other Countries";
    }
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	if (searching)
		return [copyListOfItems count];
	else {
		
		//Number of rows it should expect should be based on the section
		NSDictionary *dictionary = [tableContents objectAtIndex:section];
		NSArray *array = [dictionary objectForKey:@"trademarks"];
		return [array count];
	}
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
     NSLog(@"row = %@", indexPath);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	
	if(searching) 
		cell.textLabel.text = [copyListOfItems objectAtIndex:indexPath.row];
	else {
		
		//First get the dictionary object
		NSDictionary *dictionary = [tableContents objectAtIndex:indexPath.section];
		NSArray *array = [dictionary objectForKey:@"trademarks"];
		NSString *cellValue = [array objectAtIndex:indexPath.row];
		cell.textLabel.text = cellValue;
	}
    
    return cell;
}



#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//Get the selected element
	
	//NSDictionary *dictionary = [tableContents objectAtIndex:indexPath.section];
	//NSArray *array = [dictionary objectForKey:@"trademarks"];
	//NSString *selectedElement = [array objectAtIndex:indexPath.row];
	
    
	//Initialize the detail view controller and display it.
	AnotherVC *nextController = [[AnotherVC alloc] init];
	[self.navigationController pushViewController:nextController animated:YES];
	[nextController release];
	nextController = nil;
     
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	return UITableViewCellAccessoryDetailDisclosureButton;
	//return UITableViewCellAccessoryDisclosureIndicator;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	[self tableView:tableView didSelectRowAtIndexPath:indexPath];
}




#pragma mark -
#pragma mark Search Bar 

- (void) searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
	
	//This method is called again when the user clicks back from teh detail view.
	//So the overlay is displayed on the results, which is something we do not want to happen.
	if(searching)
		return;
	
	//Add the overlay view.
	if(searchController == nil)
		searchController = [[SearchVC alloc] init];
	
	CGFloat yaxis = self.navigationController.navigationBar.frame.size.height;
	CGFloat width = self.view.frame.size.width;
	CGFloat height = self.view.frame.size.height;
	
	//Parameters x = origion on x-axis, y = origon on y-axis.
	CGRect frame = CGRectMake(0, yaxis, width, height);
	searchController.view.frame = frame;	
	searchController.view.backgroundColor = [UIColor grayColor];
	searchController.view.alpha = 0.5;
	
	searchController.rvController = self;
	
	[self.tableView insertSubview:searchController.view aboveSubview:self.parentViewController.view];
	
	searching = YES;
	letUserSelectRow = NO;
	self.tableView.scrollEnabled = NO;
	
	//Add the done button.
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
											   initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
											   target:self action:@selector(doneSearching_Clicked:)] autorelease];
}

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
    
	//Remove all objects first.
	[copyListOfItems removeAllObjects];
	
	if([searchText length] > 0) {
		
		[searchController.view removeFromSuperview];
		searching = YES;
		letUserSelectRow = YES;
		self.tableView.scrollEnabled = YES;
		[self searchTableView];
	}
	else {
		
		[self.tableView insertSubview:searchController.view aboveSubview:self.parentViewController.view];
		
		searching = NO;
		letUserSelectRow = NO;
		self.tableView.scrollEnabled = NO;
	}
	
	[self.tableView reloadData];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
	
	[self searchTableView];
}

- (void) searchTableView {
	
	NSString *searchText = searchBar.text;
	NSMutableArray *searchArray = [[NSMutableArray alloc] init];
	
	for (NSDictionary *dictionary in tableContents)
	{
		NSArray *array = [dictionary objectForKey:@"trademarks"];
		[searchArray addObjectsFromArray:array];
	}
	
	for (NSString *sTemp in searchArray)
	{
		NSRange titleResultsRange = [sTemp rangeOfString:searchText options:NSCaseInsensitiveSearch];
		
		if (titleResultsRange.length > 0)
			[copyListOfItems addObject:sTemp];
	}
	
    NSLog(@"copyListOfItems = %@", copyListOfItems);
    
	[searchArray release];
	searchArray = nil;
}

- (void) doneSearching_Clicked:(id)sender {
	
	searchBar.text = @"";
	[searchBar resignFirstResponder];
	
	letUserSelectRow = YES;
	searching = NO;
	self.navigationItem.rightBarButtonItem = nil;
	self.tableView.scrollEnabled = YES;
	
	[searchController.view removeFromSuperview];
	[searchController release];
	searchController = nil;
	
	[self.tableView reloadData];
}


@end
