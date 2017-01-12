//
//  LCScopeButton.h
//  按钮的相关知识
//
//  Created by LiCheng on 2017/1/11.
//  Copyright © 2017年 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

/**  单一方向扩大范围类型 */
typedef NS_ENUM(NSUInteger, LCOneWayScopeType) {
    LCOneWayScopeTypeHorizontal = 1, // 水平方向
    LCOneWayScopeTypeVertical = 2,   // 竖直方向
    LCOneWayScopeTypeTop = 3,        // 向上扩大
    LCOneWayScopeTypeLeft = 4,       // 向左扩大
    LCOneWayScopeTypeBottom = 5,     // 向下扩大
    LCOneWayScopeTypeRight = 6       // 向右扩大
};

/**  xy轴双向扩大范围类型 */
typedef NS_ENUM(NSUInteger, LCTwoWayScopeType) {
    LCTwoWayScopeTypeAllAround = 1, // 四周
    LCTwoWayScopeTypeUPLEFT = 2,    // 左上
    LCTwoWayScopeTypeLOWERLEFT = 3, // 左下
    LCTwoWayScopeTypeUPRIGHT = 4,   // 右上
    LCTwoWayScopeTypeLOWERRIGHT = 5 // 右下
};

/** 按钮文字图片布局的样式 */
typedef NS_ENUM(NSUInteger, LCButtonLayoutStyle) {
    LCButtonLayoutStyleImageTop,    // image在上，label在下
    LCButtonLayoutStyleImageLeft,   // image在左，label在右
    LCButtonLayoutStyleImageBottom, // image在下，label在上
    LCButtonLayoutStyleImageRight   // image在右，label在左
};

@interface LCScopeButton : UIButton

/**
 *  设置 单一方向的点击范围 
 *
 * @param scopetype 单一方向扩大范围类型
 * @param range     要扩大的距离
 */
-(void)lc_setupOneWayClickScopeWithType:(LCOneWayScopeType)scopetype range:(CGFloat)range;


/**
 *  设置 xy轴的点击范围
 *
 * @param scopetype 双向扩大范围类型
 * @param rangeX    水平扩大距离
 * @param rangeY    竖直扩大距离
 */
-(void)lc_setupTwoWayClickScopeWithType:(LCTwoWayScopeType)scopetype rangeX:(CGFloat)rangeX rangeY:(CGFloat)rangeY;


/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 * @param style  布局样式
 * @param scale  图片所占整个按钮宽度的比例
 * @param space  图片和文字的间距
 */
-(void)lc_setupImageAndTitleLayoutWithStyle:(LCButtonLayoutStyle)style imageWidthScale:(CGFloat)scale space:(CGFloat)space;

@end
