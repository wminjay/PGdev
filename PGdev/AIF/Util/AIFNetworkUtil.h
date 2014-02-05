//
//  RTNetworkUtil.h
//  anjuke
//
//  Created by Gin on 14-1-26.
//  Copyright (c) 2014年 孟 智. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    RTNetworkNil  = 0,
    RTNetwork2G3G = 1,
    RTNetworkWIFI = 2,
    RTNetwork2G = 3,
    RTNetwork3G = 4,
    RTNetwork4G = 5,
} RTNetworkType;

@interface AIFNetworkUtil : NSObject

+ (BOOL) connectedToNetwork;
+ (RTNetworkType)NetworkType;

@end
