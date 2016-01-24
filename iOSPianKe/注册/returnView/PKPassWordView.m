//
//  PKPassWordView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/16.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKPassWordView.h"
#import "Masonry.h"
@interface PKPassWordView()<UITextFieldDelegate>

@end
@implementation PKPassWordView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.linelable];
        [self addSubview:self.linelable2];
        [self addSubview:self.linelable3];
        [self addSubview:self.tostlable1];
        [self addSubview:self.tostlable2];
        [self addSubview:self.tostlable3];
        [self addSubview:self.nameText];
        [self addSubview:self.emailText];
        [self addSubview:self.passwordText];
        [self addSubview:self.paseBtn];
        [self addLayout];
    }
    return self;
}
-(void)addLayout{
    WS(ws);
   [_linelable mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(ws.mas_top).offset(60);
       make.left.equalTo(ws.mas_left).offset(40);
       make.right.equalTo(ws.mas_right).offset(-40);
       make.height.equalTo(0.5);
   }];
   [_linelable2 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(ws.linelable.mas_bottom).offset(55);
       make.left.equalTo(ws.mas_left).offset(40);
       make.right.equalTo(ws.mas_right).offset(-40);
       make.height.equalTo(0.5);
       
   }];
   [_linelable3 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(ws.linelable2.mas_bottom).offset(55);
       make.left.equalTo(ws.mas_left).offset(40);
       make.right.equalTo(ws.mas_right).offset(-40);
       make.height.equalTo(0.5);
   }];
   [_tostlable1 mas_makeConstraints:^(MASConstraintMaker *make) {
      
       make.left.equalTo(ws.linelable.mas_left);
       make.bottom.equalTo(ws.linelable.mas_top).offset(-10);
       make.size.equalTo(CGSizeMake(50, 13));
   }];
   [_tostlable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.linelable2.mas_left);
        make.bottom.equalTo(ws.linelable2.mas_top).offset(-10);
        make.size.equalTo(CGSizeMake(50, 13));
    }];
    [_tostlable3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.linelable3.mas_left);
        make.bottom.equalTo(ws.linelable3.mas_top).offset(-10);
        make.size.equalTo(CGSizeMake(50, 13));
    }];
    [_nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.tostlable1.mas_right).offset(5);
        make.right.equalTo(ws.linelable.mas_right);
        make.bottom.equalTo(ws.linelable.mas_top);
        make.height.equalTo(33);
        
    }];
    [_emailText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.tostlable2.mas_right).offset(5);
        make.right.equalTo(ws.linelable2.mas_right);
        make.bottom.equalTo(ws.linelable2.mas_top);
        make.height.equalTo(33);
    }];
    [_passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.tostlable3.mas_right);
        make.right.equalTo(ws.linelable3.mas_right);
        make.bottom.equalTo(ws.linelable3.mas_top);
        make.height.equalTo(33);
    }];
    [_paseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.tostlable3.mas_bottom).offset(50);
        make.left.equalTo(ws.mas_left).offset(40);
        make.right.equalTo(ws.mas_right).offset(-40);
        make.height.equalTo(40);
        
    }];
    
    
}
-(UILabel *)linelable{
    if (!_linelable) {
        _linelable = [[UILabel alloc]init];
        _linelable.backgroundColor = [UIColor lightGrayColor];
    }
    return _linelable;
}
-(UILabel *)linelable2{
    if (!_linelable2) {
        _linelable2 = [[UILabel alloc]init];
        _linelable2.backgroundColor = [UIColor lightGrayColor];
    }
    return _linelable2;
}
-(UILabel *)linelable3{
    if (!_linelable3) {
        _linelable3 = [[UILabel alloc]init];
        _linelable3.backgroundColor = [UIColor lightGrayColor];
    }
    return _linelable3;
}
-(UILabel *)tostlable1{
    if (!_tostlable1) {
        
        _tostlable1 = [[UILabel alloc]init];
        _tostlable1.text = @"昵称:";
        _tostlable1.textAlignment =  NSTextAlignmentLeft ;
        _tostlable1.font = [UIFont systemFontOfSize:15.0];
        
    }
    return _tostlable1;
}
-(UILabel *)tostlable2{
    if (!_tostlable2) {
        
        _tostlable2 = [[UILabel alloc]init];
        _tostlable2.text = @"邮箱:";
        _tostlable2.textAlignment =  NSTextAlignmentLeft ;
        _tostlable2.font = [UIFont systemFontOfSize:15.0];
        
    }
    return _tostlable2;
}
-(UILabel *)tostlable3{
    if (!_tostlable3) {
        
        _tostlable3 = [[UILabel alloc]init];
        _tostlable3.text = @"密码:";
        _tostlable3.textAlignment =  NSTextAlignmentLeft ;
        _tostlable3.font = [UIFont systemFontOfSize:15.0];
        
    }
    return _tostlable3;
}

-(UITextField *)nameText{
    if (!_nameText) {
        _nameText = [[UITextField alloc] init];
        _nameText.borderStyle = UITextBorderStyleNone;
        _nameText.font =[UIFont systemFontOfSize:15.0];
        _nameText.delegate = self;
        _nameText.clearButtonMode = UITextFieldViewModeAlways; //X号一键清除所有内容
        _nameText.autocapitalizationType = UITextAutocapitalizationTypeNone;//关闭单词的首字母自动大写
    }
    return _nameText;
}

-(UITextField *)emailText{
    if (!_emailText) {
        _emailText = [[UITextField alloc] init];
        _emailText.font =[UIFont systemFontOfSize:15.0];
        _emailText.borderStyle = UITextBorderStyleNone;
        _emailText.clearButtonMode = UITextFieldViewModeAlways;
        _emailText.keyboardType = UIKeyboardTypeEmailAddress; //邮箱地址键盘样式
        _emailText.autocapitalizationType = UITextAutocapitalizationTypeNone;//关闭单词的首字母自动大写
       
    }
    return _emailText;
}
-(UITextField *)passwordText{
    if (!_passwordText) {
        _passwordText = [[UITextField alloc] init];
        _passwordText.font = [UIFont systemFontOfSize:15.0];
        _passwordText.borderStyle = UITextBorderStyleNone;
        _passwordText.clearButtonMode = UITextFieldViewModeAlways;
        _passwordText.autocapitalizationType = UITextAutocapitalizationTypeNone;//关闭单词的首字母自动大写

        _passwordText.secureTextEntry = YES; //开启密码变成点
    }
    return _passwordText;
}
-(UIButton *)paseBtn{
    if (!_paseBtn) {
        _paseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _paseBtn.backgroundColor = RGB(102, 170, 53);
        [_paseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        [ _paseBtn setTitle:@"完成" forState:UIControlStateNormal];
        _paseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _paseBtn;
}

@end
