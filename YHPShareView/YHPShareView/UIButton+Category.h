//
//  UIButton+Category.h
//  AudioNote
//
//  Created by sogou-Yan on 17/1/16.
//  Copyright © 2017年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)

/**
 create a new button custom

 @param title 文字
 @param font 字体
 @param titleColor 字体颜色
 @param image 图片
 @param backgroundImage 背景图片
 @param backgroundColor 背景颜色
 @param ract frame
 @return button
 */
+ (UIButton *)buttonWithTitle:(NSString *)title
                    titleFont:(CGFloat)font
                   titleColor:(UIColor *)titleColor
                        image:(NSString *)image
              backgroundImage:(NSString *)backgroundImage
              backgroundColor:(UIColor *)backgroundColor
                         ract:(CGRect)ract;

/**
 create a new button custom（自定义button new）
 
 @param normaltitle     normaltitle
 @param selectedTitle    selectedTitle
 @param font            font
 @param titleColor      titleColor
 @param normalImage     normalImage
 @param selectedImage    selectedImage
 @param backgroundImage backgroundImage
 @param backgroundColor backgroundColor
 @param ract            ract
 
 @return button
 */
+(UIButton *)buttonWithNormalTitle:(NSString *)normaltitle
                      selectedTitle:(NSString *)selectedTitle
                         titleFont:(CGFloat)font
                        titleColor:(UIColor *)titleColor
                       normalImage:(NSString *)normalImage
                      selectedImage:(NSString *)selectedImage
                   backgroundImage:(NSString *)backgroundImage
                   backgroundColor:(UIColor *)backgroundColor
                              ract:(CGRect)ract;


/**
 create a new button for shareView(分享选择视图自定义按钮)

 @param title 按钮文字
 @param font 文字字体
 @param titleColor 文字颜色
 @param backgroundColor 背景颜色
 @param cornerRadius 圆角
 @return 分享选择视图按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title
                    titleFont:(CGFloat)font
                   titleColor:(UIColor *)titleColor
              backgroundColor:(UIColor *)backgroundColor
                 cornerRadius:(CGFloat)cornerRadius
                          tag:(NSInteger)tag
                  borderColor:(UIColor *)borderColor
                  borderWidth:(CGFloat)borderWidth;

/**
  小键盘视图自定义文字按钮

 @param titleNormal titleNormal
 @param titleSelected titleSelected
 @param font font
 @param normalColor normalColor
 @param selectedColor selectedColor
 @param backgroundColor backgroundColor
 @param tag tag
 @param rect rect
 @param target target
 @param action action
 @param controlEvents controlEvents
 @return button
 */
+ (UIButton *)buttonWithNormalTitle:(NSString *)titleNormal
                      titleSelected:(NSString *)titleSelected
                imageBgNormalString:(NSString *)imageBgNormalString
              imageBgSelectedString:(NSString *)imageBgSelectedString
                          titleFont:(CGFloat)font
                        normalColor:(UIColor *)normalColor
                      selectedColor:(UIColor *)selectedColor
                    backgroundColor:(UIColor *)backgroundColor
                                tag:(NSInteger)tag
                               rect:(CGRect)rect
                             targrt:(id)target
                             action:(SEL)action
                   forControlEvents:(UIControlEvents)controlEvents;

/**
 小键盘视图自定义图片按钮

 @param imageNormalString imageNormalString
 @param imageSelectedString imageSelectedString
 @param tag tag
 @param rect rect
 @param target target
 @param action action
 @param controlEvents touchupinside 
 @return button
 */
+ (UIButton *)buttonWithImageNormalString:(NSString *)imageNormalString
                      imageSelectedString:(NSString *)imageSelectedString
                          backgroundColor:(UIColor *)backgroundColor
                                      tag:(NSInteger)tag
                                     rect:(CGRect)rect
                                   targrt:(id)target
                                   action:(SEL)action
                         forControlEvents:(UIControlEvents)controlEvents;
/**
 create a new image button for init navigationItem(导航栏自定义 图片按钮)

 @param imageNormalString imageNormalString
 @param imageHighlightedString imageHighlightedString
 @param state 点击状态
 @param rect frame
 @param target 监听者
 @param action 触发事件方法
 @param controlEvents 触发时机
 @return button
 */
+ (UIButton *)buttonItemWithImageNormalString:(NSString *)imageNormalString
                       imageHighlightedString:(NSString *)imageHighlightedString
                                         rect:(CGRect)rect
                                       targrt:(id)target
                                       action:(SEL)action
                             forControlEvents:(UIControlEvents)controlEvents;
/**
 create a new image button (自定义 图片按钮)
 
 @param imageNormalString imageNormalString
 @param imageSelectedString imageSelectedString
 @param state 点击状态
 @param rect frame
 @param target 监听者
 @param action 触发事件方法
 @param controlEvents 触发时机
 @return button
 */
+ (UIButton *)buttonItemWithImageNormalString:(NSString *)imageNormalString
                          imageSelectedString:(NSString *)imageSelectedString
                                         rect:(CGRect)rect
                                       targrt:(id)target
                                       action:(SEL)action
                             forControlEvents:(UIControlEvents)controlEvents;
/**
 create a new title button （下一步） for init navigationItem(导航栏自定义 文字按钮)
 
 @param titleString 按钮文字
 @param titleColor 文字颜色
 @param titleFont 字体
 @param state 点击状态
 @param rect frame
 @param target 监听者
 @param action 触发事件方法
 @param controlEvents 触发时机
 @return button
 */
+ (UIButton *)buttonItemWithTitleString:(NSString *)titleString
                             titleColor:(UIColor *)titleColor
                              titleFont:(CGFloat)titleFont
                                   rect:(CGRect)rect
                                 targrt:(id)target
                                 action:(SEL)action
                       forControlEvents:(UIControlEvents)controlEvents;


/**
 导航栏左侧返回按钮 自定义

 @param titleString titleString
 @param titleColor titleColor
 @param titleFont titleFont
 @param imageNormal imageNormal
 @param imageHighlight imageHighlight
 @param target target
 @param action action
 @param controlEvents controlEvents
 @return button
 */
+ (UIButton *)buttonItemLeftWithTitleString:(NSString *)titleString
                                 titleColor:(UIColor *)titleColor
                                  titleFont:(CGFloat)titleFont
                                imageNormal:(NSString *)imageNormal
                             imageHighlight:(NSString *)imageHighlight
                                     targrt:(UIViewController *)target
                                     action:(SEL)action
                           forControlEvents:(UIControlEvents)controlEvents;

+ (UIButton *)buttonWithTargrt:(id)target
                        action:(SEL)action
              forControlEvents:(UIControlEvents)controlEvents;

@end
