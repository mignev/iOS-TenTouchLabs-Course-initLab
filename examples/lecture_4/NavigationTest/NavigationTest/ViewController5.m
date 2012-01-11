//
//  ViewController5.m
//  NavigationTest
//
//  Created by Velislava Yanchina on 1/9/12.
//  Copyright (c) 2012 Bwin.party. All rights reserved.
//

#import "ViewController5.h"
#import "ViewController.h"

@interface  ViewController5 (privete) 
- (void)buttonClicked:(id)sender;
@end

@implementation ViewController5

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 200, 100, 30);
    btn.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    [btn setTitle:@"GoToView1" forState:UIControlStateNormal];
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
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
