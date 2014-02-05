//
//  LYMainViewController.m
//  PGdev
//
//  Created by Gin on 14-1-22.
//  Copyright (c) 2014年 Gin. All rights reserved.
//

#import "LYMainViewController.h"
#import "LYAutoLayoutMainViewController.h"

@interface LYMainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LYMainViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self test];
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

#pragma mark - Private Methods
- (void)test
{
    
    NSString *macAddress = [[NSUserDefaults standardUserDefaults] objectForKey:@"macAddress"];
    DLog(@"macAddress:%@", macAddress);
    
    // 本地通知 Demo
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil) {
        
        NSDate *now=[NSDate new];
        notification.fireDate = [now dateByAddingTimeInterval:6];
        notification.repeatInterval = kCFCalendarUnitHour;
        
        notification.timeZone = [NSTimeZone defaultTimeZone];
        notification.soundName = UILocalNotificationDefaultSoundName;
        notification.alertBody = @"test";
        
        notification.alertAction = @"open";
        notification.hasAction = YES;
        
        NSDictionary* infoDic = @{@"name":@"floyd"};
        notification.userInfo = infoDic;
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
    
}

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
            LYAutoLayoutMainViewController *autoLayoutMainViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"autoLayout"];
            [self.navigationController pushViewController:autoLayoutMainViewController animated:YES];
            break;
        }
        case 1:
        {
            
            break;
        }
        case 2:
        {
            
            break;
        }
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
            cell.textLabel.text = @"CoreData";
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
