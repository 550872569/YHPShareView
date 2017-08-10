//
//  ANShareView.h
//  AudioNote
//
//  Created by sogou on 16/10/12.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ANShareContentView.h"

@class ANShareView;
@protocol ANShareViewDelegate <NSObject>

@optional

- (void)shareView:(UIView *)view shareToSinaAction:(UIButton *)sender;
- (void)shareView:(UIView *)view shareToQQAction:(UIButton *)sender;
- (void)shareView:(UIView *)view shareToWechatAction:(UIButton *)sender;
- (void)shareView:(UIView *)view shareToEmailAction:(UIButton *)sender;
- (void)shareView:(UIView *)view shareToWechatZoneAction:(UIButton *)sender;
- (void)shareView:(UIView *)view shareCancelAction:(UIButton *)sender;
- (void)shareViewShareType:(AN_SHARE_TYPE)type;

@end

@interface ANShareView : UIView

@property (nonatomic, weak) id<ANShareViewDelegate> delegate;

- (void)setupWithDelegateShareView:(id)delegateShareView;

@end
