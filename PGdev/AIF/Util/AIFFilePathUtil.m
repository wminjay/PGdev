//
//  RTFilePathUtil.m
//  anjuke
//
//  Created by Gin on 14-1-26.
//  Copyright (c) 2014年 孟 智. All rights reserved.
//

#import "AIFFilePathUtil.h"

@implementation AIFFilePathUtil

+ (NSString *)getPathFromAnyWhere:(NSString *)fileName
{
    NSString *path = [self getPathFromDocument:fileName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        return path;
    } else {
        return [self getPathFromDefault:fileName];
    }
}

+ (NSString *)getPathFromDocument:(NSString *)fileName
{
    return [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
            stringByAppendingPathComponent:fileName];
}

+ (NSString *)getPathFromDefault:(NSString *)fileName
{
    if ([fileName rangeOfString:@"."].location != NSNotFound) {
        return [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension] ofType:[fileName pathExtension]];
    } else {
        return @"";
    }
}

@end
