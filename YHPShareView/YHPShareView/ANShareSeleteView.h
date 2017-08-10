//
//  ANShareSeleteView.h
//  AudioNote
//
//  Created by sogou-Yan on 17/1/16.
//  Copyright © 2017年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 分享选择视图 点击分享按钮弹出 选择 文字 || 图片 分享 */
@protocol ANShareSeleteViewDelegate <NSObject>

@optional

- (void)shareSeleteView:(UIView *)view shareSeleteTextAction:(UIButton *)sender;
- (void)shareSeleteView:(UIView *)view shareSeletePictureAction:(UIButton *)sender;
- (void)shareSeleteView:(UIView *)view shareSeleteLinkAction:(UIButton *)sender;
- (void)shareSeleteView:(UIView *)view shareSeleteCancelAction:(UIButton *)sender;

@end

@interface ANShareSeleteView : UIView

@property (nonatomic, weak) id<ANShareSeleteViewDelegate> delegate;

- (void)setupWithDelegateShareSeleteView:(id)delegateShareSeleteView;

@end
