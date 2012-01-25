//
//  TestTableVC.m
//  NavigationTests
//
//  Created by Dani Rangelov on 1/15/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import "TestTableVC.h"
#import "TestCell.h"


@implementation TestTableVC
-(void)dealloc { 
    [myTableContent release];
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        myTableContent = [[NSMutableArray alloc] initWithArray:[UIFont familyNames]copyItems:YES];
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:self action:@selector(EditTable:)];
	[self.navigationItem setRightBarButtonItem:addButton];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (void) EditTable:(id)sender
{
	if(self.editing)
	{
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [myTableContent count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 100;	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
    NSInteger row = indexPath.row;
    
    NSLog(@"row = %d", row);
    
	TestCell *cell = (TestCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[TestCell alloc] initWithFrame:CGRectZero] autorelease];	
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
    
    [[cell btnCell] addTarget:self action:@selector(tebleCellButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[cell btnCell].tag = row;
    
	//change label's text color
	if (row % 2) {
        cell.lblLineHeight.textColor    = [UIColor blackColor];
        cell.lblName.textColor          = [UIColor blackColor];
        cell.lblPointSize.textColor     = [UIColor blackColor];
    } else {
        cell.lblLineHeight.textColor    = [UIColor redColor];
        cell.lblName.textColor          = [UIColor redColor];
        cell.lblPointSize.textColor     = [UIColor redColor];
    }

    NSInteger fontsCount = [myTableContent count];
    
	// Set up the cell…
	if (row < fontsCount) {
		UIFont *tmpFont         = [UIFont fontWithName:[myTableContent objectAtIndex:row] size:[UIFont systemFontSize]];
		cell.lblName.font       = tmpFont;
        cell.lblPointSize.font  = tmpFont;
        cell.lblLineHeight.font = tmpFont;
        
        cell.lblName.text       = tmpFont.fontName;
        cell.lblPointSize.text  = [NSString stringWithFormat:@"PointS: %.2f", tmpFont.pointSize];
        cell.lblLineHeight.text = [NSString stringWithFormat:@"LineH: %.2f", tmpFont.lineHeight];
	} 
    
	return cell;
}

- (void)tebleCellButtonPressed:(id)sender {
    UIButton *tmpButton = (UIButton*)sender;
    
    NSLog(@"sender = %d", tmpButton.tag);
}




- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // No editing style if not editing or the index path is nil.
    if (self.editing == NO || !indexPath) return UITableViewCellEditingStyleNone;
    // Determine the editing style based on whether the cell is a placeholder for adding content or already 
    // existing content. Existing content can be deleted.    
    if (self.editing && indexPath.row == ([myTableContent count] - 1)) 
	{
		return UITableViewCellEditingStyleInsert;
	} else 
	{
		return UITableViewCellEditingStyleDelete;
	}
    return UITableViewCellEditingStyleNone;
}
 

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [myTableContent removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        [myTableContent insertObject:@"NEW Row" atIndex:[myTableContent count]];
        [tableView reloadData];
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSString *item = [[myTableContent objectAtIndex:fromIndexPath.row] retain];
	[myTableContent removeObject:item];
	[myTableContent insertObject:item atIndex:toIndexPath.row];
	[item release];
    
    
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    
    if ([[tableView cellForRowAtIndexPath:indexPath] accessoryType] == UITableViewCellAccessoryCheckmark) {
        [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryNone];
    } else {
        [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
}

@end
