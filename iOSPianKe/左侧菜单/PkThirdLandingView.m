//
//  PkThirdLandingView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PkThirdLandingView.h"
#import "Masonry.h"
@implementation PkThirdLandingView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.xinlangBtn];
         [self addSubview:self.renrenBtn];
         [self addSubview:self.DoubanBtn];
        [self  addSubview:self.tenentBtn];
         [self addSubview:self.lineLabel];
        [self addSubview:self.textLabel];
        [self addlayout];
    }
    return self;
}
-(void)addlayout{
    WS(ws);
    
    CGFloat width = (VIEW_WIDTH-100.0)/5.0;
    [_xinlangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(width);
        make.size.equalTo(CGSizeMake(25,25 ));
        make.centerY.equalTo(ws.mas_centerY);
    }];
    
    [_renrenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.xinlangBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(ws.mas_centerY);
    }];
    [_DoubanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.renrenBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(ws.mas_centerY);

    }];
    [_tenentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.DoubanBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(ws.mas_centerY);
        
    }];
   [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.size.equalTo(CGSizeMake(125, 13));
       make.centerX.equalTo(ws.mas_centerX);
       make.top.equalTo(ws.mas_top).offset(20);
       
   }];
   [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.height.equalTo(0.5);
       make.right.equalTo(ws.mas_right).offset(-width);
       make.left.equalTo(ws.mas_left).offset(width);
       make.centerY.equalTo(ws.textLabel.mas_centerY);
   }];
    
}
-(UIButton *)xinlangBtn{
    if (!_xinlangBtn) {
        _xinlangBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_xinlangBtn setImage:[UIImage imageNamed:@"新浪"] forState:UIControlStateNormal];
    }
    return _xinlangBtn;
}
-(UIButton *)renrenBtn{
    if (!_renrenBtn) {
        _renrenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_renrenBtn setImage:[UIImage imageNamed:@"人人"] forState:UIControlStateNormal];
    }
    return _renrenBtn;
}
-(UIButton *)DoubanBtn{
    if (!_DoubanBtn) {
        _DoubanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_DoubanBtn setImage:[UIImage imageNamed:@"豆瓣"] forState:UIControlStateNormal];
    }
    return _DoubanBtn;
}
-(UIButton *)tenentBtn{
    if (!_tenentBtn) {
        _tenentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tenentBtn setImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
    }
    return _tenentBtn;
}
-(UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]init];
        _textLabel.text = @"合作伙伴登陆片刻";
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.backgroundColor = [UIColor whiteColor];
        _textLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _textLabel;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel;
}
@end

