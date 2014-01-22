//
//  main.m
//  PGdev
//
//  Created by Gin on 14-1-22.
//  Copyright (c) 2014年 Gin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LYAppDelegate.h"
#import <UI7Kit/UI7Kit.h>

int main(int argc, char * argv[])
{
    @autoreleasepool {
        [UI7Kit patchIfNeeded];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([LYAppDelegate class]));
    }
}
