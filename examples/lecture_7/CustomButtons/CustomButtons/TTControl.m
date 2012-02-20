//
//  TTControl.m
//  CustomButtons
//
//  Created by Dobromir Minchev on 2/8/12.
//  Copyright (c) 2012 dobri87@gmail.com. All rights reserved.
//

#import "TTControl.h"

@implementation TTControl

@synthesize events = _events;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



-(void) addTarget:(id)target action:(SEL)selector forControlEvents:(UIControlEvents)event
{
    if (_events == nil) {
        _events = [[NSMutableDictionary alloc] init];
        [_events setObject:[NSMutableArray array] forKey:[NSNumber numberWithInt:UIControlEventTouchUpInside]];
    }
    
    NSMutableArray *targets = [_events objectForKey:[NSNumber numberWithInt:event]];
    [targets addObject:[NSDictionary dictionaryWithObjectsAndKeys:[NSValue valueWithPointer:target], kForTarget,[NSValue valueWithPointer:selector], kForAction, nil]];
}

-(void) performActionOnTargetsForEvent:(UIControlEvents)event withObject:(id)sender
{
    NSMutableArray *targets = [_events objectForKey:[NSNumber numberWithInt:event]];
    
    for (NSDictionary *object in targets) {
        SEL action = [(NSValue*) [object objectForKey:kForAction] pointerValue];
        id target = [(NSValue*) [object objectForKey:kForTarget] pointerValue];

        if ([target respondsToSelector:action]) {
            [target performSelector:action withObject:sender];
        }

    }
}

-(void) addEvent:(UIControlEvents)event
{
    if (_events == nil) {
        _events = [[NSMutableDictionary alloc] init];
        [_events setObject:[NSMutableArray array] forKey:[NSNumber numberWithInt:UIControlEventTouchUpInside]];
    }
    
    for (NSNumber *key in _events) {
        if ([key intValue] == event) {
            return;
        }
    }
    
    [_events setObject:[NSMutableArray array] forKey:[NSNumber numberWithInt:event]];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
