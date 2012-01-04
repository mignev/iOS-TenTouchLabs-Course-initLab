//
//  TTView.m
//  xml
//
//  Created by Dani Rangelov on 1/1/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import "TTView.h"

@implementation TTView

@synthesize delegate = _delegate;

- (void)dealloc{
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        tapGesture.delegate = self;
        
        [self addGestureRecognizer:tapGesture];
        [tapGesture release];
        
    }
    return self;
}

#pragma mark - Custom Drawing

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void)drawRect:(CGRect)rect {
    NSLog(@"DRAW");
    CGRect currentRect = CGRectMake(10,10,30,20);
    UIColor *currentColor = [UIColor blueColor];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
    
    CGContextSetFillColorWithColor(context, currentColor.CGColor);  
    CGContextAddEllipseInRect(context, currentRect);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    // [self.view setNeedsDisplay];
}   

#pragma mark - Touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if ([_delegate respondsToSelector:@selector(requiredMethod)]) {
        [_delegate requiredMethod];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

#pragma mark - Gestures

- (void)handleTapGesture:(UITapGestureRecognizer*)tap {
	
    NSLog(@"TAP");
}


@end
