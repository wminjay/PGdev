//
//  LYMainViewController.m
//  PGdev
//
//  Created by Gin on 14-1-22.
//  Copyright (c) 2014年 Gin. All rights reserved.
//

#import "LYMainViewController.h"
#import "LYAutoLayoutMainViewController.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import "LYTestCell.h"
#import "NimbusAttributedLabel.h"

@interface LYMainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation LYMainViewController

#pragma mark - Test Function
- (void)testUILable
{
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 200, 100)];
//    label.backgroundColor = [UIColor yellowColor];
//    label.numberOfLines = 0;
//    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:@"baidu.com 1391596894 babab 百度 aabab sdss sdfdf"];
//    NSAttributedString *linkStr = [[NSAttributedString alloc] initWithString:@"Baidu" attributes:@{NSLinkAttributeName: @"http://baidu.com"}];
//    label.attributedText = linkStr;
//    [self.view addSubview:label];
    
    
    
    // iOS 7-only.
//    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
//    self.view.backgroundColor = [UIColor whiteColor];
//    
//    NIAttributedLabel* label = [[NIAttributedLabel alloc] initWithFrame:CGRectZero];
//    label.numberOfLines = 0;
//    label.lineBreakMode = NSLineBreakByWordWrapping;
//    label.autoresizingMask = UIViewAutoresizingFlexibleDimensions;
//    label.frame = CGRectInset(self.view.bounds, 20, 20);
//    label.font = [UIFont fontWithName:@"AmericanTypewriter" size:15];
//    
//    // When the user taps a link we can change the way the link text looks.
//    label.attributesForHighlightedLink = @{NSForegroundColorAttributeName: RGBCOLOR(255, 0, 0)};
//    
//    // In order to handle the events generated by the user tapping a link we must implement the
//    // delegate.
//    label.delegate = self;
//    
//    // By default the label will not automatically detect links. Turning this on will cause the label
//    // to pass through the text with an NSDataDetector, highlighting any detected URLs.
//    label.autoDetectLinks = YES;
//    
//    // By default links do not have underlines and this is generally accepted as the standard on iOS.
//    // If, however, you do wish to show underlines, you can enable them like so:
//    label.linksHaveUnderlines = NO;
//    
//    label.text =
//    @"A screen on the dash flickers and displays an artist's rendition of the planet."
//    // We can use \n characters to separate lines of text.
//    @"\nSigned beneath the image: tenach.deviantart.com";
//    
//    NSRange linkRange = [label.text rangeOfString:@"an artist's rendition of the planet"];
//    
//    // Explicitly adds a link at a given range.
//    [label addLink:[NSURL URLWithString:@"http://th04.deviantart.net/fs71/300W/f/2010/145/c/9/Planet_Concept_1_by_Tenach.jpg"]
//             range:linkRange];
//    
//    [self.view addSubview:label];

    
    
}

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;

    [super viewDidLoad];
    self.dataList = [NSMutableArray array];
    [self.dataList addObject:@"a"];
    
//    [self testUILable];
    
    
    
    [self.dataList addObject:@"b"];
    [self.dataList addObject:@"c"];
    [self.dataList addObject:@"c"];
    [self.dataList addObject:@"c"];
    [self.dataList addObject:@"c"];
    [self.dataList addObject:@"c"];
    [self.dataList addObject:@"c"];
    [self.dataList addObject:@"c"];
    [self.dataList addObject:@"c"];
    [self.dataList addObject:@"c"];
    [self.dataList addObject:@"c"];
    [self.dataList addObject:@"c"];
    [self.dataList addObject:@"c"];
    [self.dataList addObject:@"c"];
    [self.dataList addObject:@"c"];
//    [self test];
    
//    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
//    CTCarrier *carrier = [netinfo subscriberCellularProvider];
//    NSLog(@"Carrier Name: %@", [carrier carrierName]);
    
    
//    NSString *str = @"abcd12345mnopq";
//    NSComparisonResult result = [str compare:@"23" options:NSNumericSearch];
//    NSURL *documentURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:NULL];
//    documentURL = [documentURL URLByAppendingPathComponent:name];
//    int fd = open(documentURL.fileSystemRepresentation, O_RDONLY);
    
//    NSError *error = nil;
//    NSFileManager *fm = [[NSFileManager alloc] init];
//    NSURL *documents = [fm URLForDirectory:NSDocumentationDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:&error];
//    NSArray *properties = @[NSURLLocalizedNameKey, NSURLCreationDateKey];
//    NSDirectoryEnumerator *dirEnumerator = [fm enumeratorAtURL:documents
//                                    includingPropertiesForKeys:properties
//                                                       options:0
//                                                  errorHandler:nil];
//    for (NSURL *fileURL in dirEnumerator) {
//        NSString *name = nil;
//        NSDate *creationDate = nil;
//        if ([fileURL getResourceValue:&name forKey:NSURLLocalizedNameKey error:NULL] &&
//            [fileURL getResourceValue:&creationDate forKey:NSURLCreationDateKey error:NULL])
//        {
//            NSLog(@"'%@' was created at %@", name, creationDate);
//        }
//    }
    
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
//    UILocalNotification *notification=[[UILocalNotification alloc] init];
//    if (notification!=nil) {
//        
//        NSDate *now=[NSDate new];
//        notification.fireDate = [now dateByAddingTimeInterval:6];
//        notification.repeatInterval = kCFCalendarUnitHour;
//        
//        notification.timeZone = [NSTimeZone defaultTimeZone];
//        notification.soundName = UILocalNotificationDefaultSoundName;
//        notification.alertBody = @"test";
//        
//        notification.alertAction = @"open";
//        notification.hasAction = YES;
//        
//        NSDictionary* infoDic = @{@"name":@"floyd"};
//        notification.userInfo = infoDic;
//        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
//    }
    
}

#pragma mark - Public Methods

static CGPoint  delayOffset = {0.0};

- (void)controllerWillChangeContent:(NSFetchedResultsController*)controller {
    delayOffset = self.tableView.contentOffset; // get the current scroll setting
}

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
            NSMutableArray *insertIndexPaths = [NSMutableArray arrayWithCapacity:10];
            NSIndexPath *newPath =  [NSIndexPath indexPathForRow:0 inSection:0];
            NSIndexPath *newPath1 =  [NSIndexPath indexPathForRow:1 inSection:0];
            NSIndexPath *newPath2 =  [NSIndexPath indexPathForRow:2 inSection:0];
            NSIndexPath *newPath3 =  [NSIndexPath indexPathForRow:3 inSection:0];

            [insertIndexPaths addObject:newPath];
            [insertIndexPaths addObject:newPath1];
            [insertIndexPaths addObject:newPath2];
            [insertIndexPaths addObject:newPath3];


//            [self.tableView reloadRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationNone];
            
            [self.dataList insertObject:@"x" atIndex:0];
            [self.dataList insertObject:@"y" atIndex:0];
            [self.dataList insertObject:@"z" atIndex:0];
            [self.dataList insertObject:@"m" atIndex:0];
            
            
//            [self.tableView beginUpdates];
//            [self.tableView insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationNone];
//            [self.tableView endUpdates];

            [self.tableView reloadData];
            CGFloat testH =  [self tableView:[self tableView] heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] * 4;
            CGPoint offset = [[self tableView] contentOffset];

            offset.y = testH;
//            if (offset.y > [[self tableView] contentSize].height) {
//                offset.y = 0;
//            }
            offset.y -= 50;
            DLog(@"offset.y:%f", offset.y);
            [[self tableView] setContentOffset:offset animated:NO];
//            [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionBottom animated:YES];
//            UIEdgeInsets insets = UIEdgeInsetsZero;
//            insets.top =  -testH + 250;
//            insets.bottom = 500;
//            self.tableView.contentInset = insets;
//            self.tableView.scrollIndicatorInsets = insets;

            
            
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
    return [self.dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYTestCell *cell = [[LYTestCell alloc] init];
    cell.textLabel.text = [NSString stringWithFormat:@"indexPath.row:%d，%@", indexPath.row, self.dataList[indexPath.row]];
//    DLog(@"%d", indexPath.row);
    return cell;
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
