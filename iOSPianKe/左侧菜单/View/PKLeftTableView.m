//
//  PKLeftTableView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLeftTableView.h"
#import "PKLeftTableViewCell.h"
#import "PKLandingViewController.h"
@interface PKLeftTableView()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)  NSArray *imageArray;
@property (strong, nonatomic)  NSArray *titleArray;
@end

@implementation PKLeftTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource =self;
        self.bounces =NO;
        
        self.imageArray = @[@"首页",@"电台",@"阅读",@"社区",@"碎片",@"良品",@"设置"];
        self.titleArray = @[@"首页",@"电台",@"阅读",@"社区",@"碎片",@"良品",@"设置"];
    [self registerClass:[PKLeftTableViewCell class] forCellReuseIdentifier:@"cell"];
  
    self.separatorStyle = NO;
    self.backgroundColor = RGB(51, 51, 51);
          }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifier =@"cell";
    PKLeftTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.imagerView.image = [UIImage imageNamed:_imageArray[indexPath.row]];
    cell.labell.text = _titleArray[indexPath.row];
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_RowDelegate performSelector:@selector(selectWhichRow:)]) {
        [_RowDelegate selectWhichRow:indexPath.row];
    }
    
}
@end
