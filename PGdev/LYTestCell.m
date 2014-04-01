//
//  LYTestCell.m
//  PGdev
//
//  Created by Gin on 3/2/14.
//  Copyright (c) 2014 Anjuke Inc. All rights reserved.
//

#import "LYTestCell.h"

@implementation LYTestCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                                 action:@selector(handleLongPressGesture:)];
        [recognizer setMinimumPressDuration:0.4f];
        [self addGestureRecognizer:recognizer];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - 重载canBecomeFirstResponder
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)becomeFirstResponder
{
    return [super becomeFirstResponder];
}

#pragma mark - Gestures
- (void)handleLongPressGesture:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state != UIGestureRecognizerStateBegan || ![self becomeFirstResponder]) {
        return;
    }
    
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:self.frame inView:self];
    UIMenuItem *delete = [[UIMenuItem alloc] initWithTitle:@"删除"action:@selector(axDelete:)];
    UIMenuItem *copy = [[UIMenuItem alloc] initWithTitle:@"复制"action:@selector(axCopy:)];
    [menu setMenuItems:@[copy, delete]];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleMenuWillShowNotification:)
                                                 name:UIMenuControllerWillShowMenuNotification
                                               object:nil];
    [menu setMenuVisible:YES animated:YES];
}

#pragma mark - Notifications

- (void)handleMenuWillHideNotification:(NSNotification *)notification
{
    DLog(@"handleMenuWillHideNotification");
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIMenuControllerWillHideMenuNotification
                                                  object:nil];
}

- (void)handleMenuWillShowNotification:(NSNotification *)notification
{
    DLog(@"handleMenuWillShowNotification");
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIMenuControllerWillShowMenuNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleMenuWillHideNotification:)
                                                 name:UIMenuControllerWillHideMenuNotification
                                               object:nil];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(axDelete:));
}

#pragma mark - Action
- (void)didRetry
{
}

- (void)axDelete:(id)sender
{

}

- (void)axCopy:(id)sender
{
    
}

- (void)delete:(id)sender
{
    
}
@end
