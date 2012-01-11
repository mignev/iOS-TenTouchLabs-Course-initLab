//
//  ViewController2.m
//  NavigationTest
//
//  Created by Velislava Yanchina on 1/9/12.
//  Copyright (c) 2012 Bwin.party. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"

@interface  ViewController2 (privete) 
- (void)buttonClicked:(id)sender;
@end

@implementation ViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 200, 100, 30);
    btn.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    [btn setTitle:@"GoToView3" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [btn release];

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)buttonClicked:(id)sender {
    NSLog(@"Button Clicked");
    ViewController3 *vc1 = [[ViewController3 alloc]init];
    [self.navigationController pushViewController:vc1 animated:YES];
}

@end
