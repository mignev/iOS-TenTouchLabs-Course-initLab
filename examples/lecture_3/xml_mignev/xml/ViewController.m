//
//  ViewController.m
//  xml
//
//  Created by Dani Rangelov on 12/13/11.
//  Copyright (c) 2011 Ten Touch. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "ViewController.h"
#import "TTNewsFeedXML.h"
#import "TTNewsConstants.h"
#import "TTStringTest.h"
#import "TTArrayTests.h"
#import "TTMyCustomView.h"


@interface  ViewController (privete) 
- (void)buttonClicked:(id)sender;
- (void)sliderTouched:(id)sender;
- (void)sliderValueChanged:(id)sender;
@end

@implementation ViewController

-(void)dealloc
{
    [boundsImage release];
}

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
    
    self.view.backgroundColor = [UIColor blueColor];

    UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 100, 40)];
    tmpLabel.backgroundColor = [UIColor blueColor];
    tmpLabel.text = @"TEXT";
    tmpLabel.textColor = [UIColor yellowColor];
    tmpLabel.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:tmpLabel];
    
    [tmpLabel release];
    
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(30, 60, 100, 40)];
    slider.backgroundColor = [UIColor purpleColor];
    slider.maximumValue = 100;
    slider.value = 30;
    [slider addTarget:self action:@selector(sliderTouched:) forControlEvents:UIControlEventTouchUpInside];
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    [slider release];
    
    
    UIButton *tmpBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tmpBtn.frame = CGRectMake(30, 80, 100, 30);
    tmpBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    [tmpBtn setTitle:@"Button" forState:UIControlStateNormal];
    //[tmpBtn setBackgroundImage:   [UIImage imageNamed:@"btn_img_bk.png"]  forState:UIControlStateNormal];
    //[tmpBtn setImage:             [UIImage imageNamed:@"btn_img.png"]     forState:UIControlStateHighlighted];
    [tmpBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tmpBtn];
    
    TTMyCustomView *myCustomView = [[ TTMyCustomView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    myCustomView.delegate = self;
    [self.view addSubview:myCustomView];

    
//#warning Here is the NSMutableArray 
   // NSMutableArray *result = [self loadXMLFromServer];
    


    
    TTStringTest* ttString = [[TTStringTest alloc] initWithString:@"THE string"];
    
    NSLog(@"ttString.string = %@", ttString.myString);
    
    [TTStringTest stringOperations:@"Sample string"];
    //[TTStringTest stringPaths];
   
    //[ttString demoStringByAppendingString:@"!STR!"];
    
    /*
    //[TTArrayTests demoArray];
    
    NSMutableDictionary *myData = [[TTArrayTests loadDictFromPlist] retain];
    
    NSLog(@"ARRAY = %@", [myData objectForKey:@"array"]);
    
    NSLog(@"ARRAY = %@", [[myData objectForKey:@"dict"] objectForKey:@"array"]);
    
    */

    /*
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:myData forKey:@"myData"];
    
    NSLog(@"userDefaults = %@", [userDefaults dictionaryRepresentation]);
    
    */
    
    boundsImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image_thumb_50.jpg"]];
    
    boundsImage.center = CGPointMake(self.view.center.x,self.view.center.y);
    boundsImage.layer.borderColor = [[UIColor colorWithRed:0.2 green:0.5 blue:0.3 alpha:1] CGColor];
    boundsImage.layer.borderWidth = 3;
    boundsImage.layer.cornerRadius = 15;
    [boundsImage setClipsToBounds:YES];
    [self.view addSubview:boundsImage];
    
    
    float someFloat = 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1;
    NSLog(@"%f", someFloat);
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Events Handling

//#warning Use this for the events of the button and slider
- (void)buttonClicked:(id)sender {
    DLog(@"Button Clicked");
}

- (void)sliderTouched:(id)sender {
    DLog(@"Slider Touched");
}

- (void)sliderValueChanged:(UISlider*)sender {
    DLog(@"Slider Value Changed :%f", sender.value);
}


#pragma mark - XML Request

#define NEWS_XML_URL @"http://tentouch.com/developer/news.xml"

- (NSMutableArray *)loadXMLFromServer {
	
	NSString * path = NEWS_XML_URL;
	
	TTNewsFeedXML *newsObject = [[TTNewsFeedXML alloc] initWithURLPath:path];
	NSMutableArray *xmlArray = [[NSMutableArray alloc] initWithArray:[newsObject getProcessedData] copyItems:YES];
	[newsObject release];
	
    NSLog(@"missingImages = %@", xmlArray);
    
	return [xmlArray autorelease];
}

- (void) backFire:(UIView *)view
{
    NSLog(@"View object: %@", view);
}



@end
