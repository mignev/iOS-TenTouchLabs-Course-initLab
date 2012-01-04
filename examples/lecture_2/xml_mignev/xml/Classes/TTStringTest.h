//
//  TTStringTest.h
//  xml
//
//  Created by Marian Ignev on 12/21/11.
//  Copyright (c) 2011 Ten Touch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTStringTest : NSObject
{
    NSMutableString *_myString;
}

@property (nonatomic, retain) NSMutableString *myString; 

-(id)initWithString: (NSString *)initString;
+(void)stringOperations: (NSString*)aString;

@end
