//
//  MyTableViewController.m
//  Zodiac
//
//  Created by Ivelin Georgiev on 1/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MyTableViewController.h"

#define kBackTag 1001

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// tableContent = [[NSMutableArray alloc] initWithObjects:@"test 1", @"test 2", @"test 3", @"test 4", @"test 5",  @"test 6", @"test 7", @"test 8", @"test 9", @"test 10", @"test 11", nil];
		
	tableContent = [[NSMutableArray alloc] init];
	
	NSArray *contentOneArr = [NSArray arrayWithObjects:@"Apple", @"Barnes & Noble", @"Cisco", @"Dell", @"EVGA Corporation", @"Hewlett-Packard", @"Intel", nil];
	NSDictionary *contentOne = [NSDictionary dictionaryWithObject:contentOneArr forKey:@"trademarks"];
	
	NSArray *contentTwoArr = [NSArray arrayWithObjects:@"Acer", @"ASRock", @"Asus", @"MSI", nil];
	NSDictionary *contentTwo = [NSDictionary dictionaryWithObject:contentTwoArr forKey:@"trademarks"];
    
    NSArray *contentThreeArr = [NSArray arrayWithObjects:@"Nintendo", @"Panasonic", nil];
	NSDictionary *contentThree = [NSDictionary dictionaryWithObject:contentThreeArr forKey:@"trademarks"];
    
    NSArray *contentFourArr = [NSArray arrayWithObjects:@"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", @"Philips", @"Samsung", nil];
	NSDictionary *contentFour = [NSDictionary dictionaryWithObject:contentFourArr forKey:@"trademarks"];
    
	[tableContent addObject:contentOne];
	[tableContent addObject:contentTwo];
    [tableContent addObject:contentThree];
    [tableContent addObject:contentFour];
	
}


#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [tableContent count];
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	NSDictionary *dict = [tableContent objectAtIndex:section];
	NSArray *array = [dict objectForKey:@"trademarks"];
	
    return [array count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	
	
	NSDictionary *dict = [tableContent objectAtIndex:indexPath.section];
	NSArray *array = [dict objectForKey:@"trademarks"];
	cell.textLabel.text = [array objectAtIndex:indexPath.row];
	
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

	switch (section) {
		case 0:
			return @"USA";
		case 1:
			return @"Taiwan";
		case 2:
			return @"Japan";
		default:
			return @"Other countries";
	}
	
}

- (void)dealloc {
	[tableContent release];
    [super dealloc];
}


@end

