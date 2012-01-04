//
//  TTMyCustomView.h
//  xml
//
//  Created by Marian Ignev on 1/4/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyViewProtocol <NSObject>

@required

    -(void)backFire:(UIView *)view;

@end


@interface TTMyCustomView : UIView
{
    id _delegate;
}

@property (nonatomic, assign) id delegate;

@end
