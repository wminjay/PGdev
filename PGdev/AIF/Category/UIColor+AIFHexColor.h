//
//  UIColor+AIFHexColor.h
//  AIFCore
//
//  Created by Gin on 14-1-27.
//  Copyright (c) 2014年 Anjuke Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AIFHexColor)

+ (UIColor *)colorWithHex:(uint)hex alpha:(CGFloat)alpha;

+ (UIColor *)afBlackColor;
+ (UIColor *)afBorderColor;
+ (UIColor *)afGrayColor;
+ (UIColor *)afOrangeColor;
+ (UIColor *)afRedColor;
+ (UIColor *)afGrayBGColor;
+ (UIColor *)afGraySectionColor;
+ (UIColor *)afGrayLine1Color;
+ (UIColor *)afWhiteLine1Color;
+ (UIColor *)afGrayLine2Color;
+ (UIColor *)afWhiteLine2Color;
+ (UIColor *)afImageBorderColor;
+ (UIColor *)afTableViewBGColor;
+ (UIColor *)afGrayTGSmallColor;
+ (UIColor *)afGrayTGLargeColor;

+ (UIColor *)ajkGreenColor;
+ (UIColor *)ajkGrayLineColor;

+ (UIColor *)priceOrangeColor;
+ (UIColor *)filterSelectedColor;
+ (UIColor *)cellSeparatorLineColor;

@end
