//
//  BtnClickViewController.m
//  按钮的相关知识
//
//  Created by LiCheng on 2017/1/11.
//  Copyright © 2017年 LiCheng. All rights reserved.
//

#import "BtnClickViewController.h"
#import "UIControl+Custom.h"

@interface BtnClickViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn01;
@property (weak, nonatomic) IBOutlet UIButton *btn02;
@property (weak, nonatomic) IBOutlet UIButton *btn03;

@end

@implementation BtnClickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 利用 runtime 设置按钮的延时时间
    self.btn03.lc_acceptEventInterval = 3.0;
    // 是否忽略点击事件
    self.btn03.lc_ignoreEvent = NO;
    
}
- (IBAction)click01:(id)sender {
    
    // 禁止点击
    self.btn01.userInteractionEnabled = NO;
    
    // 执行完某些操作后 打开交互
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"xxxx");
        self.btn01.userInteractionEnabled = YES;
    });
}

- (IBAction)click02:(id)sender {
    
    // 取消 实际操作
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(realityClick02) object:nil];
    
    // 延时1秒执行实际操作
    [self performSelector:@selector(realityClick02) withObject:nil afterDelay:1];
}
-(void)realityClick02{
    NSLog(@"延时1秒");
}


- (IBAction)click03:(id)sender {
    NSLog(@"123");
}


@end
