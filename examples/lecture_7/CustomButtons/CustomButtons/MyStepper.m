//
//  MyStepper.m
//  CustomButtons
//
//  Created by Dobromir Minchev on 2/1/12.
//  Copyright (c) 2012 dobri87@gmail.com. All rights reserved.
//

#import "MyStepper.h"
#import "Consts.h"

#define kBtnPlusTag 1001
#define kBtnMinusTag 1002

@interface MyStepper (private)
-(void) buildView;
@end

@implementation MyStepper

@synthesize lblSize         = _lblSize;
@synthesize unitName        = _unitName;
@synthesize value           = _value;
@synthesize valueInc        = _valueInc;
@synthesize min             = _min;
@synthesize max             = _max;

- (void)dealloc
{
    [super dealloc];
    [_lblSize release];

}

- (void)setValue:(CGFloat)value
{
    _value = value;
    _lblSize.text = [NSString stringWithFormat:@"%.2f %@", value, _unitName];
}

- (void)setMin:(CGFloat)min
{
    _min = min;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self buildView];
    }
    
    return self;
}

- (void) buildView
{
    _valueInc = 1.0f;
    _min = 10.0f;
    _max = 25.0f;
    _value = _min;
    _unitName = @"px";
    
    UIButton *btnMinus = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    btnMinus.tag = kBtnMinusTag;
    NSString *nameImgBtnMinus = @"btnMinus";
    UIImage *imgBtnMinus = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", nameImgBtnMinus]];
    
    [btnMinus setImage:imgBtnMinus forState:UIControlStateNormal];
    [btnMinus setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_high.png", nameImgBtnMinus]] forState:UIControlStateHighlighted];
    [btnMinus setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_high.png", nameImgBtnMinus]] forState:UIControlStateSelected];
    btnMinus.adjustsImageWhenHighlighted = NO;
    btnMinus.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, imgBtnMinus.size.width, imgBtnMinus.size.height);
    [btnMinus addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnPlus = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    btnPlus.tag = kBtnPlusTag;
    NSString *nameImgBtnPlus = @"btnPlus";
    UIImage *imgBtnPlus = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", nameImgBtnPlus]];

    [btnPlus setImage:imgBtnPlus forState:UIControlStateNormal];
    [btnPlus setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_high.png", nameImgBtnPlus]] forState:UIControlStateHighlighted];
    [btnPlus setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_high.png", nameImgBtnPlus]] forState:UIControlStateSelected];
    btnPlus.adjustsImageWhenHighlighted = NO;
    btnPlus.frame = CGRectMake(self.bounds.size.width - imgBtnPlus.size.width, self.bounds.origin.y, imgBtnPlus.size.width, imgBtnPlus.size.height);
    [btnPlus addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];

    _lblSize = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.origin.x + btnMinus.frame.size.width, self.bounds.origin.y, self.bounds.size.width - btnMinus.frame.size.width - btnPlus.frame.size.width, btnPlus.frame.size.height)];
    
    _lblSize.backgroundColor = [UIColor clearColor];
    _lblSize.text = [NSString stringWithFormat:@"%d %@", (int)_min, _unitName];
    _lblSize.textAlignment = UITextAlignmentCenter;
    _lblSize.font = [UIFont fontWithName:@"Helvetica" size:14];
    _lblSize.textColor = [UIColor grayColor];
    
    UIImageView *bgImgLblSize = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ScreenStreching.png"]];
    bgImgLblSize.frame = _lblSize.frame;
    
    [self addSubview:btnMinus];
    [self addSubview:_lblSize];
    [self addSubview:btnPlus];
    [self insertSubview:bgImgLblSize belowSubview:_lblSize];
//    NSMutableArray *someArr = [[NSMutableArray alloc] init];
    
    [btnMinus release];
    [btnPlus release];
    [_lblSize release];
    [bgImgLblSize release];
}


-(void)buttonTouched:(UIButton *)sender
{
    if (sender.tag == kBtnPlusTag) {
        if (_value < _max) {
            _value += _valueInc;
        }
    } else if(sender.tag == kBtnMinusTag) {
        if (_value > _min) {
            _value -= _valueInc;
        }
    }

    _lblSize.text = [NSString stringWithFormat:@"%.2f %@", _value, _unitName];
    
    NSDictionary *foundParams = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:_value] forKey:@"value"];
    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationStepperChanged object:nil userInfo:foundParams];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
