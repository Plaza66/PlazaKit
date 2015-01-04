//
//  PKBaseViewController.h
//  ProductionManagementAPP
//
//  Created by liyan on 12/14/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@protocol PKBaseViewController<NSObject>

@optional

- (UIImage *)pk_loadingIMG;

- (void)pk_backButtonAction;

- (void)pk_rightButtonAction;

@end

@interface PKBaseViewController : UIViewController<PKBaseViewController>

@end

@interface PKBaseViewController(navigation)

- (void)pk_showBackButton:(BOOL)show;

- (void)pk_hideRightButton:(BOOL)hide;

- (void)pk_showRightButton:(NSString *)buttonTitle;

- (void)pk_showRightButton:(NSString *)buttonTitle andBtnImg:(UIImage *)image;

@end

@interface PKBaseViewController(loading)

- (void)pk_showLoading;

- (void)pk_showLoadingWithCustomView:(UIView*)customView animal:(BOOL)animal;

- (void)pk_showLoadingWithCustomView:(UIView*)customView title:(NSString*)loadingTitle animal:(BOOL)animal;

- (void)pk_hideLoadingWithCompleteBlock:(MBProgressHUDCompletionBlock)completeBlock;

@end


@interface PKBaseViewController(push)

- (void)pk_pushToVC:(UIViewController*)vc animal:(BOOL)animal;

- (void)pk_pushToVC:(UIViewController*)vc inNav:(UINavigationController*)nav animal:(BOOL)animal;

- (void)pk_pushToVC:(UIViewController*)vc inNav:(UINavigationController*)nav animal:(BOOL)animal hideTabbar:(BOOL)hidden;

@end