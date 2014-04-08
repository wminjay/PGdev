//
//  LYTTTDemoTableViewController.m
//  PGdev
//
//  Created by Gin on 4/1/14.
//  Copyright (c) 2014 Anjuke Inc. All rights reserved.
//

#import "LYTTTDemoTableViewController.h"
#import "AXTTTAttributedLabel.h"
#import "LYTTTDemoTableViewCell.h"

@interface LYTTTDemoTableViewController () <AXTTTAttributedLabelDelegate>

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
    
    [self.dataList addObject:@"sdjaskdjas dasds http://www.baidu.com dsadasd 13916968111 kdjaskd[tx]a[ty]bb[tz]c[tx]d[ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz][tx][ty][tz]ja dakas jdas[tx][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz][tz]k adja[中国]ks jdask"];
    
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
        AXTTTAttributedLabel *label = nil;
        label = [[AXTTTAttributedLabel alloc] init];
        label.numberOfLines = 0;
        label.enabledTextCheckingTypes = (NSTextCheckingTypeLink | NSTextCheckingTypePhoneNumber);
        NSArray *array = @[@{@"name":@"tx", @"width":@"18", @"ascent":@"16", @"descent":@"2", @"image":@"Expression_21.png"},@{@"name":@"ty", @"width":@"18", @"ascent":@"16", @"descent":@"2", @"image":@"Expression_56.png"},@{@"name":@"tz", @"width":@"18", @"ascent":@"16", @"descent":@"2", @"image":@"Expression_57.png"}];
        label.imageBricks = array;
        label.font = [UIFont systemFontOfSize:18.0];
        label.text = obj;
        label.lineBreakMode = kCTLineBreakByWordWrapping;
        label.delegate = self;
        
        NSMutableDictionary *mutableActiveLinkAttributes = [NSMutableDictionary dictionary];
        [mutableActiveLinkAttributes setValue:@NO forKey:(NSString *)kCTUnderlineStyleAttributeName];
        [mutableActiveLinkAttributes setValue:(__bridge id)[[UIColor redColor] CGColor] forKey:(NSString *)kCTForegroundColorAttributeName];
        label.activeLinkAttributes = mutableActiveLinkAttributes;
        label.linkAttributes = @{(NSString *)kCTUnderlineStyleAttributeName:@NO, (NSString *)kCTForegroundColorAttributeName:(__bridge id)[[UIColor blueColor] CGColor]};
        
        CGSize size = [AXTTTAttributedLabel sizeThatFitsAttributedString:label.attributedText
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
    CGSize size = [AXTTTAttributedLabel sizeThatFitsAttributedString:((AXTTTAttributedLabel *)self.labelList[indexPath.row]).attributedText
                                                   withConstraints:CGSizeMake(194.0, 10000.0)
                                            limitedToNumberOfLines:0];

    DLog(@"size:(%f,%f)", size.width, size.height);
    return size.height + 20;
}

#pragma mark - AXTTTAttributedLabelDelegate
- (void)attributedLabel:(AXTTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{
    DLog(@"didSelectLinkWithURL");
}

- (void)attributedLabel:(AXTTTAttributedLabel *)label didSelectLinkWithAddress:(NSDictionary *)addressComponents
{
    DLog(@"didSelectLinkWithAddress");
}

- (void)attributedLabel:(AXTTTAttributedLabel *)label didSelectLinkWithPhoneNumber:(NSString *)phoneNumber
{
    DLog(@"didSelectLinkWithPhoneNumber");
}

@end
