//
//  TTImageView.h
//  xml
//
//  Created by Dani Rangelov on 12/20/11.
//  Copyright (c) 2011 Ten Touch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTImageView : UIImageView {
    
    NSString	*name;
    NSURL		*link;
    NSString	*title;
    NSString	*summary;
}

@property (nonatomic, retain) NSString	*name;
@property (nonatomic, retain) NSURL		*link;
@property (nonatomic, retain) NSString	*title;
@property (nonatomic, retain) NSString	*summary;

@end

