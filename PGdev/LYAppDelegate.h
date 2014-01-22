//
//  LYAppDelegate.h
//  PGdev
//
//  Created by Gin on 14-1-22.
//  Copyright (c) 2014年 Gin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
