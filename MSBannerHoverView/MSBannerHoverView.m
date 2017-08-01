//
//  MSBannerHoverView.m
//  MSBannerHoverView
//
//  Created by msj on 2017/8/1.
//  Copyright © 2017年 msj. All rights reserved.
//

#import "MSBannerHoverView.h"
#define EPS 1e-6

@implementation MSBannerHoverView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.hoverHeight = 0;
        self.isTop = NO;
        self.isBottom = YES;
    }
    return self;
}

- (void)setHeaderScrollView:(UIScrollView *)headerScrollView {
    _headerScrollView = headerScrollView;
    [headerScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    headerScrollView.contentInset = UIEdgeInsetsMake(self.frame.size.height, 0, 0, 0);
}

- (void)dealloc {
    [self.headerScrollView removeObserver:self forKeyPath:@"contentOffset"];
    NSLog(@"%s",__func__);
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    CGPoint contentOffset = [change[NSKeyValueChangeNewKey] CGPointValue];
    [self updateSubViewsWithScrollOffset:contentOffset];
}

- (void)updateSubViewsWithScrollOffset:(CGPoint)contentOffset {
    CGFloat startChangeOffsetY = -self.headerScrollView.contentInset.top;
    CGPoint newOffset = CGPointMake(contentOffset.x, contentOffset.y < startChangeOffsetY ? startChangeOffsetY : MIN(contentOffset.y, -self.hoverHeight));
    CGFloat newY = -newOffset.y - self.frame.size.height;
    self.frame = CGRectMake(0, newY, self.frame.size.width, self.frame.size.height);
    
    CGFloat distance = -self.hoverHeight - startChangeOffsetY;
    CGFloat percent = (newOffset.y - startChangeOffsetY) / distance;
    
    if (1.0 - percent > EPS && percent - 0.0 > EPS) {
        self.isBottom = NO;
        self.isTop = NO;
    } else if (!self.isTop && !self.isBottom) {
        if (1.0 - percent < EPS) {
            self.isTop = YES;
            if (self.completeBlock) {
                self.completeBlock(self);
            }
        } else if (percent - 0.0 < EPS) {
            self.isBottom = YES;
            if (self.startBlock) {
                self.startBlock(self);
            }
        }
    }
    
    if (self.scrollBlock) {
        self.scrollBlock(self, percent);
    }
}
@end

