//
//  PKBaseViewController.m
//  ProductionManagementAPP
//
//  Created by liyan on 12/14/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

#import "PKBaseViewController.h"
#define KEYPAHT_LOADINGANIMAL   @"transform.rotation"
#define KEY_LOADINGANIMAL       @"rotationAnimation"

@interface PKBaseViewController()

@property (nonatomic, strong) MBProgressHUD       *pk_progressHUD;
@property (nonatomic, strong) UIImageView         *pk_loadingImageView;

@property (nonatomic, strong) UIBarButtonItem     *pk_leftBarButton;
@property (nonatomic, strong) UIButton            *pk_leftButton;

@property (nonatomic, strong) UIBarButtonItem     *pk_rightBarButton;
@property (nonatomic, strong) UIButton            *pk_rightButton;

@end

@implementation PKBaseViewController

#pragma mark - _progressHUD

- (MBProgressHUD *)pk_progressHUD
{
    if(_pk_progressHUD == nil && self.isViewLoaded)
    {
        _pk_progressHUD        = [[MBProgressHUD alloc] initWithView:self.view];
        _pk_progressHUD.mode   = MBProgressHUDModeCustomView;
        _pk_progressHUD.labelText = @"加载中";
        [self.view addSubview:_pk_progressHUD];
    }
    
    return _pk_progressHUD;
}

- (UIImageView *)pk_loadingImageView
{
    if(_pk_loadingImageView == nil && self.isViewLoaded)
    {
        UIImage *img = nil;
        if([self respondsToSelector:@selector(pk_loadingIMG)])
        {
            img = [self pk_loadingIMG];
        }
        _pk_loadingImageView = [[UIImageView alloc]initWithImage:img];
        
    }
    return _pk_loadingImageView;
}


#pragma mark - nav btn

- (UIBarButtonItem *)pk_leftBarButton
{
    if(_pk_leftBarButton == nil )
    {
        _pk_leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:self.pk_leftButton];
    }
    return _pk_leftBarButton;
}

- (UIButton *)pk_leftButton
{
    if(_pk_leftButton == nil)
    {
        _pk_leftButton    = [UIButton buttonWithType:UIButtonTypeCustom];
        _pk_leftButton.frame  = CGRectMake(0, 0, 60, 25);
        _pk_leftButton.backgroundColor = [UIColor clearColor];
        _pk_leftButton.exclusiveTouch  = YES;
        [_pk_leftButton setTitle:@"返回" forState:UIControlStateNormal];
        
        [_pk_leftButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [_pk_leftButton sizeToFit];
        
        [_pk_leftButton addTarget:self action:@selector(pk_backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _pk_leftButton;
}

- (UIBarButtonItem *)pk_rightBarButton
{
    if(_pk_rightBarButton == nil)
    {
        _pk_rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:self.pk_rightButton];
    }
    return _pk_rightBarButton;
}

- (UIButton *)pk_rightButton
{
    if(_pk_rightButton == nil)
    {
        _pk_rightButton    = [UIButton buttonWithType:UIButtonTypeCustom];
        _pk_rightButton.frame  = CGRectMake(0, 0, 60, 25);
        _pk_rightButton.backgroundColor = [UIColor clearColor];
        _pk_rightButton.exclusiveTouch  = YES;
        [_pk_rightButton addTarget:self action:@selector(pk_rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _pk_rightButton;
}

- (void)pk_backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pk_rightButtonAction
{
    
}

@end

@implementation PKBaseViewController (navigation)

- (void)pk_showBackButton:(BOOL)show
{
    self.navigationItem.hidesBackButton = YES;
    if(show)
    {
        [self pk_setNavLeftButtonSpace];
    }
    else
    {
        [self.navigationItem setLeftBarButtonItems:nil];
    }
}

- (void)pk_hideRightButton:(BOOL)hide
{
    self.pk_rightButton.hidden = hide;
}

- (void)pk_setNavLeftButtonSpace
{
    [self.pk_leftButton sizeToFit];
    [self.navigationItem setLeftBarButtonItem:self.pk_leftBarButton];
}


- (void)pk_showRightButton:(NSString *)buttonTitle
{
    [self pk_showRightButton:buttonTitle andBtnImg:nil];
}

- (void)pk_showRightButton:(NSString *)buttonTitle andBtnImg:(UIImage *)image
{
    [self.pk_rightButton setBackgroundImage:image forState:UIControlStateNormal];
    [self.pk_rightButton setTitle:buttonTitle     forState:UIControlStateNormal];
    
    if (image)
    {
        self.pk_rightButton.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    }
    
    [self pk_setNavRigthButtonSpace];
}

- (void)pk_setNavRigthButtonSpace
{
    [self.pk_rightButton sizeToFit];
    [self.navigationItem setRightBarButtonItem:self.pk_rightBarButton];
}
@end

@implementation PKBaseViewController(loading)

#pragma mark - loading


- (void)pk_bringSubviewToFrontLoading
{
    [self.view bringSubviewToFront:self.pk_progressHUD];
}

- (void)pk_showLoading
{
    [self pk_bringSubviewToFrontLoading];
    [self pk_showLoadingWithCustomView:self.pk_loadingImageView animal:YES];
}

- (void)pk_showLoadingWithCustomView:(UIView*)customView animal:(BOOL)animal
{
    [self pk_showLoadingWithCustomView:customView title:nil animal:animal];
}

- (void)pk_showLoadingWithCustomView:(UIView*)customView title:(NSString*)loadingTitle animal:(BOOL)animal
{
    if(customView == nil)
    {
        customView = self.pk_loadingImageView;
    }
    self.pk_progressHUD.customView = customView;
    
    if(animal)
    {
        [self pk_addAnimation];
    }
    
    if(loadingTitle)
    {
        self.pk_progressHUD.labelText = loadingTitle;
        self.pk_progressHUD.labelFont = [UIFont systemFontOfSize:15];
    }
    [self.pk_progressHUD show:YES];
}

- (void)pk_addAnimation
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation           = [CABasicAnimation animationWithKeyPath:KEYPAHT_LOADINGANIMAL];
    rotationAnimation.toValue   = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration  = 3;
    rotationAnimation.cumulative    = YES;
    rotationAnimation.repeatCount   = CGFLOAT_MAX;
    rotationAnimation.fillMode  = kCAFillModeBoth;
    
    [self.pk_progressHUD.customView.layer addAnimation:rotationAnimation forKey:KEY_LOADINGANIMAL];
}


- (void)pk_hideLoadingWithCompleteBlock:(MBProgressHUDCompletionBlock)completeBlock
{
    self.pk_progressHUD.completionBlock = completeBlock;
    
    [self.pk_progressHUD hide:YES];
    
    [self.pk_progressHUD.customView.layer removeAnimationForKey:KEY_LOADINGANIMAL];
}


@end


@implementation PKBaseViewController(push)

- (void)pk_pushToVC:(UIViewController*)vc animal:(BOOL)animal
{
    [self pk_pushToVC:vc inNav:self.navigationController animal:animal];
}

- (void)pk_pushToVC:(UIViewController*)vc inNav:(UINavigationController*)nav animal:(BOOL)animal
{
    [self pk_pushToVC:vc inNav:nav animal:animal hideTabbar:YES];
}

- (void)pk_pushToVC:(UIViewController*)vc inNav:(UINavigationController*)nav animal:(BOOL)animal hideTabbar:(BOOL)hidden
{
    [vc setHidesBottomBarWhenPushed:hidden];
    [nav pushViewController:vc animated:animal];
    
}

@end
