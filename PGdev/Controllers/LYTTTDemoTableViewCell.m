//
//  LYTTTDemoTableViewCell.m
//  PGdev
//
//  Created by Gin on 4/1/14.
//  Copyright (c) 2014 Anjuke Inc. All rights reserved.
//

#import "LYTTTDemoTableViewCell.h"

@implementation LYTTTDemoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)configWithTTTLabel:(TTTAttributedLabel *)lable
{
    if ([self viewWithTag:99]) {
        [[self viewWithTag:99] removeFromSuperview];
    }
    lable.tag = 99;
    lable.backgroundColor = [UIColor yellowColor];
    [self addSubview:lable];
}

@end
