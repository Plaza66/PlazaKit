//
//  UIView+ShowTips.m
//  ProductionManagementAPP
//
//  Created by liyan on 12/14/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

#import "PK_UIView+ShowTips.h"
@implementation UIView (PK_ShowTips)

- (void)pk_showTipsView:(NSString *)tips afterDelay:(NSTimeInterval)delay completeBlock:(MBProgressHUDCompletionBlock)completeBlock
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.completionBlock = completeBlock;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = tips;
    hud.margin = 10.f;
    hud.yOffset = 0.0;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:delay];
}

- (void)pk_showTipsView:(NSString *)tips
{
    [self pk_showTipsView:tips afterDelay:1];
}

- (void)pk_showTipsView:(NSString *)tips
          afterDelay:(NSTimeInterval)delay
{
    [self pk_showTipsView:tips afterDelay:delay completeBlock:nil];
}

@end
