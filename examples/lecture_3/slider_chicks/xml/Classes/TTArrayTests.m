//
//  TTArrayTests.m
//  xml
//
//  Created by Dani Rangelov on 12/20/11.
//  Copyright (c) 2011 Ten Touch. All rights reserved.
//

#import "TTArrayTests.h"

@implementation TTArrayTests

@synthesize myArray = _myArray;

+(void)demoArray{
    NSArray *namesArr = [NSArray arrayWithObjects:
                         @"Some Object",
                         @"Some Object1",
                         @"Alexander Milanov",
                         @"Diqn Nedelchev",
                         @"Georgi Koikov",
                         @"Georgi Mitev",
                         @"Ivailo Alexandrov",
                         @"Ivelin Georgiev",
                         @"Julian Kuntorov",
                         @"Kalin Cekov",
                         @"Marian Ignev",
                         @"Svetlin Stoev",
                         @"Some Object100",
                         @"Some Object101",
                         nil];
    
    NSMutableArray *namesMutabelArr = [[NSMutableArray alloc] initWithArray:namesArr copyItems:YES];
    NSLog(@"ARR: %@", namesMutabelArr);
    
    [namesMutabelArr removeObject:@"Some Object"];
    NSLog(@"ARR: %@", namesMutabelArr);
    
    [namesMutabelArr removeObjectAtIndex:[namesMutabelArr count] - 1];
    NSLog(@"ARR: %@", namesMutabelArr);
    
    [namesMutabelArr replaceObjectAtIndex:[namesMutabelArr count] - 1 withObject:@"Other Object"];
    NSLog(@"ARR: %@", namesMutabelArr);
    
    [namesMutabelArr insertObject:@"New Object" atIndex:5];
    NSLog(@"ARR: %@", namesMutabelArr);
    
    [namesMutabelArr addObject:@"New Object 2"];
    NSLog(@"ARR: %@", namesMutabelArr);
}

+(NSMutableDictionary*)loadDictFromPlist {
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:@"myPlist.plist"];
    NSDictionary *plistData = [[NSDictionary dictionaryWithContentsOfFile:finalPath] retain];
    
    NSMutableDictionary *loadedPlist = [[NSMutableDictionary alloc] initWithDictionary:plistData copyItems:YES];
    [plistData release];
    
    NSLog(@"loadedPlist = %@", loadedPlist);
    
    return [loadedPlist autorelease];
}

@end
