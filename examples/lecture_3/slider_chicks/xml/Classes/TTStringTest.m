//
//  TTStringTest.m
//  xml
//
//  Created by Dani Rangelov on 12/20/11.
//  Copyright (c) 2011 Ten Touch. All rights reserved.
//

#import "TTStringTest.h"


@implementation TTStringTest

@synthesize myString = _myString;

- (void)dealloc {
    [_myString release];
    
    [super dealloc];
}

- (id)initWithString:(NSString*)aString {
    
	if ((self = [super init])) {
        //[aString release];
        //Important: Raises an NSInvalidArgumentException if aString is nil.
		_myString = [[NSMutableString alloc] initWithString:aString];
	}
	
	return self;
}

- (void)demoStringByAppendingString:(NSString*)aString {
    
    [_myString replaceCharactersInRange:NSMakeRange(2, 4) withString:aString];
    NSLog(@"_myString = %@", _myString);
    NSLog(@"self.myString = %@", self.myString);
    
    [_myString insertString:aString atIndex:5];
    NSLog(@"_myString = %@", _myString);
    
    [_myString deleteCharactersInRange:NSMakeRange([_myString length] - 5, 5)];
    NSLog(@"_myString = %@", _myString);
    
    [_myString appendString:aString];
    NSLog(@"_myString = %@", _myString);
    
    
}

+ (void)stringOperations:(NSString *)aString {
    NSString *str = @"A string object presents itself as an array of Unicode characters. You can determine how many characters it contains with the length method and can retrieve a specific character with the characterAtIndex: method. These two primitive methods provide basic access to a string object. Most use of strings, however, is at a higher level, with the strings being treated as single entities: You compare strings against one another, search them for substrings, combine them into new strings, and so on. If you need to access string objects character-by-character, you must understand the Unicode character encoding—specifically, issues related to composed character sequences.";
    
    NSLog(@"[str length] = %d", [str length]);
    
    
    BOOL same = [str isEqualToString:aString];
    NSLog(@"same = %d", same);
    
    NSLog(@"1 %@", [str substringFromIndex:500]);
    NSLog(@"2 %@", [str substringToIndex:100]);
    NSLog(@"3 %@", [str substringWithRange:NSMakeRange(100, 30)]);
    
    same = [@"Sample string" isEqualToString:aString];
    
    NSString *strFormat = [NSString stringWithFormat:@"same2 = %d", same];
    NSLog(@"%@", strFormat);
    
    NSString *strReplaced = [str stringByReplacingOccurrencesOfString:@"a" withString:@"@"];
    strReplaced = [str stringByReplacingCharactersInRange:NSMakeRange(20, 50) withString:@"XXXXXXXXXXXX________"];
    NSLog(@"%@", strReplaced);
    
    
}

+ (void)stringPaths{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:@"savedImage.png"];
    
    NSLog(@"savedImagePath = %@", savedImagePath);
    
}



@end
