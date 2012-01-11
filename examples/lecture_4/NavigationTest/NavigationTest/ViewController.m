//
//  ViewController.m
//  NavigationTest
//
//  Created by Velislava Yanchina on 1/8/12.
//  Copyright (c) 2012 Bwin.party. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface  ViewController (privete) 
- (void)buttonClicked:(id)sender;
- (void)sliderTouched:(id)sender;
- (void)sliderValueChanged:(id)sender;
@end

@implementation ViewController

float rc, gc, bc;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UISlider *slider1 = [[UISlider alloc] initWithFrame:CGRectMake(30, 60, 200, 50)];
    slider1.tag = 10001;
    slider1.maximumValue = 1.0;
    slider1.value = 0.0;
    [slider1 addTarget:self action:@selector(sliderTouched:) forControlEvents:UIControlEventTouchUpInside];
    [slider1 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider1];
    
    [slider1 release];
    
    UISlider *slider2 = [[UISlider alloc] initWithFrame:CGRectMake(30, 100, 200, 50)];
    slider2.tag = 10002;
    slider2.maximumValue = 1.0;
    slider2.value = 0.0;
    [slider2 addTarget:self action:@selector(sliderTouched:) forControlEvents:UIControlEventTouchUpInside];
    [slider2 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider2];
    
    [slider2 release];
    
    UISlider *slider3 = [[UISlider alloc] initWithFrame:CGRectMake(30, 140, 200, 50)];
    slider3.tag = 10003;
    slider3.maximumValue = 1.0;
    slider3.value = 0.0;
    [slider3 addTarget:self action:@selector(sliderTouched:) forControlEvents:UIControlEventTouchUpInside];
    [slider3 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider3];
    
    [slider3 release];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 200, 100, 30);
    btn.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    [btn setTitle:@"GoToView2" forState:UIControlStateNormal];
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)sliderTouched:(id)sender {
    NSLog(@"Slider Touched"); //what is DLog?
}

- (void)sliderValueChanged:(UISlider*)sender {
    NSLog(@"Slider Value Changed :%f", sender.value);
    
    if (sender.tag == 10001) {
        self.view.backgroundColor = [UIColor colorWithRed:sender.value green:gc blue:bc alpha:0.5];
        rc = sender.value;
        NSLog(@"red color :%f", rc);
    } 
    if (sender.tag == 10002) {
        self.view.backgroundColor = [UIColor colorWithRed:rc green:sender.value blue:bc  alpha:0.5];
        gc = sender.value;
        NSLog(@"green color :%f", gc);
    } 
    if (sender.tag == 10003) {
        self.view.backgroundColor = [UIColor colorWithRed:rc green:gc blue:sender.value alpha:0.5];
        bc = sender.value;
        NSLog(@"blue color :%f", bc);
    } 

    //[self.view setNeedsDisplay];
}

- (void)buttonClicked:(id)sender {
    NSLog(@"Button Clicked");
    ViewController2 *vc1 = [[ViewController2 alloc]init];
    [self.navigationController pushViewController:vc1 animated:YES];
}


@end
