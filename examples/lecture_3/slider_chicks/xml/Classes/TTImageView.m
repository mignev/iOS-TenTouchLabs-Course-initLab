//
//  TTImageView.m
//  xml
//
//  Created by Dani Rangelov on 12/20/11.
//  Copyright (c) 2011 Ten Touch. All rights reserved.
//

#import "TTImageView.h"

@implementation TTImageView

@synthesize name, link, title, summary;

- (void)dealloc {
	
	[name release];
	[link release];
	[title release];
	[summary release];
	
    [super dealloc];
}

- (id)init {
	if ((self = [super init])) {
		
		name	= [@"" retain];
		title	= [@"" retain];
		summary = [@"" retain];
		link	= [[NSURL alloc] init];
	}
	return self;
}

- (NSString*)description {
	return [NSString stringWithFormat:@"Name: %@ ; Title: %@; URL: %@; Image: %@ Frame: %@", name, title, link, self.image, 
			NSStringFromCGRect(self.frame)];
}

@end
