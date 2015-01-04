//
//  UIView+line.h
//  ProductionManagementAPP
//
//  Created by liyan on 12/27/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PK_line)

- (void)pk_addTopLine:(CGFloat)offX color:(UIColor *)color;
- (void)pk_addTopLine:(CGFloat)offX offRY:(CGFloat)offRY color:(UIColor *)color;
- (void)pk_addBottomLine:(CGFloat)offX  color:(UIColor *)color;

@end
