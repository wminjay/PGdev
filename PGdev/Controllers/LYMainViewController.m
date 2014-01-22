//
//  LYMainViewController.m
//  PGdev
//
//  Created by Gin on 14-1-22.
//  Copyright (c) 2014年 Gin. All rights reserved.
//

#import "LYMainViewController.h"

@interface LYMainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LYMainViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

#pragma mark - Private Methods


#pragma mark - Public Methods


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        default:
            break;
    }

}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"AutoLayoutDemo";
        }
            break;
        case 1:
        {
            cell.textLabel.text = @"test1";
        }
            break;
        case 2:
        {
            cell.textLabel.text = @"test2";
        }
            break;
        default:
            break;
    }
    
    return cell;
}



@end
