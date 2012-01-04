//
//  TTNewsConstants.h
//  xml
//
//  Created by Dani Rangelov on 12/16/11.
//  Copyright (c) 2011 Ten Touch. All rights reserved.
//


//#define DEBUG_LOG

//TTNewsFeedXML

//Fri, 31 Dec 2010 19:00:53 +0000
//#define DATE_STYLE @"EEE, dd MMM yyyy HH:mm:ss ZZ"
//03 Dec 2011
#define DATE_STYLE @"dd.MM.yyyy"


#define TEST_URL @"http://www.tentouch.com/connectionTest.html"

static int isConnectedToInternet() {
	NSError* error;
	//NSLog(@"Connection Asked");
	NSString *URLString = [NSString stringWithContentsOfURL:[NSURL URLWithString:TEST_URL] 
												   encoding:NSASCIIStringEncoding 
													  error:&error];
    return ( URLString != NULL ) ? YES : NO;
}


#ifdef DEBUG_LOG
#define Log(message) NSLog(message @" (in %s at line %d)", __PRETTY_FUNCTION__, __LINE__);
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define Log(message, ...)
#define DLog(...)
#endif