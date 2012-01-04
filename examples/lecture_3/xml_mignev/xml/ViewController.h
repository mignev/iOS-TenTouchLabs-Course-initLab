//
//  ViewController.h
//  xml
//
//  Created by Dani Rangelov on 12/13/11.
//  Copyright (c) 2011 Ten Touch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTMyCustomView.h"

@interface ViewController : UIViewController <MyViewProtocol>
{
    UIImageView *boundsImage;
}

- (NSMutableArray *)loadXMLFromServer;

@end
