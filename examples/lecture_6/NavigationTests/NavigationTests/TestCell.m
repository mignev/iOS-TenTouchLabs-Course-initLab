//
//  TestCell.m
//  NavigationTests
//
//  Created by Dani Rangelov on 1/15/12.
//  Copyright (c) 2012 Ten Touch. All rights reserved.
//

#import "TestCell.h"

@implementation TestCell


@synthesize lblName, lblPointSize, lblLineHeight;
@synthesize imgCell;
@synthesize btnCell;


- (void)dealloc {
	[lblName release];
	[lblPointSize release];
	[lblLineHeight release];
	[imgCell release];
	
    [super dealloc];
}

/*
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
*/

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		// Initialization code
		
		UIFont *fontLbl = [UIFont systemFontOfSize:14];
        
		lblLineHeight = [[UILabel alloc] init];
		lblLineHeight.textAlignment = UITextAlignmentLeft;
		lblLineHeight.font = fontLbl;
		lblLineHeight.backgroundColor = [UIColor clearColor];
		//lblRank.textColor = [UIColor yellowColor];
		
		lblName = [[UILabel alloc]init];
		lblName.textAlignment = UITextAlignmentLeft;
		lblName.font = fontLbl;
		//lblName.font = [UIFont fontWithName:@"Marker Felt" size:12];
		lblName.backgroundColor = [UIColor clearColor];
		//lblName.textColor = [UIColor redColor];
		
		lblPointSize = [[UILabel alloc] init];
		lblPointSize.textAlignment = UITextAlignmentLeft;
		lblPointSize.font = fontLbl;
		lblPointSize.backgroundColor = [UIColor clearColor];
		//lblReward.textColor = [UIColor yellowColor];
		
		imgCell = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon.png"]];
        
        btnCell = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnCell.autoresizingMask = UIViewAutoresizingNone;
        [btnCell setTitle:@"Press me" forState:UIControlStateNormal];
        //[btnQuest addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
		//DEBUG
        //lblName.backgroundColor = [UIColor blueColor];
        //lblReward.backgroundColor = [UIColor blueColor];
        //lblRequirements.backgroundColor = [UIColor blueColor];
        
        
        [self.contentView addSubview:btnCell];
		[self.contentView addSubview:lblName];
		[self.contentView addSubview:lblPointSize];
        [self.contentView addSubview:lblLineHeight];
		[self.contentView addSubview:imgCell];
        
        //[lblName release];
        //[lblPointSize release];
        //[lblLineHeight release];
        //[imgCell release];
	}
	
	return self;
}

- (void)layoutSubviews {
	
	[super layoutSubviews];
	
	CGRect contentRect = self.contentView.bounds;
	CGFloat boundsX = contentRect.origin.x;
	
    lblName.frame       = CGRectMake(boundsX,  0, 100, 20);
	lblLineHeight.frame	= CGRectMake(boundsX, 30, 150, 20);
	lblPointSize.frame  = CGRectMake(boundsX, 50, 150, 20);
    btnCell.frame       = CGRectMake(contentRect.size.width - 90, 10, 80, 30);
    imgCell.frame       = CGRectMake(btnCell.frame.origin.x - 10 - imgCell.frame.size.width, 10, imgCell.frame.size.width, imgCell.frame.size.height);
}


@end
