//
//  BlueVC.m
//  NavigationTests
//
//  Created by Dani Rangelov on 1/4/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import "BlueVC.h"
#import "TestTableVC.h"
#import "TestCell.h"

@interface BlueVC (private)
-(void)buildControls;
@end

@implementation BlueVC

- (void)dealloc {
	
	[tableView release];
	[dataForMyTable release];
	[containerView release];
	
    [super dealloc];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapGesture.delegate = self;
    
    [self.view addGestureRecognizer:tapGesture];
    [tapGesture release];
    
    [self buildControls];
    
    NSString *viewContent = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://www.i-georgiev.net/zodiac.php"] encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@",viewContent);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (touch.view == self.view) return YES;
    return NO;
}

- (void)handleTapGesture:(UITapGestureRecognizer*)tap {
	
    NSLog(@"Return");
    
    //[self.navigationController popViewControllerAnimated:YES];
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
    TestTableVC *tableVC = [[TestTableVC alloc] init];
    [self.navigationController pushViewController:tableVC animated:YES];
    //[self presentModalViewController:tableVC animated:YES];
    [tableVC release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
    return YES;
}

#pragma mark -
#pragma mark View Methods

-(void)buildControls {
    
    UIImageView *bkImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    bkImage.center = self.view.center;
    bkImage.image = [UIImage imageNamed:@"iTunesArtwork"];
    bkImage.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    [self.view addSubview:bkImage];
    
    [bkImage release];
    
    
    CGRect tmpFrame = CGRectMake(10, 20, 300, 350);
    
	containerView = [[UIView alloc] initWithFrame:tmpFrame];
    containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight| UIViewAutoresizingFlexibleBottomMargin;
    
	tableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 0, containerView.frame.size.width - 10, containerView.frame.size.height) 
												   style: UITableViewStylePlain];
	tableView.delegate = self;
	tableView.dataSource = self;
	tableView.autoresizesSubviews = YES;
	tableView.backgroundColor = [UIColor clearColor];
	tableView.separatorColor = [UIColor lightGrayColor];
	tableView.scrollEnabled = YES;
	tableView.allowsSelection = YES;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    
	[containerView addSubview:tableView];
	
	//debug code
	//tableViewScores.backgroundColor = [UIColor darkGrayColor];
	//containerView.backgroundColor = [UIColor yellowColor];
		
	[self.view addSubview:containerView];
}

#pragma mark - Table view data source

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
    return [[UIFont familyNames] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 70;	
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
    NSInteger row = indexPath.row;
    
	TestCell *cell = (TestCell *)[aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[TestCell alloc] initWithFrame:CGRectZero] autorelease];	
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
    
    [[cell btnCell] addTarget:self action:@selector(tebleCellButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[cell btnCell].tag = row;
    //[[cell btnCell].titleLabel = [NSString stringWithFormat:@"Button %d", indexPath.row];
    
	//change label's text color
	if (row % 2) {
        cell.lblLineHeight.textColor    = [UIColor blackColor];
        cell.lblName.textColor          = [UIColor blackColor];
        cell.lblPointSize.textColor     = [UIColor blackColor];
    } else {
        cell.lblLineHeight.textColor    = [UIColor darkGrayColor];
        cell.lblName.textColor          = [UIColor darkGrayColor];
        cell.lblPointSize.textColor     = [UIColor darkGrayColor];
    }
    
    
    NSArray *fontFamilyNames = [UIFont familyNames];
    NSInteger fontsCount = [fontFamilyNames count];
    
	// Set up the cell…
	if (row < fontsCount) {
		UIFont *tmpFont         = [UIFont fontWithName:[fontFamilyNames objectAtIndex:row] size:[UIFont systemFontSize]];
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


@end
