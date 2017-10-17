//
//  MSBannerHoverView.h
//  MSBannerHoverView
//
//  Created by msj on 2017/8/1.
//  Copyright © 2017年 msj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSBannerHoverView : UIView
@property (weak, nonatomic) UIScrollView *headerScrollView;
/** 悬停高度 */
@property (assign, nonatomic) CGFloat hoverHeight;
@property (assign, nonatomic) BOOL isBottom;
@property (assign, nonatomic) BOOL isTop;
/** 向下滑动到底部 */
@property (copy, nonatomic) void (^startBlock)(MSBannerHoverView *hoverView);
/** 向上滑动到顶部开始悬停 */
@property (copy, nonatomic) void (^completeBlock)(MSBannerHoverView *hoverView);
/** 滑动中 */
@property (copy, nonatomic) void (^scrollBlock)(MSBannerHoverView *hoverView, CGFloat percent);
@end
