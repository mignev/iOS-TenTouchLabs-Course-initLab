//
//  TTView.h
//  xml
//
//  Created by Dani Rangelov on 1/1/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TTViewDelegate <NSObject>

@required

- (void)requiredMethod;



@end

@interface TTView : UIView <UIGestureRecognizerDelegate>{

    id _delegate;
}

@property (nonatomic, assign) id delegate;
//@property (nonatomic, weak) id delegate;


- (void)handleTapGesture:(UITapGestureRecognizer*)tap;

@end


