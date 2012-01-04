//
//  TTNewsFeed.m
//  ScalePan
//
//  Created by тен on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TTNewsFeedXML.h"
#import "TTNewsConstants.h"

@interface TTNewsFeedXML(private)
- (void)parseXMLFileAtURL:(NSString *)URL;
@end

@implementation TTNewsFeedXML

//@synthesize stories;

- (void)dealloc {
	
    [currentElement release];
    
    [currentTitle		release];
	[currentDateTo		release];
	[currentDateFrom	release];
	[currentSummary		release];
	[currentLink		release];
	[currentImageName	release];
	[currentImgLink		release];
    
    [stories release];
	[rssParser release];
	
	[super dealloc];
}

+ (NSString*)cleanUpString:(NSString*)string {
	
	// clean up the link - get rid of spaces, returns, and tabs...
	//string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
	string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
	string = [string stringByReplacingOccurrencesOfString:@"\t" withString:@""];
	string = [string stringByReplacingOccurrencesOfString:@"	" withString:@""];
	
	return string;
}

- (id)initWithURLPath:(NSString*)path {
	
	if ((self = [super init])) {
		if ([stories count] == 0) {
			
			[self parseXMLFileAtURL:path];
		}
	}
	return self;
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{	
	//DLog(@"found file and started parsing");
}

- (void)parseXMLFileAtURL:(NSString *)URL{	
	stories = [[NSMutableArray alloc] init];
	
    //you must then convert the path to a proper NSURL or it won't work
    NSURL *xmlURL = [NSURL URLWithString:URL];
    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    //[rssParser setDelegate:(id)self];
    rssParser.delegate = (id)self;
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	
    [rssParser parse];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);

}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{			
    DLog(@"found this element: %@", elementName);
	currentElement = [elementName copy];
    
	if ([elementName isEqualToString:@"item"]) {
		// clear out our story item caches...
		
		currentTitle		= [[NSMutableString alloc] init];
		currentDateTo		= [[NSMutableString alloc] init];
		currentDateFrom		= [[NSMutableString alloc] init];
		currentSummary		= [[NSMutableString alloc] init];
		currentLink			= [[NSMutableString alloc] init];
		currentImageName	= [[NSMutableString alloc] init];
		currentImgLink		= [[NSMutableString alloc] init];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{     
	DLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array...
		
		NSMutableDictionary *tmpItem = [[NSMutableDictionary alloc] init];
		
		[tmpItem setObject:currentTitle		forKey:@"title"];
		[tmpItem setObject:currentLink		forKey:@"link"];
		[tmpItem setObject:currentSummary	forKey:@"summary"];
		[tmpItem setObject:currentDateFrom	forKey:@"dateFrom"];
		[tmpItem setObject:currentDateTo	forKey:@"dateTo"];
		[tmpItem setObject:currentImageName	forKey:@"imageName"];
		[tmpItem setObject:currentImgLink	forKey:@"image"];
		
		[stories addObject:tmpItem];
		[tmpItem release];
		
		//DLog(@"adding story: %@", currentTitle);
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	DLog(@"found characters: %@", string);
	// save the characters for the current item...
	
	if ([currentElement isEqualToString:@"title"]) {
		[currentTitle appendString:string];
	} else if ([currentElement isEqualToString:@"link"]) {
		[currentLink appendString:string];
	} else if ([currentElement isEqualToString:@"description"]) {
		[currentSummary appendString:string];
	} else if ([currentElement isEqualToString:@"dateFrom"]) {
		[currentDateFrom appendString:string];
	} else if ([currentElement isEqualToString:@"dateTo"]) {
		[currentDateTo appendString:string];
	} else if ([currentElement isEqualToString:@"imageName"]) {
		[currentImageName appendString:string];
	} else if ([currentElement isEqualToString:@"image"]) {
		[currentImgLink appendString:string];
	}
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	DLog(@"all done!");
	DLog(@"stories array has %d items", [stories count]);
    DLog(@"%@", stories);
}

- (NSMutableArray*)getProcessedData{

	NSMutableArray *result = [[NSMutableArray alloc] init];
	
	if (stories == nil || [stories count] == 0) {
		DLog(@"ERROR: XML not downloaded");
		[result release];
		result = nil;
		return result;
	}
	
	for (int i = 0; i < [stories count]; i++) {
		NSDictionary *tmpElement = [stories objectAtIndex:i];
		NSMutableDictionary *tmpItem = [[NSMutableDictionary alloc] init];
		
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:DATE_STYLE];
		
		NSDate *tmpDate = [dateFormatter dateFromString: [TTNewsFeedXML cleanUpString:[tmpElement objectForKey:@"dateFrom"]]];
		[tmpItem setObject:tmpDate forKey:@"dateFrom"];
		
		NSDate *tmpDate2 = [dateFormatter dateFromString: [TTNewsFeedXML cleanUpString:[tmpElement objectForKey:@"dateTo"]]];
		[tmpItem setObject:tmpDate2 forKey:@"dateTo"];
		
		[tmpItem setObject:[TTNewsFeedXML cleanUpString:[tmpElement objectForKey:@"summary"]]	forKey:@"summary"];
		[tmpItem setObject:[TTNewsFeedXML cleanUpString:[tmpElement objectForKey:@"link"]]		forKey:@"link"];
		[tmpItem setObject:[TTNewsFeedXML cleanUpString:[tmpElement objectForKey:@"title"]]		forKey:@"title"];
		[tmpItem setObject:[TTNewsFeedXML cleanUpString:[tmpElement objectForKey:@"image"]]		forKey:@"image"];
		
		[tmpItem setObject:[TTNewsFeedXML cleanUpString:[tmpElement objectForKey:@"imageName"]]	forKey:@"imageName"];
		
		//[usLocale release];
		[dateFormatter release];
		[result addObject:tmpItem];
		[tmpItem release];
	}
	return [result autorelease];
}



@end
