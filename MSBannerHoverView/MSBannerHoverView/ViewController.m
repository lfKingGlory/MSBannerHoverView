//
//  ViewController.m
//  MSBannerHoverView
//
//  Created by msj on 2017/8/1.
//  Copyright © 2017年 msj. All rights reserved.
//

#import "ViewController.h"
#import "MSHomeView.h"

@interface ViewController ()<UITableViewDataSource>
@property (strong, nonatomic) UITableView *scrollView;
@property (strong, nonatomic) MSHomeView *homeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.scrollView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.scrollView.dataSource = self;
    self.scrollView.rowHeight = 64;
    self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(250, 0, 0, 0);
    [self.view addSubview:self.scrollView];
    
    self.homeView = [[MSHomeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    self.homeView.hoverHeight = 64;
    self.homeView.headerScrollView = self.scrollView;
    [self.view addSubview:self.homeView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fwefkklw"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fwefkklw"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

@end
