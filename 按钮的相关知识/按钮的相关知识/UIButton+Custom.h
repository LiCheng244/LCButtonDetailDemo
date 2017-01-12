//
//  UIButton+Custom.h
//  按钮的相关知识
//
//  Created by LiCheng on 2017/1/12.
//  Copyright © 2017年 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, LCButtonEdgeInsetsStyle) {
    LCButtonEdgeInsetsStyleImageTop, // image在上，label在下
    LCButtonEdgeInsetsStyleImageLeft, // image在左，label在右
    LCButtonEdgeInsetsStyleImageBottom, // image在下，label在上
    LCButtonEdgeInsetsStyleImageRight // image在右，label在左
};


@interface UIButton (Custom)

/** 
 * 设置button的titleLabel和imageView的布局样式，及间距
 *
 * @param style titleLabel和imageView的布局样式 
 * @param space titleLabel和imageView的间距 
 */
- (void)lc_layoutButtonWithEdgeInsetsStyle:(LCButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space;

@end

