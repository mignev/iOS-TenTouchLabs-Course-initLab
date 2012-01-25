//
//  TableContainer.m
//  NavigationTests
//
//  Created by Dani Rangelov on 1/16/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import "CustomView.h"

@interface CustomView (private)
- (void)buildView;
@end

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        [self buildView];
    }
    return self;
}

- (void)buildView {
    
    self.backgroundColor = [UIColor lightGrayColor];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(-20, -20, 50, 50)];
    view1.backgroundColor = [UIColor yellowColor];
    [self addSubview:view1];
    [view1 release];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width - 30, - 20, 50, 50)];
    view2.backgroundColor = [UIColor purpleColor];
    [self addSubview:view2];
    [view2 release];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(20, 80, 50, 50)];
    view3.backgroundColor = [UIColor blueColor];
    [self addSubview:view3];
    [view3 release];
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 50, 50)];
    view4.backgroundColor = [UIColor greenColor];
    [self addSubview:view4];
    [view4 release];
    
}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)even {
    BOOL isInside = CGRectContainsPoint(self.bounds, point);
    BOOL isInsideSubview = NO;
    
    //if (!isInside) {
        for (UIView *subview in self.subviews) {
            isInsideSubview = CGRectContainsPoint(subview.frame, point);
            if (isInsideSubview) {
                isInside = isInsideSubview;
                break;
            }
        }
    //}
    
    //NSLog(@"Point Inside %d", isInsideSubview);
    return isInsideSubview;
}

@end
