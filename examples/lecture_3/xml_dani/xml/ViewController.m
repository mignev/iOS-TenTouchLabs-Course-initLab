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


@interface  ViewController (privete) 
- (void)buttonClicked:(id)sender;
- (void)sliderTouched:(id)sender;
- (void)sliderValueChanged:(id)sender;
@end

@implementation ViewController

- (void)dealloc {
    [aView release];
    
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blueColor];

    
    UIPinchGestureRecognizer *_pinchGesture		= [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
	_pinchGesture.delegate = self;
    
	[self.view addGestureRecognizer:_pinchGesture];
	[_pinchGesture release];

    
    
    
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
    tmpBtn.frame = CGRectMake(30, 100, 100, 30);
    tmpBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    [tmpBtn setTitle:@"Button" forState:UIControlStateNormal];
    //[tmpBtn setBackgroundImage:   [UIImage imageNamed:@"btn_img_bk.png"]  forState:UIControlStateNormal];
    //[tmpBtn setImage:             [UIImage imageNamed:@"btn_img.png"]     forState:UIControlStateHighlighted];
    [tmpBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tmpBtn];
    
    //#warning Here is the NSMutableArray 
   // NSMutableArray *result = [self loadXMLFromServer];
    


    /*
    TTStringTest* ttString = [[TTStringTest alloc] initWithString:@"THE string"];
    
    NSLog(@"ttString.string = %@", ttString.myString);
    
    [TTStringTest stringOperations:@"Sample string"];
    //[TTStringTest stringPaths];
   
    //[ttString demoStringByAppendingString:@"!STR!"];
    */
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
    
    
    aView = [[TTView alloc] initWithFrame:CGRectMake(240, 140, 80, 80)];
    aView.backgroundColor = [UIColor redColor];
    aView.layer.borderColor = [[UIColor colorWithRed:0.52 green:0.09 blue:0.07 alpha:1] CGColor];
    aView.layer.borderWidth = 5;
    aView.layer.cornerRadius = 10;
    aView.delegate = self;

    [aView setClipsToBounds:YES];
    
    [self.view addSubview:aView];
    
    
    UIImageView *view2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images.jpeg"]];
    view2.center = CGPointMake(self.view.center.x, self.view.center.y+100);
    view2.backgroundColor = [UIColor yellowColor];
    view2.layer.borderColor = [[UIColor colorWithRed:0.52 green:0.3 blue:0.3 alpha:1] CGColor];
    view2.layer.borderWidth = 2;
    view2.layer.cornerRadius = 50;
    
    [view2 setClipsToBounds:YES];
    
    [self.view addSubview:view2];
    [view2 release];
    
    
    //Transformations
    
    //CGAffineTransform rotate = CGAffineTransformMakeRotation(M_PI_4);
    //aView.transform = rotate;
     
    

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
    /*
    CGAffineTransform transformation = aView.transform;
    //aView.transform = CGAffineTransformIdentity;
    
    
    NSInteger position = self.view.frame.size.width - aView.frame.size.width;
    position = rand()%position;
    
    [UIView beginAnimations:@"Change position" context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelegate:self];
    //aView.frame = CGRectMake(position, aView.frame.origin.y, aView.frame.size.width, aView.frame.size.height);
    aView.transform = CGAffineTransformTranslate(transformation, position, 0);
    aView.transform = CGAffineTransformRotate(transformation, M_PI_4);
    [UIView commitAnimations];
    */
    
    
    [UIView animateWithDuration:1.0
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         aView.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         // Wait one second and then fade in the view
                         [UIView animateWithDuration:1.0
                                               delay: 1.0
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              aView.alpha = 1.0;
                                          }
                                          completion:nil];
                     }];
     

}

- (void)sliderTouched:(id)sender {
    DLog(@"Slider Touched");
}

- (void)sliderValueChanged:(UISlider*)sender {
    DLog(@"Slider Value Changed :%f", sender.value);
}



- (void)handlePinchGesture:(UIPinchGestureRecognizer*)pinch {
   if(pinch.state == UIGestureRecognizerStateEnded || pinch.state == UIGestureRecognizerStateChanged){
         NSLog(@"PINCH = %f", pinch.scale);
    }
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

#pragma mark - Protocol Required Methods
- (void)requiredMethod {
 
    NSLog(@"TOUCH"); 
}

#pragma mark - Amination Delegate Methods

- (void)animationDidStart:(CAAnimation *)anim {
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}


@end
