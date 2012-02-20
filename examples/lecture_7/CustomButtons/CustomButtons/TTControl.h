//
//  TTControl.h
//  CustomButtons
//
//  Created by Dobromir Minchev on 2/8/12.
//  Copyright (c) 2012 dobri87@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kForTarget @"kForTarget"
#define kForAction @"kForAction"

@interface TTControl : UIView 

@property (strong, nonatomic) NSMutableDictionary *events;

- (void) addTarget:(id)target action:(SEL)selector forControlEvents:(UIControlEvents)event;
-(void) performActionOnTargetsForEvent:(UIControlEvents)event withObject:(id)sender;

@end
