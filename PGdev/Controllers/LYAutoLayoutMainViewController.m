//
//  LYAutoLayoutMainViewController.m
//  PGdev
//
//  Created by Gin on 14-1-23.
//  Copyright (c) 2014年 Gin. All rights reserved.
//

#import "LYAutoLayoutMainViewController.h"
#import "ASIHTTPRequest.h"

@interface LYAutoLayoutMainViewController () <ASIProgressDelegate>

@end

@implementation LYAutoLayoutMainViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configView];
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

#pragma mark - Private Methods
- (void)configView
{
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1"];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request setDidReceiveDataSelector:@selector(didReceiveData:)];
    // persistent connections Demo
    [request setDataReceivedBlock:^(NSData *data) {
        DLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    [request startAsynchronous];
}

#pragma mark - Public Methods

- (void)didReceiveData:(ASIHTTPRequest *)request
{
    DLog(@"%@", request.requestHeaders);

    DLog(@"%@", request.responseString);
    
    
//    NSLog([[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

- (void)request:(ASIHTTPRequest *)request didReceiveData:(NSData *)data
{
    
}

- (void)request:(ASIHTTPRequest *)request didReceiveBytes:(long long)bytes
{
    
}

- (void)request:(ASIHTTPRequest *)request incrementDownloadSizeBy:(long long)newLength
{
    
}

@end
