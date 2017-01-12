//
//  UIControl+Custom.m
//  按钮的相关知识
//
//  Created by LiCheng on 2017/1/11.
//  Copyright © 2017年 LiCheng. All rights reserved.
//

#import "UIControl+Custom.h"
#import <objc/runtime.h>

@implementation UIControl (Custom)
// 自己添加的时间间隔属性
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
// 自己添加的是否忽略点击事件属性
static const char *UIcontrol_ignoreEvent = "UIcontrol_ignoreEvent";


+(void)load{
    
    // 将按钮默认的点击事件 替换为 自定义的点击事件
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:)); // 默认点击事件
    Method b = class_getInstanceMethod(self, @selector(lc_sendAction:to:forEvent:)); // 自定义点击事件
    method_exchangeImplementations(a, b);
}


/**
 *  自定义点击事件
 */
-(void)lc_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    // 如果忽略点击, 直接返回
    if (self.lc_ignoreEvent){
        return;
    }else{
        
        // 如果延时时间 > 0
        if (self.lc_acceptEventInterval > 0) {
            
            // 忽略其他点击事件
            self.lc_ignoreEvent = YES;
            
            // 几秒后 设置按钮不忽略点击事件
            [self performSelector:@selector(setLc_ignoreEvent:) withObject:@(NO) afterDelay:self.lc_acceptEventInterval];
        }
    }
    
    [self lc_sendAction:action to:target forEvent:event];
}


/**
 *  get方法
 */
-(NSTimeInterval)lc_acceptEventInterval{
    
    // 动态的向类中获取 自定义的 UIControl_acceptEventInterval 方法
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

-(void)setLc_acceptEventInterval:(NSTimeInterval)lc_acceptEventInterval{
    
    // 动态的向类中添加 自定义的 UIControl_acceptEventInterval 方法
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(lc_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(BOOL)lc_ignoreEvent{
    return [objc_getAssociatedObject(self, UIcontrol_ignoreEvent) boolValue];
}

-(void)setLc_ignoreEvent:(BOOL)lc_ignoreEvent{
    objc_setAssociatedObject(self, UIcontrol_ignoreEvent, @(lc_ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



@end
