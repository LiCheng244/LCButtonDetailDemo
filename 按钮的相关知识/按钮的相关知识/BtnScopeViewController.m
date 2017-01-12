//
//  BtnScopeViewController.m
//  按钮的相关知识
//
//  Created by LiCheng on 2017/1/11.
//  Copyright © 2017年 LiCheng. All rights reserved.
//

#import "BtnScopeViewController.h"
#import "LCScopeButton.h"

@interface BtnScopeViewController ()
//@property (strong, nonatomic) LCScopeButton *btn;
@property (weak, nonatomic) IBOutlet LCScopeButton *horizontalBtn;
@property (weak, nonatomic) IBOutlet UIView *horizontalView;

@property (weak, nonatomic) IBOutlet LCScopeButton *verticalBtn;
@property (weak, nonatomic) IBOutlet UIView *verticalView;

@property (weak, nonatomic) IBOutlet LCScopeButton *topBtn;
@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet LCScopeButton *bottomBtn;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet LCScopeButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIView *rightView;

@property (weak, nonatomic) IBOutlet LCScopeButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIView *leftView;

@property (weak, nonatomic) IBOutlet LCScopeButton *allgroundBtn;
@property (weak, nonatomic) IBOutlet UIView *allgroundView;

@property (weak, nonatomic) IBOutlet LCScopeButton *uprightBtn;
@property (weak, nonatomic) IBOutlet UIView *uprightView;

@property (weak, nonatomic) IBOutlet LCScopeButton *upleftBtn;
@property (weak, nonatomic) IBOutlet UIView *upleftView;

@property (weak, nonatomic) IBOutlet LCScopeButton *lowerLeftBtn;
@property (weak, nonatomic) IBOutlet UIView *lowerLeftView;

@property (weak, nonatomic) IBOutlet LCScopeButton *lowerRightBtn;
@property (weak, nonatomic) IBOutlet UIView *lowerRightView;

@end

@implementation BtnScopeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.horizontalBtn lc_setupOneWayClickScopeWithType:(LCOneWayScopeTypeHorizontal) range:50];
    
    [self.verticalBtn lc_setupOneWayClickScopeWithType:(LCOneWayScopeTypeVertical) range:15];
    
    [self.topBtn lc_setupOneWayClickScopeWithType:(LCOneWayScopeTypeTop) range:15];
    
    [self.rightBtn lc_setupOneWayClickScopeWithType:(LCOneWayScopeTypeRight) range:50];
    
    [self.leftBtn lc_setupOneWayClickScopeWithType:(LCOneWayScopeTypeLeft) range:50];
    
    [self.bottomBtn lc_setupOneWayClickScopeWithType:(LCOneWayScopeTypeBottom) range:15];
    
    [self.allgroundBtn lc_setupTwoWayClickScopeWithType:(LCTwoWayScopeTypeAllAround) rangeX:50 rangeY:15];
    
    [self.uprightBtn lc_setupTwoWayClickScopeWithType:(LCTwoWayScopeTypeUPRIGHT) rangeX:50 rangeY:15];
    
    [self.upleftBtn lc_setupTwoWayClickScopeWithType:(LCTwoWayScopeTypeUPLEFT) rangeX:50 rangeY:15];
    
    [self.lowerLeftBtn lc_setupTwoWayClickScopeWithType:(LCTwoWayScopeTypeLOWERLEFT) rangeX:50 rangeY:15];
    
    [self.lowerRightBtn lc_setupTwoWayClickScopeWithType:(LCTwoWayScopeTypeLOWERRIGHT) rangeX:50 rangeY:15];
}


- (IBAction)horizontalBtnClick:(id)sender {
    self.horizontalView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}
- (IBAction)verticalBtnClick:(id)sender {
    self.verticalView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}
- (IBAction)topBtnClick:(id)sender {
    self.topView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}
- (IBAction)bottomBtnClick:(id)sender {
    self.bottomView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}
- (IBAction)rightBtnClick:(id)sender {
    self.rightView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

- (IBAction)leftBtnClick:(id)sender {
    self.leftView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}
- (IBAction)allgroundBtnClick:(id)sender {
    self.allgroundView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}
- (IBAction)uprightBtn:(id)sender {
    self.uprightView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

- (IBAction)upleftBtnClick:(id)sender {
    self.upleftView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}
- (IBAction)lowerLeftBtnClick:(id)sender {
    self.lowerLeftView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}
- (IBAction)lowerRightBtnClick:(id)sender {
    self.lowerRightView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}
@end
