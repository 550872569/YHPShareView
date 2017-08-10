//
//  ANShareSeleteView.m
//  AudioNote
//
//  Created by sogou-Yan on 17/1/16.
//  Copyright © 2017年 YY. All rights reserved.
//

#import "ANShareSeleteView.h"
#import "Masonry.h"
#import "ColorMacros.h"
#import "ANShareSeleteContentView.h"
#import "ShareViewConst.h"

@interface ANShareSeleteView ()<ANShareSeleteContentViewDelegate>

@property(nonatomic, strong) UIButton *buttonBg;
@property(nonatomic, strong) ANShareSeleteContentView *viewContent;

@end

@implementation ANShareSeleteView

- (void)setupWithDelegateShareSeleteView:(id)delegateShareSeleteView {
    self.delegate = delegateShareSeleteView;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    [UIView animateWithDuration:SHARESELECTE_ANIMATION_DUTATION animations:^{
        self.backgroundColor = RGBA(0, 0, 0, 0.45);
        [self.viewContent setFrame:CGRectMake(0, self.viewContent.frame.origin.y-206, [UIScreen mainScreen].bounds.size.width, 206)];
    }];
}
- (void)shareSeleteViewHidden {
    [UIView animateWithDuration:SHARESELECTE_ANIMATION_DUTATION animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.viewContent.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, SHARESELECTVIEW_HEIGHT_CONST);
    }];
    [self performSelector:@selector(_hidden) withObject:nil afterDelay:SHARESELECTE_ANIMATION_DUTATION];
}
- (void)shareSeleteContentView:(UIView *)view shareSeleteTextAction:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(shareSeleteView:shareSeleteTextAction:)]) {
        [self shareSeleteViewHidden];
        [self.delegate shareSeleteView:self shareSeleteTextAction:sender];
    }
}
- (void)shareSeleteContentView:(UIView *)view shareSeletePictureAction:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(shareSeleteView:shareSeletePictureAction:)]) {
        [self shareSeleteViewHidden];
        [self.delegate shareSeleteView:self shareSeletePictureAction:sender];
    }
}
- (void)shareSeleteContentView:(UIView *)view shareSeleteLinkAction:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(shareSeleteView:shareSeleteLinkAction:)]) {
        [self shareSeleteViewHidden];
        [self.delegate shareSeleteView:self shareSeleteLinkAction:sender];
    }
}
- (void)shareSeleteContentView:(UIView *)view shareSeleteCancelAction:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(shareSeleteView:shareSeleteCancelAction:)]) {
        [self shareSeleteViewHidden];
        [self.delegate shareSeleteView:self shareSeleteCancelAction:sender];
    }
}

- (void)buttonSeleteCancelAction:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(shareSeleteView:shareSeleteCancelAction:)]) {
        [self shareSeleteViewHidden];
        [self.delegate shareSeleteView:self shareSeleteCancelAction:sender];
    }
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width), ([UIScreen mainScreen].bounds.size.height));
        [self addSubview:self.buttonBg];
        [self.buttonBg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.equalTo(self);
        }];
        self.viewContent.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, SHARESELECTVIEW_HEIGHT_CONST);
    }
    return self;
}
- (ANShareSeleteContentView *)viewContent {
    if (!_viewContent) {
        _viewContent = [[ANShareSeleteContentView alloc]init];
        _viewContent.delegateShareSeleteContentView = self;
        [self addSubview:_viewContent];
    }
    return _viewContent;
}
- (UIButton *)buttonBg {
    if (!_buttonBg) {
        _buttonBg = [[UIButton alloc]init];
        [self addSubview:_buttonBg];
        _buttonBg.tag = 5;
        _buttonBg.backgroundColor = [UIColor clearColor];
        [_buttonBg addTarget:self action:@selector(buttonSeleteCancelAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonBg;
}
- (void)_hidden {
    [self removeFromSuperview];
}

@end
