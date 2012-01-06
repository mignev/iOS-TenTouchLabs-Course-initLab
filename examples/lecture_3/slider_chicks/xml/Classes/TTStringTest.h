//
//  TTStringTest.h
//  xml
//
//  Created by Dani Rangelov on 12/20/11.
//  Copyright (c) 2011 Ten Touch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTStringTest : NSObject {
    
    NSMutableString *_myString;
}

@property (nonatomic, retain) NSMutableString *myString;

- (id)initWithString:(NSString*)aString;

+ (void)stringOperations:(NSString *)aString;
+ (void)stringPaths;

- (void)demoStringByAppendingString:(NSString*)aString;

@end
