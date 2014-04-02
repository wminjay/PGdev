//
//  LYTTTDemoTableViewController.m
//  PGdev
//
//  Created by Gin on 4/1/14.
//  Copyright (c) 2014 Anjuke Inc. All rights reserved.
//

#import "LYTTTDemoTableViewController.h"
#import "TTTAttributedLabel.h"
#import "LYTTTDemoTableViewCell.h"

@interface LYTTTDemoTableViewController ()

@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) NSMutableArray *labelList;

@end

@implementation LYTTTDemoTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _dataList = [NSMutableArray array];
        _labelList = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self.dataList addObject:@"123456789012345678901234567890123456789012345678901234567890"];
    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[ty]bb[tz]c[tx]d[ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz]ja dakas jdas[tx][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz]k adjaks jdask"];
//    [self.dataList addObject:@"的附件是咖啡机上岛咖啡看的[tx]a[tx]b[tx]发的说法是[tx]1[tx]1飞1[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx]愚[tx]人[tx]节[tx]快[tx]乐[tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx]愚[tx]人[tx]节[tx]快[tx]乐[tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdasksdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx]愚[tx]人[tx]节[tx]快[tx]乐[tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdasksdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx]愚[tx]人[tx]节[tx]快[tx]乐[tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdasksdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx]愚[tx]人[tx]节[tx]快[tx]乐[tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdasksdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx]愚[tx]人[tx]节[tx]快[tx]乐[tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdasksdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx]愚[tx]人[tx]节[tx]快[tx]乐[tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdasksdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx]愚[tx]人[tx]节[tx]快[tx]乐[tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdasksdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx]愚[tx]人[tx]节[tx]快[tx]乐[tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdasksdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx]愚[tx]人[tx]节[tx]快[tx]乐[tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdasksdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx]愚[tx]人[tx]节[tx]快[tx]乐"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];
//    [self.dataList addObject:@"sdjaskdjaskdjaskd[tx]a[tx]b[tx]c[tx]d[tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx][tx]ja dakas jdas[tx]k adjaks jdask"];

    [self.dataList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        TTTAttributedLabel *label = nil;
        label = [[TTTAttributedLabel alloc] init];
        label.numberOfLines = 0;
        NSArray *array = @[@{@"name":@"tx", @"width":@"18", @"ascent":@"16", @"descent":@"2", @"image":@"Expression_21.png"},@{@"name":@"ty", @"width":@"18", @"ascent":@"16", @"descent":@"2", @"image":@"Expression_56.png"},@{@"name":@"tz", @"width":@"18", @"ascent":@"16", @"descent":@"2", @"image":@"Expression_57.png"}];
        label.imageBricks = array;
        label.font = [UIFont systemFontOfSize:18.0];
        label.text = obj;
        label.lineBreakMode = kCTLineBreakByWordWrapping;
        CGSize size = [TTTAttributedLabel sizeThatFitsAttributedString:label.attributedText
                                                       withConstraints:CGSizeMake(194.0, 10000.0)
                                                limitedToNumberOfLines:0];

        label.frame = CGRectMake(0, 10, size.width, size.height);
        [self.labelList addObject:label];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYTTTDemoTableViewCell *cell = [[LYTTTDemoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"testCell"];
    [cell configWithTTTLabel:self.labelList[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = [TTTAttributedLabel sizeThatFitsAttributedString:((TTTAttributedLabel *)self.labelList[indexPath.row]).attributedText
                                                   withConstraints:CGSizeMake(194.0, 10000.0)
                                            limitedToNumberOfLines:0];

    DLog(@"size:(%f,%f)", size.width, size.height);
    return size.height + 20;
}

@end