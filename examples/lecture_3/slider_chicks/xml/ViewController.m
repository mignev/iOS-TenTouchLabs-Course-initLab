//
//  ViewController.m
//  xml
//
//  Created by Dani Rangelov on 12/13/11.
//  Copyright (c) 2011 Ten Touch. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
//#include <stdlib.h>

#import "ViewController.h"
#import "TTNewsFeedXML.h"
#import "TTNewsConstants.h"
#import "TTStringTest.h"
#import "TTArrayTests.h"



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
    slider.maximumValue = 150;
    slider.value = 30;
    [slider addTarget:self action:@selector(sliderTouched:) forControlEvents:UIControlEventTouchUpInside];
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    [slider release];
    
    
    UIButton *tmpBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tmpBtn.frame = CGRectMake(200, 80, 100, 30);
    tmpBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    [tmpBtn setTitle:@"Button" forState:UIControlStateNormal];
    //[tmpBtn setBackgroundImage:   [UIImage imageNamed:@"btn_img_bk.png"]  forState:UIControlStateNormal];
    //[tmpBtn setImage:             [UIImage imageNamed:@"btn_img.png"]     forState:UIControlStateHighlighted];
    [tmpBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tmpBtn];
    
    UIButton *tmpBtn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tmpBtn2.frame = CGRectMake(80, 300, 100, 30);
    tmpBtn2.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    [tmpBtn2 setTitle:@"Like" forState:UIControlStateNormal];
    //[tmpBtn setBackgroundImage:   [UIImage imageNamed:@"btn_img_bk.png"]  forState:UIControlStateNormal];
    //[tmpBtn setImage:             [UIImage imageNamed:@"btn_img.png"]     forState:UIControlStateHighlighted];
    /*[tmpBtn2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];*/
    [self.view addSubview:tmpBtn2];
    
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
    
    boundsImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chick1.jpg"]];
    
    boundsImage.center = CGPointMake(self.view.center.x,self.view.center.y);
    boundsImage.layer.borderColor = [[UIColor colorWithRed:0.7 green:0.7 blue:0.3 alpha:1] CGColor];
    boundsImage.layer.borderWidth = 3;
    boundsImage.layer.cornerRadius = 15;
    boundsImage.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    
    [boundsImage setClipsToBounds:YES];
    
    [self.view addSubview:boundsImage];
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
    //if(boundsImage.image == )
    int i = random() % 3;
    i++;
    NSString *myTI = [NSString stringWithFormat:@"%d",i]; 
    //[[NSNumber numberWithInt:i] stringValue];
    NSLog(@"%@",myTI);
  
    boundsImage.image = [UIImage imageNamed: [NSString stringWithFormat:@"chick%@.jpg", myTI]];
 
   
}

- (void)sliderTouched:(id)sender {
    DLog(@"Slider Touched");
}

- (void)sliderValueChanged:(UISlider*)sender {
    NSLog(@"Slider Value Changed :%f", sender.value);
    boundsImage.frame = CGRectMake(self.view.center.x, self.view.center.y, 
                                   sender.value*2, sender.value*2);
    boundsImage.center = CGPointMake(self.view.center.x,self.view.center.y);
    
    
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





@end
