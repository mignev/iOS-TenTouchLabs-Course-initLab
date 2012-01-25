//
//  AnotherVC.m
//  NavigationTests
//
//  Created by Dani Rangelov on 1/4/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import "AnotherVC.h"
#import "BlueVC.h"
#import "CustomView.h"

@implementation AnotherVC

@synthesize myString = _myString;

- (void)dealloc {
    [containerView release];
    
    [super dealloc];
}

- (NSString *)anotherGetter {
    return _myString;
}

- (void)setMyString:(NSString *)newString {
    
    //if ([_myString isEqualToString:newString]) {
    if (_myString != newString) {
        [_myString release];
        _myString = nil;
        _myString = [newString copy];
    }
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    UIImageView *bkImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Fatal_Error.gif"]];
    //[self.view addSubview:bkImage];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapGesture.delegate = self;
    
    [self.view addGestureRecognizer:tapGesture];
    [tapGesture release];
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"FATAL ERROR 404!"
                                                      message:@"You MUST enter text before going back!."
                                                     delegate:nil
                                            cancelButtonTitle:@"I am entering text"
                                            otherButtonTitles:nil];
    
    //[message show];
    
    UITextField *myTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, 200, 30)];
    
   
    myTextField.borderStyle        = UITextBorderStyleRoundedRect;
    myTextField.placeholder = @"Email";
    myTextField.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
    myTextField.spellCheckingType  =  UITextSpellCheckingTypeNo;
    myTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    myTextField.delegate = self;
    [self.view addSubview:myTextField];
    
    [myTextField release];
    
    containerView = [[CustomView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    //[self.view addSubview:containerView];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (touch.view == self.view) return YES;
    return NO;
}

- (void)handleTapGesture:(UITapGestureRecognizer*)tap {
	
    NSLog(@"tap.view = %@", tap.view);
    
    
    NSLog(@"Go to BlueVC");
    UIViewController *anotherController = [[BlueVC alloc] init];
    [self.navigationController pushViewController:anotherController animated:YES];
    [anotherController release];
}




@end
