//
//  ViewController.h
//  CustomButtons
//
//  Created by Dobromir Minchev on 2/1/12.
//  Copyright (c) 2012 dobri87@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UILabel *lblSize, *lblNotification;
    CGFloat _min, _max, _value, _valueInc;
    NSString *_unitName;
}


@end
