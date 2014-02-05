//
//  UDIDWrapper.h
//  PGdev
//
//  Created by Gin on 14-1-27.
//  Copyright (c) 2014年 Gin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UDIDWrapper : NSObject

+ (id)sharedInstance;

- (NSString *)getUDID;
- (void)saveUDID:(NSString *)udid;

@end
