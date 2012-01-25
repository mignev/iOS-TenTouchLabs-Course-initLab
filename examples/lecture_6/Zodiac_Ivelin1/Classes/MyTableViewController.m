//
//  MyTableViewController.m
//  Zodiac
//
//  Created by Ivelin Georgiev on 1/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell.h"

#define kBackTag 1001

@implementation MyTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    	
	// tableContent = [[NSMutableArray alloc] initWithObjects:@"test 1", @"test 2", @"test 3", @"test 4", @"test 5",  @"test 6", @"test 7", @"test 8", @"test 9", @"test 10", @"test 11", nil];
		
	tableContent = [[NSMutableArray alloc] initWithArray:[UIFont familyNames] copyItems:YES];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Title" style:UIBarButtonItemStyleBordered target:self action:@selector(editTable:)];
    
    [self.navigationItem setRightBarButtonItem:addButton];
}


#pragma mark - Table view methods

-(void)editTable:(UIBarButtonItem *)sender
{
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [self.tableView setEditing:NO animated:NO];
        [self.tableView reloadData];
        [self.navigationItem.leftBarButtonItem setTitle:@"Edit"];
        [self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStylePlain];
    }
    else
    {
        [super setEditing:YES animated:YES];
        [self.tableView setEditing:YES animated:YES];
        [self.tableView reloadData];
        [self.navigationItem.leftBarButtonItem setTitle:@"Done"];
        [self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStyleDone];
        
    }
}

- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.editing == NO || ! indexPath) {
        return UITableViewCellEditingStyleNone;
    }
    
    if ( self.editing == YES && indexPath == 0) {
        return  UITableViewCellEditingStyleInsert;
    }
    else
    {
        return UITableViewCellEditingStyleDelete;
    }
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( editingStyle == UITableViewCellEditingStyleDelete )
    {
        [tableContent removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade ];
    }
    else
    {
        [tableContent insertObject:@"New table cell" atIndex:0];
        [tableView reloadData];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSString *item = [tableContent objectAtIndex:sourceIndexPath.row];
    [tableContent removeObject:item];
    [tableContent insertObject:item atIndex:destinationIndexPath.row];
    [item release];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.f;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
    return [tableContent count];
}

-(void)tableViewCellButtonPressed:(UIButton *)sender
{
    NSLog(@"%d", sender.tag);
}

// Customize the appearance of table view cells.
- (MyTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    NSInteger theRow = indexPath.row;
    
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[MyTableViewCell alloc] initWithFrame:CGRectZero] autorelease];

        cell.btnCell.tag = indexPath.row;
        
        [[cell btnCell] addTarget:self action:@selector(tableViewCellButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    }
    
    // Set up the cell...	
	
    if ( theRow % 2 )
    {
        cell.lblFontName.backgroundColor = [UIColor greenColor];
        cell.lblPointSize.backgroundColor = [UIColor purpleColor];
        cell.lblLineHeight.backgroundColor = [UIColor grayColor];
    }
    else
    {
        cell.lblFontName.backgroundColor = [UIColor redColor];
        cell.lblPointSize.backgroundColor = [UIColor orangeColor];
        cell.lblLineHeight.backgroundColor = [UIColor brownColor];
        
    }
    
	if ( theRow < [tableContent count] ) 
    {
        UIFont *myTmpFont = [UIFont fontWithName:[tableContent objectAtIndex:theRow] size:[UIFont systemFontSize]];
        cell.lblFontName.text = myTmpFont.fontName;
        cell.lblFontName.font = myTmpFont;
        cell.lblPointSize.text = [NSString stringWithFormat:@"Points: %.2f", myTmpFont.pointSize];
        cell.lblPointSize.font = myTmpFont;
        cell.lblLineHeight.text = [NSString stringWithFormat:@"LineHeight: %.2f", myTmpFont.lineHeight];
        cell.lblLineHeight.font = myTmpFont;
    }
	
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

