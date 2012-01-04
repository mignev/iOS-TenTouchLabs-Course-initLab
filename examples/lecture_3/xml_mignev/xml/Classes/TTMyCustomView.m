//
//  TTMyCustomView.m
//  xml
//
//  Created by Marian Ignev on 1/4/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import "TTMyCustomView.h"

@implementation TTMyCustomView

@synthesize delegate = _delegate;

- (void) dealloc
{
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGRect myRect = CGRectMake(10, 20, 100, 100);
    UIColor *myColor = [UIColor redColor ];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 5);
    CGContextSetStrokeColorWithColor(ctx, myColor.CGColor);
    CGContextSetFillColorWithColor(ctx, myColor.CGColor);
    CGContextAddEllipseInRect(ctx, myRect);
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([_delegate respondsToSelector:@selector(backFire:)]) {
        [_delegate performSelector:@selector(backFire:) withObject:self];
    }
}

@end
