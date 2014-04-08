//
//  UDIDWrapper.m
//  PGdev
//
//  Created by Gin on 14-1-27.
//  Copyright (c) 2014年 Gin. All rights reserved.
//

#import "UDIDWrapper.h"


static NSString *serviceName = @"com.xxxxxApps";
static NSString *udidName = @"xxxxxAppsUDID";
static NSString *pasteboardType = @"xxxxxAppsContent";

@implementation UDIDWrapper

+ (id)sharedInstance
{
    static dispatch_once_t pred;
    static UDIDWrapper *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[UDIDWrapper alloc] init];
    });
    return sharedInstance;
}

- (NSString *)getUDID
{
    NSData *udidData = [self searchKeychainCopyMatching:udidName];
    NSString *udid = nil;
    if (udidData != nil) {
        NSString *temp = [[NSString alloc] initWithData:udidData encoding:NSUTF8StringEncoding];
        udid = [NSString stringWithFormat:@"%@", temp];
    }
    if (udid.length == 0) {
        udid = [self readPasteBoradforIdentifier:udidName];
    }
    return udid;
}

- (void)saveUDID:(NSString *)udid
{
    BOOL saveOk = NO;
    NSData *udidData = [self searchKeychainCopyMatching:udidName];
    if (udidData == nil) {
        saveOk = [self createKeychainValue:udid forIdentifier:udidName];
    }else{
        saveOk = [self updateKeychainValue:udid forIdentifier:udidName];
    }
    if (!saveOk) {
        [self createPasteBoradValue:udid forIdentifier:udidName];
    }
}


- (NSMutableDictionary *)newSearchDictionary:(NSString *)identifier {
    NSMutableDictionary *searchDictionary = [[NSMutableDictionary alloc] init];
    
    searchDictionary[(id)kSecClass] = (id)kSecClassGenericPassword;
    
    NSData *encodedIdentifier = [identifier dataUsingEncoding:NSUTF8StringEncoding];
    searchDictionary[(id)kSecAttrGeneric] = encodedIdentifier;
    searchDictionary[(id)kSecAttrAccount] = encodedIdentifier;
    searchDictionary[(id)kSecAttrService] = serviceName;
    
    return searchDictionary;
}

- (NSData *)searchKeychainCopyMatching:(NSString *)identifier {
    NSMutableDictionary *searchDictionary = [self newSearchDictionary:identifier];
    
    // Add search attributes
    searchDictionary[(id)kSecMatchLimit] = (id)kSecMatchLimitOne;
    
    // Add search return types
    searchDictionary[(id)kSecReturnData] = (id)kCFBooleanTrue;
    
    NSData *result = nil;
    SecItemCopyMatching((CFDictionaryRef)searchDictionary, (CFTypeRef *)&result);
    
    return result;
}

- (BOOL)createKeychainValue:(NSString *)value forIdentifier:(NSString *)identifier {
    NSMutableDictionary *dictionary = [self newSearchDictionary:identifier];
    
    NSData *passwordData = [value dataUsingEncoding:NSUTF8StringEncoding];
    dictionary[(id)kSecValueData] = passwordData;
    
    OSStatus status = SecItemAdd((CFDictionaryRef)dictionary, NULL);
    [dictionary release];
    
    if (status == errSecSuccess) {
        return YES;
    }
    return NO;
}

- (BOOL)updateKeychainValue:(NSString *)value forIdentifier:(NSString *)identifier {
    
    NSMutableDictionary *searchDictionary = [self newSearchDictionary:identifier];
    NSMutableDictionary *updateDictionary = [[NSMutableDictionary alloc] init];
    NSData *passwordData = [value dataUsingEncoding:NSUTF8StringEncoding];
    updateDictionary[(id)kSecValueData] = passwordData;
    
    OSStatus status = SecItemUpdate((CFDictionaryRef)searchDictionary,
                                    (CFDictionaryRef)updateDictionary);
    
    [searchDictionary release];
    [updateDictionary release];
    
    if (status == errSecSuccess) {
        return YES;
    }
    return NO;
}

- (void)deleteKeychainValue:(NSString *)identifier {
    
    NSMutableDictionary *searchDictionary = [self newSearchDictionary:identifier];
    SecItemDelete((CFDictionaryRef)searchDictionary);
    [searchDictionary release];
}

- (void)createPasteBoradValue:(NSString *)value forIdentifier:(NSString *)identifier {
    UIPasteboard *pb = [UIPasteboard pasteboardWithName:serviceName create:YES];
    NSDictionary *dict = @{identifier: value};
    NSData *dictData = [NSKeyedArchiver archivedDataWithRootObject:dict];
    [pb setData:dictData forPasteboardType:pasteboardType];
}

- (NSString *)readPasteBoradforIdentifier:(NSString *)identifier {
    
    UIPasteboard *pb = [UIPasteboard pasteboardWithName:serviceName create:YES];
    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:[pb dataForPasteboardType:pasteboardType]];
    return dict[identifier];
}

@end
