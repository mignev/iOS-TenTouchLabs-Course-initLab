//
//  TTNewsFeed.h
//  ScalePan
//
//  Created by тен on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TTNewsFeedXML : NSObject {
	
	NSXMLParser		* rssParser;
	NSMutableArray	* stories;
	
	NSString		* currentElement;
	NSMutableString * currentTitle, * currentDateFrom, * currentDateTo, * currentSummary, * currentLink;
	NSMutableString * currentImageName, * currentImgLink;
	
}

//@property (nonatomic, retain) NSMutableArray * stories;

+ (NSString*)cleanUpString:(NSString*)string;
- (id)initWithURLPath:(NSString*)path;
- (NSMutableArray*)getProcessedData;

@end
