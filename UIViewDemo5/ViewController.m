//
//  ViewController.m
//  UIViewDemo5
//
//  Created by MCJ on 15/11/5.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#define SCR_W self.view.bounds.size.width

#import "ViewController.h"

@interface ViewController ()
{
    UILabel *_label;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addButtonsAndLable];
}

- (void)addButtonsAndLable
{
    CGFloat marginW = 15;
    CGFloat btnW = (SCR_W - 5 * marginW)/4;
    CGFloat btnH = 30;
    CGFloat btnY = 40;
    for (int i = 0; i < 4; i ++) {
        // marginW
        // 2 * marginW + btnW =  marginW + (marginW + btnW)
        // 3 * marginW + 2 * btnW = marginW + 2 * (marginW + btnW)
        // 4 * marginW + 3 * btnW = marginW + 3 * (marginW + btnW)
        CGFloat btnX = marginW + i *(btnW + marginW);
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        // 随机背景色
        btn.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.f green:arc4random() % 255 / 255.f blue:arc4random() % 255 / 255.f alpha:1.0];
        // 添加点击事件
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    CGFloat labelX = marginW;
    CGFloat labelY = btnY + btnH + 5;
    CGFloat labelW = btnW;
    CGFloat labelH = 2;
    _label = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelW, labelH)];
    _label.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.f green:arc4random() % 255 / 255.f blue:arc4random() % 255 / 255.f alpha:1.0];
    [self.view addSubview:_label];
    
}

- (void)clickBtn:(UIButton *)sender
{
    CGFloat btnX = sender.frame.origin.x;
    [UIView animateWithDuration:0.2 animations:^{
        CGRect labelFrame = _label.frame;
        labelFrame.origin.x = btnX;
        _label.frame = labelFrame;
    }];
}

@end
