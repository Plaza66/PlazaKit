//
//  UITextField+InputView.m
//  QianbaoIM
//
//  Created by liyan on 10/18/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

#import "PK_UITextField+InputView.h"

@implementation UITextField (PK_InputView)

- (void)pk_showInputView
{
    UIColor *titleColor = [UIColor colorWithRed:12/256.0f green:77/256.0f blue:254/256.0f alpha:1.0];;
    UIImage *bgImage    = [UIImage imageNamed:@"PK_keboard_7.png"];
    CGFloat bgWidth     =  CGRectGetWidth([UIApplication sharedApplication].keyWindow.frame);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, bgWidth, 39)];
    view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    UIButton *btnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    btnButton.frame = CGRectMake(bgWidth - 60, 0, 60, 39);
    [btnButton addTarget:self action:@selector(_pk_doFinish) forControlEvents:UIControlEventTouchUpInside];
    [btnButton setTitle:@"完成" forState:UIControlStateNormal];
    [btnButton.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [btnButton setTitleColor:titleColor forState:UIControlStateNormal];
    [view addSubview:btnButton];
    self.inputAccessoryView = view;
}

- (void)_pk_doFinish
{
    [self resignFirstResponder];
}

- (void)pk_hideInputView
{
    self.inputAccessoryView = nil;
}


@end
