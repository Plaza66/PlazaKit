//
//  UIView+ShowTips.h
//  ProductionManagementAPP
//
//  Created by liyan on 12/14/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PK_ShowTips)

- (void)pk_showTipsView:(NSString *)tips;

- (void)pk_showTipsView:(NSString *)tips afterDelay:(NSTimeInterval)delay;

- (void)pk_showTipsView:(NSString *)tips afterDelay:(NSTimeInterval)delay completeBlock:(MBProgressHUDCompletionBlock)completeBlock;

@end
