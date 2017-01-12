//
//  BtnEdgeInsetsViewController.m
//  按钮的相关知识
//
//  Created by LiCheng on 2017/1/12.
//  Copyright © 2017年 LiCheng. All rights reserved.
//

#import "BtnEdgeInsetsViewController.h"
#import "LCScopeButton.h"
#import "UIView+BSFrame.h"

@interface BtnEdgeInsetsViewController ()

@property (weak, nonatomic) IBOutlet LCScopeButton *imgTopBtn;
@property (weak, nonatomic) IBOutlet LCScopeButton *imgLeftBtn;
@property (weak, nonatomic) IBOutlet LCScopeButton *imgBottomBtn;
@property (weak, nonatomic) IBOutlet LCScopeButton *imgRightBtn;

@end

@implementation BtnEdgeInsetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.imgTopBtn lc_setupImageAndTitleLayoutWithStyle:(LCButtonLayoutStyleImageTop) imageWidthScale:0.6 space:5];
    
    [self.imgBottomBtn lc_setupImageAndTitleLayoutWithStyle:(LCButtonLayoutStyleImageBottom) imageWidthScale:0.6 space:5];
    
    [self.imgLeftBtn lc_setupImageAndTitleLayoutWithStyle:(LCButtonLayoutStyleImageLeft) imageWidthScale:0.8 space:5];
    
    [self.imgRightBtn lc_setupImageAndTitleLayoutWithStyle:(LCButtonLayoutStyleImageRight) imageWidthScale:0.8 space:5];
    
}


@end
