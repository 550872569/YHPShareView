//
//  ANShareView.m
//  AudioNote
//
//  Created by sogou on 16/10/12.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANShareView.h"
#import "UILabel+Category.h"
#import "UIButton+Category.h"
#import "Masonry.h"
#import "ColorMacros.h"
#import "ShareViewConst.h"

@interface  ANShareView()<ANShareContentViewDelegate> {
    UIButton *_button;
    CGFloat _btnNumbder;
    UIButton *_buttonBg;
}

@property(nonatomic, strong) UIButton *buttonBg;
@property(nonatomic, strong) ANShareContentView *viewContent;

@end

@implementation ANShareView

- (void)setupWithDelegateShareView:(id)delegateShareView {
    self.delegate = delegateShareView;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    [UIView animateWithDuration:SHARE_ANIMATION_DUTATION animations:^{
        self.backgroundColor = RGBA(0, 0, 0, 0.45);
        self.viewContent.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-SHAREVIEW_HEIGHT_CONST, [UIScreen mainScreen].bounds.size.width, SHAREVIEW_HEIGHT_CONST);
    }];
}
- (void)shareViewHidden {
    [UIView animateWithDuration:SHARE_ANIMATION_DUTATION animations:^{
        self.viewContent.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, SHAREVIEW_HEIGHT_CONST);
        self.backgroundColor = [UIColor clearColor];
    }];
    [self performSelector:@selector(_hidden) withObject:nil afterDelay:SHARE_ANIMATION_DUTATION];
}
- (void)shareContentViewShareType:(AN_SHARE_TYPE)type {
    [self shareViewHidden];
    switch (type) {
        case AN_SHARE_TYPE_SINA:
            if ([self.delegate respondsToSelector:@selector(shareView:shareToSinaAction:)]) {
                [self.delegate shareView:self shareToSinaAction:nil];
            }
            if ([self.delegate respondsToSelector:@selector(shareViewShareType:)]) {
                [self.delegate shareViewShareType:AN_SHARE_TYPE_SINA];
            }
            break;
        case AN_SHARE_TYPE_QQ:
            if ([self.delegate respondsToSelector:@selector(shareView:shareToQQAction:)]) {
                [self shareViewHidden];
                [self.delegate shareView:self shareToQQAction:nil];
            }
            if ([self.delegate respondsToSelector:@selector(shareViewShareType:)]) {
                [self.delegate shareViewShareType:AN_SHARE_TYPE_QQ];
            }
            break;
        case AN_SHARE_TYPE_WECHAT:
            if ([self.delegate respondsToSelector:@selector(shareView:shareToWechatAction:)]) {
                [self.delegate shareView:self shareToWechatAction:nil];
            }
            if ([self.delegate respondsToSelector:@selector(shareViewShareType:)]) {
                [self.delegate shareViewShareType:AN_SHARE_TYPE_WECHAT];
            }
            break;
        case AN_SHARE_TYPE_WECHARZONE:
            if ([self.delegate respondsToSelector:@selector(shareView:shareToWechatZoneAction:)]) {
                [self.delegate shareView:self shareToWechatZoneAction:nil];
            }
            if ([self.delegate respondsToSelector:@selector(shareViewShareType:)]) {
                [self.delegate shareViewShareType:AN_SHARE_TYPE_WECHARZONE];
            }
            break;
        case AN_SHARE_TYPE_EMAIL:
            if ([self.delegate respondsToSelector:@selector(shareView:shareToEmailAction:)]) {
                [self.delegate shareView:self shareToEmailAction:nil];
            }
            if ([self.delegate respondsToSelector:@selector(shareViewShareType:)]) {
                [self.delegate shareViewShareType:AN_SHARE_TYPE_EMAIL];
            }
            break;
        case AN_SHARE_TYPE_CANCEL:
            if ([self.delegate respondsToSelector:@selector(shareView:shareCancelAction:)]) {
                [self.delegate shareView:self shareCancelAction:nil];
            }
            if ([self.delegate respondsToSelector:@selector(shareViewShareType:)]) {
                [self.delegate shareViewShareType:AN_SHARE_TYPE_CANCEL];
            }
            break;
        default:
            break;
    }
}
- (void)buttonShareCancelAction:(UIButton *)sender {
    [self shareViewHidden];
    if ([self.delegate respondsToSelector:@selector(shareView:shareCancelAction:)]) {
        [self.delegate shareView:self shareCancelAction:sender];
    }
    if ([self.delegate respondsToSelector:@selector(shareViewShareType:)]) {
        [self.delegate shareViewShareType:AN_SHARE_TYPE_CANCEL];
    }
}
- (void)_hidden {
    [self removeFromSuperview];
}
- (id)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        [self addSubview:self.buttonBg];
        [self.buttonBg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.equalTo(self);
        }];
        self.viewContent.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, SHAREVIEW_HEIGHT_CONST);
    }
    return self;
}
- (ANShareContentView *)viewContent {
    if (!_viewContent) {
        _viewContent = [[ANShareContentView alloc]init];
        _viewContent.delegateShareContentView = self;
        [self addSubview:_viewContent];
    }
    return _viewContent;
}
- (UIButton *)buttonBg {
    if (!_buttonBg) {
        _buttonBg = [[UIButton alloc]init];
        [self addSubview:_buttonBg];
        _buttonBg.tag = 10;
        _buttonBg.backgroundColor = [UIColor clearColor];
        [_buttonBg addTarget:self action:@selector(buttonShareCancelAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonBg;
}

@end

