//
//  RTNetworkUtil.m
//  anjuke
//
//  Created by Gin on 14-1-26.
//  Copyright (c) 2014年 孟 智. All rights reserved.
//

#import "AIFNetworkUtil.h"
#import "Reachability.h"

@implementation AIFNetworkUtil

+ (BOOL) connectedToNetwork
{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection)? YES : NO;
}

+ (RTNetworkType)NetworkType
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    RTNetworkType statusCode = RTNetworkNil;
    
    SCNetworkReachabilityFlags flag = [reachability reachabilityFlags];
    
    NSArray *subviews = [[[[UIApplication sharedApplication] valueForKey:@"statusBar"] valueForKey:@"foregroundView"]subviews];
    NSNumber *dataNetworkItemView = nil;
    
    if (subviews) {
        for (id subview in subviews) {
            if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
                dataNetworkItemView = subview;
                break;
            }
        }
    }
    
    if (!dataNetworkItemView) {
        return statusCode;
    }
    
    if(status == ReachableViaWWAN) {
        if ((flag & kSCNetworkReachabilityFlagsReachable) == kSCNetworkReachabilityFlagsReachable &&
            (flag & kSCNetworkReachabilityFlagsTransientConnection) == kSCNetworkReachabilityFlagsTransientConnection) {
            
            switch ([[dataNetworkItemView valueForKey:@"dataNetworkType"] integerValue]) {
                case 0:
                    //No wifi or cellular
                    break;
                case 1:
                    //2G
                    statusCode = RTNetwork2G;
                    break;
                case 2:
                    //3G
                    statusCode = RTNetwork3G;
                    break;
                case 3:
                    //4G
                    statusCode = RTNetwork4G;
                    break;
                case 4:
                    //LTE
                    break;
                case 5:
                    //Wifi
                    break;
                default:
                    break;
            }
        }
    }
    
    [reachability stopNotifier];
    return statusCode;
}

@end
