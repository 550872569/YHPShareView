//
//  ANShareSeleteContentView.h
//  AudioNote
//
//  Created by sogou-Yan on 17/5/22.
//  Copyright © 2017年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ANShareSeleteContentViewDelegate <NSObject>

@optional

- (void)shareSeleteContentView:(UIView *)view shareSeleteTextAction:(UIButton *)sender;
- (void)shareSeleteContentView:(UIView *)view shareSeletePictureAction:(UIButton *)sender;
- (void)shareSeleteContentView:(UIView *)view shareSeleteLinkAction:(UIButton *)sender;
- (void)shareSeleteContentView:(UIView *)view shareSeleteCancelAction:(UIButton *)sender;

@end

@interface ANShareSeleteContentView : UIView

@property(nonatomic, weak) id <ANShareSeleteContentViewDelegate> delegateShareSeleteContentView;

@end
