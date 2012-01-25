//
//  MyTableViewCell.m
//  Zodiac
//
//  Created by Marian Ignev on 1/25/12.
//  Copyright (c) 2012 Pamukchii. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

@synthesize lblFontName, lblPointSize, lblLineHeight;
@synthesize imgCell;
@synthesize btnCell;

-(void)dealloc
{
    [lblFontName, lblPointSize, lblLineHeight release];
    [imgCell release];
    [btnCell release];

    [super dealloc];
}

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

-(id)initWithFrame:(CGRect)frame
{
    if ( self = [super initWithFrame:frame]) 
    {
        UIFont *fontLabelGlobal = [UIFont systemFontOfSize:14];
        
        lblFontName = [[UILabel alloc] init];
        lblFontName.font = fontLabelGlobal;
        lblFontName.textAlignment = UITextAlignmentLeft;
        lblFontName.backgroundColor = [UIColor clearColor];
        
        lblPointSize = [[UILabel alloc] init];
        lblPointSize.font = fontLabelGlobal;
        lblPointSize.textAlignment = UITextAlignmentLeft;
        lblPointSize.backgroundColor = [UIColor clearColor];
        
        lblLineHeight = [[UILabel alloc] init];
        lblLineHeight.font = fontLabelGlobal;
        lblLineHeight.textAlignment = UITextAlignmentLeft;
        lblLineHeight.backgroundColor = [UIColor clearColor];
        
        imgCell = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"djvaka.jpeg"]];
        btnCell = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnCell.titleLabel.text = @"Press me!";
        btnCell.titleLabel.textColor = [UIColor yellowColor];
        
        [self.contentView addSubview:lblFontName];
        [self.contentView addSubview:lblLineHeight];
        [self.contentView addSubview:lblPointSize];
        [self.contentView addSubview:imgCell];
        [self.contentView addSubview:btnCell];
        
//        [lblFontName, lblPointSize, lblLineHeight release];
//        [imgCell release];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frmContent = self.contentView.bounds;
    CGFloat boundsX = frmContent.origin.x;
    
    lblFontName.frame = CGRectMake(boundsX, 0, 150, 20);
    lblPointSize.frame = CGRectMake(boundsX, 30, 150, 20);
    lblLineHeight.frame = CGRectMake(boundsX, 50, 150, 20);
    btnCell.frame = CGRectMake(frmContent.size.width - 90, 50, 150, 20);
    imgCell.frame = CGRectMake(btnCell.frame.origin.x - 10 - imgCell.frame.size.width , 50, imgCell.frame.size.width, imgCell.frame.size.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
