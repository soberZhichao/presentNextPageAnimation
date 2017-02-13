//
//  ViewController.m
//  presentNextPageAnimation
//
//  Created by Ken on 2017/2/13.
//  Copyright © 2017年 AIA. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)nextPageClick:(id)sender
{
    // UIStoryboard读取VC
    UIViewController *nextVC = [[UIStoryboard storyboardWithName:@"NextViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"NextViewController"];
    
//    vc自带的跳转modal
//    nextVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self setupPresentAnimation];
    
    [self presentViewController:nextVC animated:NO completion:nil];
    
}

- (void)setupPresentAnimation
{
    //创建动画
    CATransition *animation = [CATransition animation];
    //设置运动轨迹的速度     iOS5之后新的写法，以前的不再支持
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    //设置动画类型为立方体动画
    animation.type = @"cube";   // 详细动画方式可见我的CALayer  跳转动画那篇
    //设置动画时长
    animation.duration = 2;
    //设置运动的方向
    animation.subtype =kCATransitionFromRight;
    //控制器间跳转动画
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
}


@end
