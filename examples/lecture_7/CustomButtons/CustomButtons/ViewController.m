//
//  ViewController.m
//  CustomButtons
//
//  Created by Dobromir Minchev on 2/1/12.
//  Copyright (c) 2012 dobri87@gmail.com. All rights reserved.
//

#import "ViewController.h"
#import "MyStepper.h"
#import "Consts.h"

@implementation ViewController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *bgImgMain = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    bgImgMain.frame = self.view.frame;
    
    [self.view addSubview:bgImgMain];
    
    MyStepper *testStepper = [[MyStepper alloc] initWithFrame:CGRectMake(10, 50, 300, 50)];
    [self.view addSubview:testStepper];
    
    lblNotification = [[UILabel alloc] initWithFrame:CGRectMake(10, 140, 300, 30)];
    lblNotification.text = [NSString stringWithFormat:@"Y U NO CHANGE..."];
    lblNotification.backgroundColor = [UIColor clearColor];
    lblNotification.textColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleStepperValueChanged:) name:NotificationStepperChanged object:nil];
    
    [self.view addSubview:lblNotification];
    
    [testStepper release];
    [bgImgMain release];
    [lblNotification release];
}

- (void)handleStepperValueChanged:(NSNotification*)notification
{
    CGFloat value = [(NSNumber*)[notification.userInfo objectForKey:@"value"] floatValue];
    lblNotification.text = [NSString stringWithFormat:@"Recieved notification %.2f", value];
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

@end
