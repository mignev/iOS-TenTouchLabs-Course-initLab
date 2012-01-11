//
//  ViewController3.m
//  NavigationTest
//
//  Created by Velislava Yanchina on 1/9/12.
//  Copyright (c) 2012 Bwin.party. All rights reserved.
//

#import "ViewController3.h"
#import "ViewController4.h"

@interface  ViewController3 (privete) 
- (void)buttonClicked:(id)sender;
@end

@implementation ViewController3

- (void)dealloc{
    [sldrCustom release];
    [lblSlider release];
    
    [super dealloc];
}
#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 200, 100, 30);
    btn.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    [btn setTitle:@"GoToView4" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [btn release];
    
    
    UIColor *settingsLabelBackground = [UIColor clearColor];
    UIFont *settingsLabelFont = [UIFont fontWithName:@"MarkerFelt-Thin" size:18];
    NSInteger trackCapWidth = 10;
    //Slider prefs
    CGRect frame = CGRectMake(50, 100, 240, 52);
    CGRect thumb = CGRectMake(0, 0, 35, 35);
    
    
    //LABEL Music Volume
    lblSlider = [[UILabel alloc] initWithFrame:frame];
    lblSlider.center = CGPointMake(lblSlider.center.x, lblSlider.center.y - 30);
    lblSlider.text = @"Initial Value"; //default text
    lblSlider.font = settingsLabelFont;
    //label2.textColor = settingsLabelColor;
    lblSlider.textAlignment = UITextAlignmentCenter;
    lblSlider.backgroundColor = settingsLabelBackground;
    
    
    sldrCustom = [[UISlider alloc] initWithFrame:frame];
    
    //custom slider appearance
    sldrCustom.backgroundColor = settingsLabelBackground;	
    UIImage *stetchLeftTrackfx = [[UIImage imageNamed:@"dark_blue_slider.png"]
                                  stretchableImageWithLeftCapWidth:trackCapWidth topCapHeight:0];
    UIImage *stetchRightTrackfx = [[UIImage imageNamed:@"bright_blue_slider.png"]
                                   stretchableImageWithLeftCapWidth:trackCapWidth topCapHeight:0];
    [sldrCustom setThumbImage: [UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    [sldrCustom setMinimumTrackImage:stetchLeftTrackfx forState:UIControlStateNormal];
    [sldrCustom setMaximumTrackImage:stetchRightTrackfx forState:UIControlStateNormal];
    [sldrCustom thumbRectForBounds: thumb trackRect: frame value: sldrCustom.value];
    
    //custom slider preferences
    [sldrCustom addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    sldrCustom.minimumValue = 0.0;
    sldrCustom.maximumValue = 1.0;
    sldrCustom.continuous = YES;
    sldrCustom.value = 0.5;
    
    [self.view addSubview:sldrCustom];
    [self.view addSubview:lblSlider];

}

-(void)sliderChanged:(id)sender {
	//check which slider is sender of the event
	if (sender == sldrCustom) {
		lblSlider.text = [NSString stringWithFormat:@"Value = %d", (int)(sldrCustom.value*100)];
	}
}

- (void)buttonClicked:(id)sender {
    NSLog(@"Button Clicked");
    ViewController4 *vc1 = [[ViewController4 alloc]init];
    [self.navigationController pushViewController:vc1 animated:YES];
}

@end
