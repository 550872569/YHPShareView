//
//  ANShareContentView.m
//  AudioNote
//
//  Created by sogou-Yan on 17/5/22.
//  Copyright © 2017年 YY. All rights reserved.
//

#import "ANShareContentView.h"
#import "UILabel+Category.h"
#import "UIButton+Category.h"
#import "Masonry.h"
#import "ColorMacros.h"
#import "ShareViewConst.h"

#define  SHAREVIEW_TITLE_TOPOFFSET          8.5
#define  SHAREVIEW_LABELTITLE_TEXT_FONT     13
#define  SHAREVIEW_LABELTITLE_TEXT          @"选择发送到的应用"
#define  SHAREVIEW_LIMIT_LEFT_OFFSET        (0.06*[UIScreen mainScreen].bounds.size.width)
#define  SHAREVIEW_LIMIT_MARGIN_MIDDLE      (0.045*[UIScreen mainScreen].bounds.size.width)
#define  SHAREVIEW_THIRDBUTTON_WIDTH_HEIGHT (0.141*[UIScreen mainScreen].bounds.size.width)
#define  SHAREVIEW_THIRDBUTTON_TOPOFFSET    SHAREVIEW_THIRDBUTTON_WIDTH_HEIGHT
#define  SHARE_BUTTON_COUNT         5

@implementation ANShareContentView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.backgroundColor = RGBA(79, 110, 146, 0.65);
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, SHAREVIEW_HEIGHT_CONST);
    CGRect rectLabel = CGRectMake(0, 13, frame.size.width, 24/230*frame.size.height);
    UILabel * label = [UILabel labelWithTitle:SHAREVIEW_LABELTITLE_TEXT titleFont:SHAREVIEW_LABELTITLE_TEXT_FONT backgroundColor:[UIColor clearColor] textAlignment:NSTextAlignmentCenter ract:rectLabel numberOfLines:1 textColor:RGBA(255, 255, 255, 0.58)];
    [self addSubview:label];
    [label setNeedsDisplay];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(SHAREVIEW_TITLE_TOPOFFSET);
    }];
    for (int index = 0; index<SHARE_BUTTON_COUNT; index++) {
       UIButton *button = [[UIButton alloc]init];
        [self addSubview:button];
        button.tag = index;
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"buttonImageNormal_%d",index]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"buttonImageSeleted_%d",index]] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonShareAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIImageView *imageViewLineBottom = [[UIImageView alloc]init];
    [self addSubview:imageViewLineBottom];
    [imageViewLineBottom setBackgroundColor:RGB(50, 69, 90)];
    imageViewLineBottom.tag = SHARE_BUTTON_COUNT + 11;
    UIButton * buttonCancle = [UIButton buttonWithTitle:@"取消" titleFont:17 titleColor:[UIColor whiteColor] image:nil backgroundImage:@"" backgroundColor:[UIColor clearColor] ract:CGRectMake(20, 20, 333, 40)];
    [buttonCancle setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    buttonCancle.tag = (int)SHARE_BUTTON_COUNT;
    [self addSubview:buttonCancle];
    [buttonCancle addTarget:self action:@selector(buttonShareCancelAction:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonShareAction:(UIButton *)sender {
    if (sender.tag == 0) {
        if (self.delegateShareContentView && [self.delegateShareContentView respondsToSelector:@selector(shareContentViewShareType:)]) {
            [self.delegateShareContentView shareContentViewShareType:AN_SHARE_TYPE_QQ];
        }
    } else if (sender.tag == 1) {
        if (self.delegateShareContentView && [self.delegateShareContentView respondsToSelector:@selector(shareContentViewShareType:)]) {
            [self.delegateShareContentView shareContentViewShareType:AN_SHARE_TYPE_EMAIL];
        }
    } else if (sender.tag == 2) {
        if (self.delegateShareContentView && [self.delegateShareContentView respondsToSelector:@selector(shareContentViewShareType:)]) {
            [self.delegateShareContentView shareContentViewShareType:AN_SHARE_TYPE_WECHAT];
        }
    } else if (sender.tag == 3) {
        if (self.delegateShareContentView && [self.delegateShareContentView respondsToSelector:@selector(shareContentViewShareType:)]) {
            [self.delegateShareContentView shareContentViewShareType:AN_SHARE_TYPE_WECHARZONE];
        }
    } else if (sender.tag == 4) {
        if (self.delegateShareContentView && [self.delegateShareContentView respondsToSelector:@selector(shareContentViewShareType:)]) {
            [self.delegateShareContentView shareContentViewShareType:AN_SHARE_TYPE_SINA];
        }
    }
}
- (void)buttonShareCancelAction:(UIButton *)sender {
    if (self.delegateShareContentView && [self.delegateShareContentView respondsToSelector:@selector(shareContentViewShareType:)]) {
        [self.delegateShareContentView shareContentViewShareType:AN_SHARE_TYPE_CANCEL];
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    for (UIView *button in self.subviews) {
        if ([button isKindOfClass:[UILabel class]]) {
            [button mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(self.mas_top).with.offset(SHAREVIEW_TITLE_TOPOFFSET);
            }];
        }
        if ([button isKindOfClass:[UIImageView class]]) {
            if (button.tag == SHARE_BUTTON_COUNT + 11) {
                [button mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(self.mas_bottom).with.offset(-50);
                    make.centerX.equalTo(self);
                    make.height.equalTo(@5);
                    make.left.equalTo(self.mas_left);
                    make.right.equalTo(self.mas_right);
                }];
            } else if (button.tag == SHARE_BUTTON_COUNT + 10) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.left.bottom.right.equalTo(self);
                }];
            }
        }
        if ([button isKindOfClass:[UIButton class]]) {
            if (button.tag == 0) {
                /** QQ */
                [button mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.mas_top).with.offset(SHAREVIEW_THIRDBUTTON_TOPOFFSET);
                    make.left.equalTo(self.mas_left).with.offset(SHAREVIEW_LIMIT_LEFT_OFFSET);
                    make.width.height.equalTo(@(SHAREVIEW_THIRDBUTTON_WIDTH_HEIGHT));
                }];
            } else if (button.tag == 1) {
                /** Email */
                [button mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.mas_top).with.offset(SHAREVIEW_THIRDBUTTON_TOPOFFSET);
                    make.left.equalTo(self.mas_left).with.offset(SHAREVIEW_LIMIT_MARGIN_MIDDLE+SHAREVIEW_THIRDBUTTON_WIDTH_HEIGHT+SHAREVIEW_LIMIT_LEFT_OFFSET);
                    make.width.height.equalTo(@(SHAREVIEW_THIRDBUTTON_WIDTH_HEIGHT));
                }];
                
            } else if (button.tag == 2) {
                /** weixin */
                [button mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.mas_top).with.offset(SHAREVIEW_THIRDBUTTON_TOPOFFSET);
                    make.centerX.equalTo(self);
                    make.width.height.equalTo(@(SHAREVIEW_THIRDBUTTON_WIDTH_HEIGHT));
                }];
            } else if (button.tag == 3) {
                /** webPage */
                [button mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.mas_top).with.offset(SHAREVIEW_THIRDBUTTON_TOPOFFSET);
                    make.right.equalTo(self.mas_right).with.offset(-SHAREVIEW_LIMIT_MARGIN_MIDDLE-SHAREVIEW_THIRDBUTTON_WIDTH_HEIGHT-SHAREVIEW_LIMIT_LEFT_OFFSET);
                    make.width.height.equalTo(@(SHAREVIEW_THIRDBUTTON_WIDTH_HEIGHT));
                }];
            } else if (button.tag == 4) {
                /** Sina */
                [button mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.mas_top).with.offset(SHAREVIEW_THIRDBUTTON_TOPOFFSET);
                    make.right.equalTo(self.mas_right).with.offset(-SHAREVIEW_LIMIT_LEFT_OFFSET);
                    make.width.height.equalTo(@(SHAREVIEW_THIRDBUTTON_WIDTH_HEIGHT));
                }];
            } else if (button.tag == 5) {
                /** cancel */
                [button mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(self.mas_bottom);
                    make.centerX.equalTo(self);
                    make.height.equalTo(@50);
                    make.left.equalTo(self.mas_left);
                    make.right.equalTo(self.mas_right);
                }];
            }
            
        }
    }
}


@end
