//
//  MyStepper.h
//  CustomButtons
//
//  Created by Dobromir Minchev on 2/1/12.
//  Copyright (c) 2012 dobri87@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyStepper : UIView
{
    
}

@property (nonatomic, retain) UILabel *lblSize;
@property (nonatomic, assign) CGFloat value;
@property (nonatomic, assign) CGFloat valueInc;
@property (nonatomic, assign) CGFloat min;
@property (nonatomic, assign) CGFloat max;
@property (nonatomic, retain) NSString *unitName;


@end
