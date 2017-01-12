//
//  UIButton+Custom.m
//  按钮的相关知识
//
//  Created by LiCheng on 2017/1/12.
//  Copyright © 2017年 LiCheng. All rights reserved.
//

#import "UIButton+Custom.h"
#import <objc/runtime.h>

@implementation UIButton (Custom)


-(void)lc_layoutButtonWithEdgeInsetsStyle:(LCButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space{
    
    // 1. iamgeView 的宽高
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    NSLog(@"width=%lf", width);
    NSLog(@"height=%lf", height);

    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    NSLog(@"imageWith=%lf", imageWith);
    NSLog(@"imageHeight=%lf", imageHeight);

    
    // 2. titleLabel 的宽高
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    labelWidth = self.titleLabel.intrinsicContentSize.width;
    labelHeight = self.titleLabel.intrinsicContentSize.height;
    NSLog(@"labelWidth=%lf", labelWidth);
    NSLog(@"labelHeight=%lf", labelHeight);
    
    // 3. 声明全局的 imageEdgeInsets 和 labelEdgeInsets 边距
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 4. 根据 样式style 和 边距space 得到 imageEdgeInsets 和 labelEdgeInsets 边距值
    switch (style) {
        case LCButtonEdgeInsetsStyleImageTop:
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-(imageWith+space), -(width-labelWidth)/2, 0, -(width-labelWidth)/2);
            break;
        case LCButtonEdgeInsetsStyleImageLeft:
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space/2);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, -space/2);
            break;
        case LCButtonEdgeInsetsStyleImageBottom:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
            break;
        case LCButtonEdgeInsetsStyleImageRight:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
            break;
        default:
            break;
    }
    
    // 5. 重新赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}
@end
