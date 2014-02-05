//
//  UIColor+AIFHexColor.m
//  AIFCore
//
//  Created by Gin on 14-1-27.
//  Copyright (c) 2014年 Anjuke Inc. All rights reserved.
//

#import "UIColor+AIFHexColor.h"

@implementation UIColor (AIFHexColor)

+ (UIColor *)colorWithHex:(uint)hex alpha:(CGFloat)alpha {
    int red, green, blue;
    blue = hex & 0x0000FF;
    green = ((hex & 0x00FF00) >> 8);
    red = ((hex & 0xFF0000) >> 16);
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+ (UIColor *)afTableViewBGColor {
    return [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1];
}

+ (UIColor *)afBlackColor{
    return [self colorWithHex:0x222222 alpha:1];
}

+ (UIColor *)afBorderColor{
    return [self colorWithHex:0xeeeeee alpha:1];
}

+ (UIColor *)afGrayColor{
    return [self colorWithHex:0x444444 alpha:1];
}

+ (UIColor *)afOrangeColor{
    return [self colorWithHex:0xEF5E00 alpha:1];
}

+ (UIColor *)afRedColor{
    return [self colorWithHex:0xda1800 alpha:1];
}

+ (UIColor *)afGrayBGColor{
    return [self colorWithHex:0xf2f2f2 alpha:1];
}

+ (UIColor *)afGraySectionColor{
    return [self colorWithHex:0xe1e1e1 alpha:1];
}

+ (UIColor *)afGrayLine1Color{
    return [self colorWithHex:0xc6c6c6 alpha:1];
}

+ (UIColor *)afWhiteLine1Color{
    return [self colorWithHex:0xffffff alpha:1];
}

+ (UIColor *)afGrayLine2Color{
    return [self colorWithHex:0xCFCFCF alpha:1];
}

+ (UIColor *)afWhiteLine2Color{
    return [self colorWithHex:0xf7f7f7 alpha:1];
}

+ (UIColor *)afImageBorderColor{
    return [self colorWithHex:0xdddddd alpha:1];
}

+ (UIColor *)afGrayTGSmallColor{
    return [self colorWithHex:0x7E7E7E alpha:1];
}

+ (UIColor *)afGrayTGLargeColor{
    return [self colorWithHex:0x666666 alpha:1];
}

+ (UIColor *)ajkGreenColor{
    return [self colorWithHex:0x58a900 alpha:1];
}

+ (UIColor *)ajkGrayLineColor{
    return [self colorWithHex:0xc0c0c0 alpha:1];
}

+ (UIColor *)priceOrangeColor{
    return [self orangeColor];
}

+ (UIColor *)filterSelectedColor{
    return [self colorWithHex:0x5da500 alpha:1];
}

+ (UIColor *)cellSeparatorLineColor {
    return [UIColor colorWithRed:.783922 green:.780392 blue:.8 alpha:1];
}

@end
