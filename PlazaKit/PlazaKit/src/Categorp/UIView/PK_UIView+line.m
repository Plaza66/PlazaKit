//
//  UIView+line.m
//  ProductionManagementAPP
//
//  Created by liyan on 12/27/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

#import "PK_UIView+line.h"

@implementation UIView (PK_line)

- (void)pk_addTopLine:(CGFloat)offX color:(UIColor *)color
{
    UIView *view = view = UIView.new;
    view.backgroundColor = color;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(offX);
        make.top.and.right.equalTo(0);
        make.height.equalTo(0.49);
    }];
}
- (void)pk_addTopLine:(CGFloat)offX offRY:(CGFloat)offRY color:(UIColor *)color
{
    UIView *view = view = UIView.new;
    view.backgroundColor = color;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(offX);
        make.top.equalTo(0);
        make.right.equalTo(offRY);
        make.height.equalTo(0.49);
    }];
}

- (void)pk_addBottomLine:(CGFloat)offX color:(UIColor *)color
{
    UIView *view = view = UIView.new;
    view.backgroundColor = color;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(offX);
        make.bottom.and.right.equalTo(0);
        make.height.equalTo(0.49);
    }];
}
@end
