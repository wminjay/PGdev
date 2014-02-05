//
//  RTFilePathUtil.h
//  anjuke
//
//  Created by Gin on 14-1-26.
//  Copyright (c) 2014年 孟 智. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIFFilePathUtil : NSObject

+ (NSString *)getPathFromAnyWhere:(NSString *)fileName;
+ (NSString *)getPathFromDocument:(NSString *)fileName;
+ (NSString *)getPathFromDefault:(NSString *)fileName;

@end
