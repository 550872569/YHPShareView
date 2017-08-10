//
//  ANShareContentView.h
//  AudioNote
//
//  Created by sogou-Yan on 17/5/22.
//  Copyright © 2017年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ANShareConst.h"

@protocol ANShareContentViewDelegate <NSObject>

@optional

- (void)shareContentViewShareType:(AN_SHARE_TYPE)type;

@end

@interface ANShareContentView : UIView

@property(nonatomic, weak) id <ANShareContentViewDelegate> delegateShareContentView;

@end
