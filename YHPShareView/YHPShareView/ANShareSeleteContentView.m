//
//  ANShareSeleteContentView.m
//  AudioNote
//
//  Created by sogou-Yan on 17/5/22.
//  Copyright © 2017年 YY. All rights reserved.
//

#import "ANShareSeleteContentView.h"
#import "UIButton+Category.h"
#import "Masonry.h"
#import "ColorMacros.h"

#define kButtonShareSeleteFont          17
#define kButtonShareSeleteText          @"用文字方式分享"
#define kButtonShareSeletePicture       @"用图片方式分享"
#define kButtonShareSeleteLink          @"用链接方式分享（适合文字较多）"
#define kButtonCancelTitle                                      @"取消"
#define OFFSET_LINE_HEIGHT                      0.5
#define SHARESELECTVIEW_HEIGHT_CONST            206
#define SHARESELECTE_ANIMATION_DUTATION         0.5

@implementation ANShareSeleteContentView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, SHARESELECTVIEW_HEIGHT_CONST);
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.backgroundColor = RGBA(79, 110, 146, 0.65);
    const NSInteger seleteButtonCount = 4;
    NSString *buttonTitle;
    UIColor *buttonBackgroundColor;
    UIColor *buttonTitleColor;
    CGFloat buttonCornerRadius = 5;
    UIColor *buttonBorderColor;
    for (NSInteger i = 0; i <seleteButtonCount; i ++) {
        switch (i) {
            case 0:
                buttonTitle = kButtonShareSeleteText;
                buttonBackgroundColor = [UIColor clearColor];
                buttonTitleColor = [UIColor whiteColor];
                buttonBorderColor = [UIColor clearColor];
                break;
            case 1:
                buttonTitle = kButtonShareSeletePicture;
                buttonBackgroundColor = [UIColor clearColor];
                buttonTitleColor = [UIColor whiteColor];
                buttonBorderColor = [UIColor clearColor];
                break;
            case 2:
                buttonTitle = kButtonShareSeleteLink;
                buttonBackgroundColor = [UIColor clearColor];
                buttonTitleColor = [UIColor whiteColor];
                buttonBorderColor = [UIColor clearColor];
                break;
            case 3:
                buttonTitle = kButtonCancelTitle;
                buttonBackgroundColor = [UIColor clearColor];
                buttonTitleColor = [UIColor whiteColor];
                buttonBorderColor = [UIColor clearColor];
                break;
            default:
                break;
        }
        UIButton *button = [UIButton buttonWithTitle:buttonTitle titleFont:kButtonShareSeleteFont titleColor:buttonTitleColor backgroundColor:buttonBackgroundColor cornerRadius:buttonCornerRadius tag:i borderColor:buttonBorderColor borderWidth:1];
        [button addTarget:self action:@selector(buttonSeleteAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        UIImageView *imageViewLine = [[UIImageView alloc]init];
        imageViewLine.tag = i;
        if (i<3) {
            imageViewLine.backgroundColor = RGB(255, 255, 255);
            imageViewLine.alpha = 0.2;
        }
        [self addSubview:imageViewLine];
    }
}

- (void)layoutSubviews {

    [super layoutSubviews];
    CGRect frame = CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width), SHARESELECTVIEW_HEIGHT_CONST);
    CGFloat topOffset = 0;
    for (UIButton *button in self.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            if (button.tag == 0) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self);
                    make.height.equalTo(@((frame.size.height-5)*0.25));
                    make.width.equalTo(@(frame.size.width));
                    make.top.equalTo(self.mas_top).with.offset(topOffset);
                }];
            } else if (button.tag == 1) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self);
                    make.top.equalTo(self.mas_top).with.offset(((frame.size.height-5)*0.25)+topOffset);
                    make.height.equalTo(@((frame.size.height-5)*0.25));
                    make.width.equalTo(@(frame.size.width));
                }];
            } else if (button.tag == 2) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    [button mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerX.equalTo(self);
                        make.bottom.equalTo(self.mas_bottom).with.offset(-((frame.size.height-5)*0.25)-5);
                        make.height.equalTo(@((frame.size.height-5)*0.25));
                        make.width.equalTo(@(frame.size.width));
                    }];
                }];
            } else if (button.tag == 3) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    [button mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerX.equalTo(self);
                        make.height.equalTo(@((frame.size.height-5)*0.25));
                        make.width.equalTo(@(frame.size.width));
                        make.bottom.equalTo(self.mas_bottom);
                    }];
                }];
            } else if (button.tag == 5) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    [button mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.left.right.top.bottom.equalTo(self);
                    }];
                }];
            }
        }
        if ([button isKindOfClass:[UIImageView class]]) {
            if (button.tag == 0) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self);
                    make.height.equalTo(@0);
                    make.width.equalTo(@(frame.size.width));
                    make.top.equalTo(self.mas_top).with.offset(topOffset);
                }];
            } else if (button.tag == 1) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self);
                    make.top.equalTo(self.mas_top).with.offset(((frame.size.height-5)*0.25)+topOffset-1);
                    make.height.equalTo(@OFFSET_LINE_HEIGHT);
                    make.width.equalTo(@(frame.size.width));
                }];
            } else if (button.tag == 2) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    [button mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerX.equalTo(self);
                        make.bottom.equalTo(self.mas_bottom).with.offset(-(frame.size.height-5)*0.5-5);
                        make.height.equalTo(@OFFSET_LINE_HEIGHT);
                        make.width.equalTo(@(frame.size.width));
                    }];
                }];
            } else if (button.tag == 3) {
                button.backgroundColor = RGB(50, 69, 90);
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    [button mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerX.equalTo(self);
                        make.height.equalTo(@5);
                        make.width.equalTo(@(frame.size.width));
                        make.bottom.equalTo(self.mas_bottom).with.offset(-(frame.size.height-5)*0.25);
                    }];
                }];
            }
        }
    }
}


- (void)buttonSeleteAction:(UIButton *)sender {
    if (sender.tag == 0) {
        if (self.delegateShareSeleteContentView && [self.delegateShareSeleteContentView respondsToSelector:@selector(shareSeleteContentView:shareSeleteTextAction:)]) {
            [self.delegateShareSeleteContentView shareSeleteContentView:self shareSeleteTextAction:sender];
        }
    } else if (sender.tag == 1) {
        if (self.delegateShareSeleteContentView && [self.delegateShareSeleteContentView respondsToSelector:@selector(shareSeleteContentView:shareSeletePictureAction:)]) {
            [self.delegateShareSeleteContentView shareSeleteContentView:self shareSeletePictureAction:sender];
        }
    } else if (sender.tag == 2) {
        if (self.delegateShareSeleteContentView && [self.delegateShareSeleteContentView respondsToSelector:@selector(shareSeleteContentView:shareSeleteLinkAction:)]) {
            [self.delegateShareSeleteContentView shareSeleteContentView:self shareSeleteLinkAction:sender];
        }
    } else if (sender.tag == 3 || sender.tag == 5) {
        if (self.delegateShareSeleteContentView && [self.delegateShareSeleteContentView respondsToSelector:@selector(shareSeleteContentView:shareSeleteCancelAction:)]) {
            [self.delegateShareSeleteContentView shareSeleteContentView:self shareSeleteCancelAction:sender];
        }
    }

}

@end
