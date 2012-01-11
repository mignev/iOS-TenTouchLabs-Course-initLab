//
//  ViewController4.m
//  NavigationTest
//
//  Created by Velislava Yanchina on 1/9/12.
//  Copyright (c) 2012 Bwin.party. All rights reserved.
//

#import "ViewController4.h"
#import "ViewController5.h"

@interface  ViewController4 (privete) 
- (void)buttonClicked:(id)sender;
@end

@implementation ViewController4

- (void)dealloc{
    [imageForScrolling release];
    [imageSV release];
    
    [super dealloc];
}

#pragma mark - View lifecycle


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    imageForScrolling = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Screen.png"]];
    
    imageSV = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 20, 200, 300)];
    imageSV.delegate = self;
    imageSV.bouncesZoom = YES;
    imageSV.backgroundColor = [UIColor blackColor];
	imageSV.showsHorizontalScrollIndicator = NO;
	imageSV.showsVerticalScrollIndicator = NO;
	imageSV.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
	imageSV.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
	imageSV.userInteractionEnabled = YES;
	imageSV.clearsContextBeforeDrawing = NO;
	imageSV.contentMode = UIViewContentModeCenter;
	imageSV.decelerationRate = .3;
	imageSV.opaque = YES;
    
    [imageSV addSubview:imageForScrolling];
    imageSV.contentSize = imageForScrolling.frame.size;
    
    [self.view addSubview:imageSV];

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 300, 100, 30);
    btn.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    [btn setTitle:@"GoToView5" forState:UIControlStateNormal];
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
    ViewController5 *vc1 = [[ViewController5 alloc]init];
    [self.navigationController pushViewController:vc1 animated:YES];
}

// Implement the UIScrollView delegate method so that it knows which view to scale when zooming.
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return imageForScrolling;
}

- (void)scrollViewDidScroll:(UIScrollView *)localScrollView {

}

- (void)scrollViewDidEndZooming:(UIScrollView *)localScrollView withView:(UIView *)view atScale:(float)scale {
	
}


@end
