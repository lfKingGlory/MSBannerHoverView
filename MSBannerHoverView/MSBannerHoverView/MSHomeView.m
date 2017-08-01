//
//  MSHomeView.m
//  MSBannerHoverView
//
//  Created by msj on 2017/8/1.
//  Copyright © 2017年 msj. All rights reserved.
//

#import "MSHomeView.h"

@implementation MSHomeView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 64, self.frame.size.width/2.0, 64)];
        leftBtn.backgroundColor = [UIColor orangeColor];
        [leftBtn setTitle:@"leftBtn" forState:UIControlStateNormal];
        [self addSubview:leftBtn];
        
        UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0, self.frame.size.height - 64, self.frame.size.width/2.0, 64)];
        rightBtn.backgroundColor = [UIColor yellowColor];
        [rightBtn setTitle:@"rightBtn" forState:UIControlStateNormal];
        [self addSubview:rightBtn];
        
        self.startBlock = ^(MSBannerHoverView *hoverView) {
            NSLog(@"向下滑动到底部");
        };
        
        self.completeBlock = ^(MSBannerHoverView *hoverView) {
            NSLog(@"向上滑动到顶部开始悬停");
        };
        
        self.scrollBlock = ^(MSBannerHoverView *hoverView, CGFloat percent) {
            NSLog(@"滑动中==进度==%lf",percent);
        };
    }
    return self;
}
@end
