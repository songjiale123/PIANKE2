//
//  PKfourLandingView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKfourLandingView.h"
#import "Masonry.h"
@implementation PKfourLandingView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.returnBtn];
        [self addSubview:self.loginBtn];
        [self addSubview:self.pianke];
        [self addlayout];
    }
    return self;
}
-(void)addlayout{
    WS(ws);
   [ _returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(ws.mas_top).offset(8);
       make.left.equalTo(ws.mas_left).offset(8);
       make.size.equalTo(CGSizeMake(30, 30));
   }];
  [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.equalTo(ws.mas_top).offset(8);
      make.right.equalTo(ws.mas_right).offset(-8);
      make.size.equalTo(CGSizeMake(40, 30));
  }];
  [_pianke mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerX.equalTo(ws.mas_centerX);
      make.centerY.equalTo(ws.mas_centerY);
      make.height.equalTo(50);
  }];
    
}
-(UIButton *)returnBtn{
    if (!_returnBtn) {
        _returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    }
    return _returnBtn;
    
}
-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _loginBtn;
    
}
- (UIImageView *)pianke{
    if (!_pianke) {
        _pianke = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"片刻LOGO"]];
    }
    return _pianke;
}
@end
