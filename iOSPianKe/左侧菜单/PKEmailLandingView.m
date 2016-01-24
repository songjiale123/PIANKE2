//
//  PKEmailLan/Users/mac/Desktop/`HJ)}39{ALJPSU%)EVR0EBK.jpgdingView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKEmailLandingView.h"
#import "Masonry.h"
@interface PKEmailLandingView()<UITextFieldDelegate>

@end
@implementation PKEmailLandingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.lineLabel1];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.tostLabel1];
        [self addSubview:self.tostLabel2];
        [self addSubview:self.emailText];
        [self addSubview:self.passwordText];
        [self addSubview:self.landingBtn];
        [self addlayoutIn];
    }
    return self;
}
-(void)addlayoutIn{
    WS(ws);
   [_lineLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo (ws.mas_left).offset(40);
       make.right.equalTo(ws.mas_right).offset(-40);
       make.height.equalTo(0.5);
       make.top.equalTo(ws.mas_top).offset(60);
   }];
    [_lineLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(40);
        make.right.equalTo(ws.mas_right).offset(-40);
        make.height.equalTo(0.5);
        make.top.equalTo(ws.lineLabel1.mas_bottom).offset(55);
    }];
    [_tostLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.lineLabel1.mas_left);
        make.size.equalTo(CGSizeMake(50, 13));
        make.bottom.equalTo(ws.lineLabel1.mas_top).offset(-10);
    }];
    [_tostLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.lineLabel2.mas_left);
        make.size.equalTo(CGSizeMake(50, 13));
        make.bottom.equalTo(ws.lineLabel2.mas_top).offset(-10);
    }];
    [_emailText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.tostLabel1.mas_right).offset(5);
        make.right.equalTo(ws.lineLabel1.mas_right);
        make.height.equalTo(33);
        make.bottom.equalTo(ws.lineLabel1.mas_top);
    }];
    [_passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.tostLabel2.mas_right).offset(5);
        make.right.equalTo(ws.lineLabel2.mas_right);
        make.height.equalTo(33);
        make.bottom.equalTo(ws.lineLabel2.mas_top);
    }];
    [_landingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(45);
        make.left.equalTo(ws.lineLabel1.mas_left);
        make.right.equalTo(ws.lineLabel1.mas_right);
        make.top.equalTo(ws.lineLabel2.mas_bottom).offset(25);
        
    }];
    
}
-(UILabel *)lineLabel1{
    if (!_lineLabel1) {
        _lineLabel1 = [[UILabel alloc]init];
        _lineLabel1.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel1;
}

-(UILabel *)lineLabel2{
    if (!_lineLabel2) {
        _lineLabel2 = [[UILabel alloc]init];
        _lineLabel2.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel2;
}
-(UILabel *)tostLabel1{
    if (!_tostLabel1) {
        _tostLabel1 = [[UILabel alloc]init];
        _tostLabel1.text = @"邮箱:";
        _tostLabel1.textColor = [UIColor blackColor];
        _tostLabel1.textAlignment = NSTextAlignmentLeft;
        _tostLabel1.font = [UIFont systemFontOfSize:17.0];
    }
    return _tostLabel1;
}
-(UILabel *)tostLabel2{
    if (!_tostLabel2) {
        _tostLabel2 = [[UILabel alloc]init];
        _tostLabel2.text = @"密码:";
        _tostLabel2.textColor = [UIColor blackColor];
        _tostLabel1.textAlignment = NSTextAlignmentLeft;
        _tostLabel1.font = [UIFont systemFontOfSize:17.0];
    
    }
    return _tostLabel2;
}
-(UITextField *)emailText{
   
    if (!_emailText) {
        _emailText = [[UITextField alloc]init];
        _emailText.delegate = self;
        _emailText.borderStyle = UITextBorderStyleNone;
        //_emailText.clearsOnBeginEditing = YES; // 点击再次编辑就清空
        _emailText.clearButtonMode = UITextFieldViewModeAlways; //输入框后面有个叉号清空内容
    }
    
    return _emailText;
}
- (UITextField *)passwordText{
    if (!_passwordText) {
        _passwordText = [[UITextField alloc]init];
        _passwordText.secureTextEntry = YES;//textfield中文字以密码形式显示
        _passwordText.delegate = self;
        _passwordText.borderStyle =UITextBorderStyleNone;
       // _passwordText.keyboardType = UIKeyboardTypeNumberPad;  //用于键盘样式
        _passwordText.clearButtonMode = UITextFieldViewModeAlways;
    }
    
    return _passwordText;
}
-(UIButton *)landingBtn{
    
    if (!_landingBtn) {
       
        _landingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_landingBtn setBackgroundColor:RGB(119, 182, 69)];
        [_landingBtn setTitle:@"登录" forState:UIControlStateNormal];
        
    }
    
    return _landingBtn;
}


@end