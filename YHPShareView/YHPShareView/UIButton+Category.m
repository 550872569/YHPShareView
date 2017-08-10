//
//  UIButton+Category.m
//  AudioNote
//
//  Created by sogou-Yan on 17/1/16.
//  Copyright © 2017年 YY. All rights reserved.
//

#import "UIButton+Category.h"
#import "UIButton+ImageTitleSpacing.h"

@implementation UIButton (Category)

+ (UIButton *)buttonWithTitle:(NSString *)title
                    titleFont:(CGFloat)font
                   titleColor:(UIColor *)titleColor
                        image:(NSString *)image
              backgroundImage:(NSString *)backgroundImage
              backgroundColor:(UIColor *)backgroundColor
                         ract:(CGRect)ract {
    
    UIButton *button = [[UIButton alloc]init];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setFrame:ract];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundColor:backgroundColor];
    if (image.length) {
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (backgroundImage.length) {
        [button setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:UIControlStateNormal];
    }
    return button;
}

+(UIButton *)buttonWithNormalTitle:(NSString *)normaltitle
                      selectedTitle:(NSString *)selectedTitle
                         titleFont:(CGFloat)font
                        titleColor:(UIColor *)titleColor
                       normalImage:(NSString *)normalImage
                      selectedImage:(NSString *)selectedImage
                   backgroundImage:(NSString *)backgroundImage
                   backgroundColor:(UIColor *)backgroundColor
                              ract:(CGRect)ract {
    
    UIButton *button = [[UIButton alloc]init];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setFrame:ract];
    [button setTitle:normaltitle forState:UIControlStateNormal];
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundColor:backgroundColor];
    if (normalImage.length) {
        [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    }
    if (selectedImage.length) {
        [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    }
    if (backgroundImage.length) {
        [button setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:UIControlStateNormal];
    }
    return button;
}

+ (UIButton *)buttonWithTitle:(NSString *)title
                    titleFont:(CGFloat)font
                   titleColor:(UIColor *)titleColor
              backgroundColor:(UIColor *)backgroundColor
                 cornerRadius:(CGFloat)cornerRadius
                          tag:(NSInteger)tag
                  borderColor:(UIColor *)borderColor
                  borderWidth:(CGFloat)borderWidth {
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setBackgroundColor:backgroundColor];
    button.layer.cornerRadius = cornerRadius;
    button.tag = tag;
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = borderWidth;
    return button;
}

+ (UIButton *)buttonWithImageNormalString:(NSString *)imageNormalString
                      imageSelectedString:(NSString *)imageSelectedString
                          backgroundColor:(UIColor *)backgroundColor
                                      tag:(NSInteger)tag
                                     rect:(CGRect)rect
                                   targrt:(id)target
                                   action:(SEL)action
                         forControlEvents:(UIControlEvents)controlEvents {
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageNormalString] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageSelectedString] forState:UIControlStateSelected];
    button.bounds = rect;
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:controlEvents];
    return button;
}

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
                   forControlEvents:(UIControlEvents)controlEvents {
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:titleNormal forState:UIControlStateNormal];
    [button setTitle:titleSelected forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:imageBgNormalString] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:imageBgSelectedString] forState:UIControlStateSelected];
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setBackgroundColor:backgroundColor];
    button.tag = tag;
    button.bounds = rect;
    [button addTarget:target action:action forControlEvents:controlEvents];
    return button;
}

+ (UIButton *)buttonItemWithImageNormalString:(NSString *)imageNormalString
                       imageHighlightedString:(NSString *)imageHighlightedString
                                         rect:(CGRect)rect
                                       targrt:(id)target
                                       action:(SEL)action
                             forControlEvents:(UIControlEvents)controlEvents {
    
    UIButton *buttonItem = [[UIButton alloc] init];
    [buttonItem setImage:[UIImage imageNamed:imageNormalString] forState:UIControlStateNormal];
    [buttonItem setImage:[UIImage imageNamed:imageHighlightedString] forState:UIControlStateHighlighted];
    buttonItem.bounds = rect;
    [buttonItem addTarget:target action:action forControlEvents:controlEvents];
    return buttonItem;
}

+ (UIButton *)buttonItemWithImageNormalString:(NSString *)imageNormalString
                       imageSelectedString:(NSString *)imageSelectedString
                                         rect:(CGRect)rect
                                       targrt:(id)target
                                       action:(SEL)action
                             forControlEvents:(UIControlEvents)controlEvents {
    
    UIButton *buttonItem = [[UIButton alloc] init];
    [buttonItem setImage:[UIImage imageNamed:imageNormalString] forState:UIControlStateNormal];
    [buttonItem setImage:[UIImage imageNamed:imageSelectedString] forState:UIControlStateSelected];
    buttonItem.bounds = rect;
    [buttonItem addTarget:target action:action forControlEvents:controlEvents];
    return buttonItem;
}

+ (UIButton *)buttonItemWithTitleString:(NSString *)titleString
                             titleColor:(UIColor *)titleColor
                              titleFont:(CGFloat)titleFont
                                   rect:(CGRect)rect
                                 targrt:(id)target
                                 action:(SEL)action
                       forControlEvents:(UIControlEvents)controlEvents {
    
    UIButton *buttonItem = [[UIButton alloc] init];
    [buttonItem setTitle:titleString forState:UIControlStateNormal];
    [buttonItem setTitleColor:titleColor forState:UIControlStateNormal];
    [buttonItem.titleLabel setFont:[UIFont systemFontOfSize:titleFont]];
    buttonItem.bounds = rect;
    [buttonItem addTarget:target action:action forControlEvents:controlEvents];
    return buttonItem;
}

+ (UIButton *)buttonItemLeftWithTitleString:(NSString *)titleString
                                 titleColor:(UIColor *)titleColor
                                  titleFont:(CGFloat)titleFont
                                imageNormal:(NSString *)imageNormal
                             imageHighlight:(NSString *)imageHighlight
                                     targrt:(UIViewController *)target
                                     action:(SEL)action
                           forControlEvents:(UIControlEvents)controlEvents {
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageNormal] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageHighlight] forState:UIControlStateHighlighted];
    [button setTitle:titleString forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button buttonWithEdgeInsetsStyle:YHPButtonEdgeInsetsStyleLeft imageTitleSpace:8];
    return button;
}

+ (UIButton *)buttonWithTargrt:(id)target
                        action:(SEL)action
              forControlEvents:(UIControlEvents)controlEvents {
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundColor:[UIColor clearColor]];
    [button addTarget:target action:action forControlEvents:controlEvents];
    return button;
}


@end
