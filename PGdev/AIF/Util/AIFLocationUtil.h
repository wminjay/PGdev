//
//  AIFLocationUtil.h
//  PGdev
//
//  Created by Gin on 14-2-2.
//  Copyright (c) 2014年 Anjuke Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AIFLocationUtil : NSObject

+ (BOOL)checkGeoValue: (id) latitude withLongitude: (id) longitude;
+ (BOOL)checkGeoValueWithCoordinate: (CLLocationCoordinate2D) coordinate;

@end
