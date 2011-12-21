//
//  TTStringTest.m
//  xml
//
//  Created by Marian Ignev on 12/21/11.
//  Copyright (c) 2011 Ten Touch. All rights reserved.
//

#import "TTStringTest.h"

@implementation TTStringTest

@synthesize myString = _myString;

-(void)dealloc
{
    [_myString release];
    
    [super dealloc];
}

-(id)initWithString:(NSString *)initString
{
    if ( self = [super init] )
    {
        self.myString = [[NSMutableString alloc] initWithString:initString];
    }
    return self;
}

+(void)stringOperations:(NSString *)aString
{
    NSString *str = [[NSString alloc] initWithString:aString];
////    NSLog(@"%@", str);
//    NSLog(@"\n");
//    
//    NSLog(@"[str lenght] = %d", [str length]);

    NSString *strReplaced = [str stringByReplacingOccurrencesOfString:@"a" withString:@"@"];
    strReplaced = [strReplaced stringByReplacingCharactersInRange:NSMakeRange(3, 40) withString:@"a______s"];
    NSLog(@"%@", strReplaced);
    
    
}

@end
