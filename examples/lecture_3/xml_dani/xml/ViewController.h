//
//  ViewController.h
//  xml
//
//  Created by Dani Rangelov on 12/13/11.
//  Copyright (c) 2011 Ten Touch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTView.h"


@interface ViewController : UIViewController <TTViewDelegate, UIGestureRecognizerDelegate> {
    TTView *aView;
}


- (NSMutableArray *)loadXMLFromServer;

@end
