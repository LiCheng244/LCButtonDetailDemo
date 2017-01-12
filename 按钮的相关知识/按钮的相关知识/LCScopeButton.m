//
//  LCScopeButton.m
//  按钮的相关知识
//
//  Created by LiCheng on 2017/1/11.
//  Copyright © 2017年 LiCheng. All rights reserved.
//

#import "LCScopeButton.h"
#import "UIView+BSFrame.h"

@interface LCScopeButton ()

/** 扩大范围 */
@property (nonatomic, assign) CGSize scopeSize;
/** 文字图片间距 */
@property (nonatomic, assign) CGFloat space;
/** 图片所占整个按钮宽度的比例 */
@property (nonatomic, assign) CGFloat scale;

/**  单一方向扩大范围类型 */
@property (nonatomic, assign) LCOneWayScopeType oneWayscopeType;
/**  xy轴双向扩大范围类型 */
@property (nonatomic, assign) LCTwoWayScopeType twoWayscopeType;

/**  图片文字布局样式 */
@property (nonatomic, assign)  LCButtonLayoutStyle layoutStyle;


@end

@implementation LCScopeButton

/**
 *  设置 单一方向的点击范围 scopetype:方向类型 range:扩大或缩小距离
 */
-(void)lc_setupOneWayClickScopeWithType:(LCOneWayScopeType)scopetype range:(CGFloat)range{
    
    switch (scopetype) {
        case LCOneWayScopeTypeHorizontal: // 水平
            self.scopeSize = CGSizeMake(range, 0);
            self.oneWayscopeType = LCOneWayScopeTypeHorizontal;
            break;
        case LCOneWayScopeTypeVertical: // 竖直
            self.scopeSize = CGSizeMake(0, range);
            self.oneWayscopeType = LCOneWayScopeTypeVertical;
            break;
        case LCOneWayScopeTypeTop: // 向上
            self.scopeSize = CGSizeMake(0, range);
            self.oneWayscopeType = LCOneWayScopeTypeTop;

            break;
        case LCOneWayScopeTypeLeft: // 向左
            self.scopeSize = CGSizeMake(range, 0);
            self.oneWayscopeType = LCOneWayScopeTypeLeft;
            break;
        case LCOneWayScopeTypeBottom: // 向下
            self.scopeSize = CGSizeMake(0, range);
            self.oneWayscopeType = LCOneWayScopeTypeBottom;
            break;
        case LCOneWayScopeTypeRight: // 向右
            self.scopeSize = CGSizeMake(range, 0);
            self.oneWayscopeType = LCOneWayScopeTypeRight;
        default:
            break;
    }
}

/**
 *  设置 xy轴的点击范围 rangeX:X轴扩大或缩小距离 rangeY:Y轴扩大或缩小距离
 */
-(void)lc_setupTwoWayClickScopeWithType:(LCTwoWayScopeType)scopetype rangeX:(CGFloat)rangeX rangeY:(CGFloat)rangeY{
    
    self.scopeSize = CGSizeMake(rangeX, rangeY);
    switch (scopetype) {
        case LCTwoWayScopeTypeAllAround: // 四周
            self.twoWayscopeType = LCTwoWayScopeTypeAllAround;
            break;
        case LCTwoWayScopeTypeUPLEFT: // 左上
            self.twoWayscopeType = LCTwoWayScopeTypeUPLEFT;
            break;
        case LCTwoWayScopeTypeLOWERLEFT: // 左下
            self.twoWayscopeType = LCTwoWayScopeTypeLOWERLEFT;
            break;
        case LCTwoWayScopeTypeUPRIGHT: // 右上
            self.twoWayscopeType = LCTwoWayScopeTypeUPRIGHT;
            break;
        case LCTwoWayScopeTypeLOWERRIGHT: // 右下
            self.twoWayscopeType = LCTwoWayScopeTypeLOWERRIGHT;
            break;
        default:
            break;
    }
}


/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 */
-(void)lc_setupImageAndTitleLayoutWithStyle:(LCButtonLayoutStyle)style imageWidthScale:(CGFloat)scale space:(CGFloat)space{
    
    self.space = space;
    self.scale = scale;
    switch (style) {
        case LCButtonLayoutStyleImageRight: // 图片在右
            self.layoutStyle = LCButtonLayoutStyleImageRight;
            break;
        case LCButtonLayoutStyleImageLeft: // 图片在左
            self.layoutStyle = LCButtonLayoutStyleImageLeft;
            break;
        case LCButtonLayoutStyleImageTop: // 图片在上
            self.layoutStyle = LCButtonLayoutStyleImageTop;
            break;
        case LCButtonLayoutStyleImageBottom: // 图片在下
            self.layoutStyle = LCButtonLayoutStyleImageBottom;
            break;
        default:
            break;
    }
}



// 重写layoutSubviews方法，手动设置按钮子控件的位置
- (void)layoutSubviews {
    
    [super layoutSubviews];

    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    
    self.titleLabel.bs_width = labelWidth;
    self.titleLabel.bs_height = labelHeight;
    switch (self.layoutStyle) {
        case LCButtonLayoutStyleImageRight: // 图片在右
        {
            self.titleLabel.bs_x = self.space / 2;
            self.titleLabel.bs_y = (self.bs_height - labelHeight )/2;
            
            self.imageView.bs_width = self.bs_height*self.scale;
            self.imageView.bs_height = self.imageView.bs_width;
            self.imageView.bs_x = CGRectGetMaxX(self.titleLabel.frame) + self.space;
            self.imageView.bs_y = (self.bs_height - self.imageView.bs_height) / 2;
        }break;
        case LCButtonLayoutStyleImageLeft: // 图片在左
        {
            self.imageView.bs_width = self.bs_height*self.scale;
            self.imageView.bs_height = self.imageView.bs_width;
            self.imageView.bs_x = self.space;
            self.imageView.bs_y = (self.bs_height - self.imageView.bs_width) / 2;
            
            self.titleLabel.bs_x = CGRectGetMaxX(self.imageView.frame) + self.space;
            self.titleLabel.bs_y = (self.bs_height - labelHeight )/2;
        }break;
        case LCButtonLayoutStyleImageTop: // 图片在上
        {
            self.imageView.bs_width = self.bs_width * self.scale;
            self.imageView.bs_height = self.imageView.bs_width;
            self.imageView.bs_x = (self.bs_width - self.imageView.bs_width) / 2.0;
            self.imageView.bs_y = self.space;

            
            self.titleLabel.bs_x = (self.bs_width - labelWidth) / 2.0;
            self.titleLabel.bs_y = CGRectGetMaxY(self.imageView.frame) + self.space;
        }break;
        case LCButtonLayoutStyleImageBottom: // 图片在下
        {
            self.titleLabel.bs_x = (self.bs_width - labelWidth) / 2.0;
            self.titleLabel.bs_y = self.space / 2;
            
            self.imageView.bs_width = self.bs_width * self.scale;
            self.imageView.bs_height = self.imageView.bs_width;
            self.imageView.bs_x = (self.bs_width - self.imageView.bs_width) / 2.0;
            self.imageView.bs_y = CGRectGetMaxY(self.titleLabel.frame) + self.space;
        }break;
        default:
            break;
    }
}



-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    
    // 获取当前视图的 bounds
    CGRect bounds = self.bounds;
    
    CGFloat scopeX = self.scopeSize.width;
    CGFloat scopeY = self.scopeSize.height;
    CGFloat boundsW = self.bounds.size.width;
    CGFloat boundsH = self.bounds.size.height;
    
    if (self.oneWayscopeType != 0) {
        switch (self.oneWayscopeType) {
            case LCOneWayScopeTypeHorizontal: // 水平
                bounds = CGRectInset(bounds, -scopeX, 0);
                break;
            case LCOneWayScopeTypeVertical: // 竖直
                bounds = CGRectInset(bounds, 0, -scopeY);
                break;
            case LCOneWayScopeTypeTop: // 向上
                bounds = CGRectMake(0, -scopeY/2, boundsW, boundsH);
                bounds = CGRectInset(bounds, 0, -scopeY/2);
                break;
            case LCOneWayScopeTypeLeft: // 向左
                bounds = CGRectMake(-scopeX/2, 0, boundsW, boundsH);
                bounds = CGRectInset(bounds, -scopeX/2, 0);
                break;
            case LCOneWayScopeTypeBottom: // 向下
                bounds = CGRectMake(0, scopeY/2, boundsW, boundsH);
                bounds = CGRectInset(bounds, 0, -scopeY/2);
                break;
            case LCOneWayScopeTypeRight: // 向右
                bounds = CGRectMake(scopeX/2, 0, boundsW, boundsH);
                bounds = CGRectInset(bounds, -scopeX/2, 0);
            default:
                break;
        }
    }
    
    if (self.twoWayscopeType != 0) {
        switch (self.twoWayscopeType) {
            case LCTwoWayScopeTypeAllAround: // 四周
                bounds = CGRectInset(bounds, -scopeX, -scopeY);
                break;
            case LCTwoWayScopeTypeUPLEFT: // 左上
                bounds = CGRectMake(-scopeX/2, -scopeY/2, boundsW, boundsH);
                bounds = CGRectInset(bounds, -scopeX/2, -scopeY/2);
                break;
            case LCTwoWayScopeTypeLOWERLEFT: // 左下
                bounds = CGRectMake(-scopeX/2, scopeY/2, boundsW, boundsH);
                bounds = CGRectInset(bounds, -scopeX/2, -scopeY/2);
                
                break;
            case LCTwoWayScopeTypeUPRIGHT: // 右上
                bounds = CGRectMake(scopeX/2, -scopeY/2, boundsW, boundsH);
                bounds = CGRectInset(bounds, -scopeX/2, -scopeY/2);
                
                break;
            case LCTwoWayScopeTypeLOWERRIGHT: // 右下
                bounds = CGRectMake(scopeX/2, scopeY/2, boundsW, boundsH);
                bounds = CGRectInset(bounds, -scopeX/2, -scopeY/2);
                break;
                
            default:
                break;
        }
    }
    return CGRectContainsPoint(bounds, point);
}

@end
