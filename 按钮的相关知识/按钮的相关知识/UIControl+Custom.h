//
//  UIControl+Custom.h
//  按钮的相关知识
//
//  Created by LiCheng on 2017/1/11.
//  Copyright © 2017年 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Custom)

/** 添加点击事件的时间间隔 */
@property (nonatomic, assign)  NSTimeInterval lc_acceptEventInterval;

/** 是否忽略点击事件,不响应点击事件 */
@property (nonatomic, assign) BOOL lc_ignoreEvent;

/**
 *      Category不能给类添加属性
    所以上面的两个属性只会有对应的getter和setter方法, 不会添加真正的成员变量.
 
    如果我们不在实现文件中添加其getter和setter方法, 则采用 btn.lc_acceptEventInterval = 1; 这种方法尝试访问该属性会出错.
 */

@end
