//
//  AIFLocationUtil.m
//  PGdev
//
//  Created by Gin on 14-2-2.
//  Copyright (c) 2014年 Anjuke Inc. All rights reserved.
//

#import "AIFLocationUtil.h"

@implementation AIFLocationUtil

/**
 * 如果坐标异常，超出中国范围则置空<br>
 * 中国地理位置四至点：<br>
 * 最东端 东经135度2分30秒 黑龙江和乌苏里江交汇处<br>
 * 最西端 东经73度40分 帕米尔高原乌兹别里山口（乌恰县）<br>
 * 最南端 北纬3度52分 南沙群岛曾母暗沙<br>
 * 最北端 北纬53度33分 漠河以北黑龙江主航道（漠河县）
 *
 */
+ (BOOL)checkGeoValue: (id) latitude withLongitude: (id) longitude
{
    double lat = [latitude doubleValue];
    double lng = [longitude doubleValue];
    
    if (lng > 136 || lng < 73 || lat > 54 || lat < 3) {
        return false;
    }
    
    return YES;
}

+ (BOOL)checkGeoValueWithCoordinate: (CLLocationCoordinate2D) coordinate
{
    double lat = coordinate.latitude;
    double lng = coordinate.longitude;
    
    if (lng > 136 || lng < 73 || lat > 54 || lat < 3) {
        return false;
    }
    
    return YES;
}

@end
