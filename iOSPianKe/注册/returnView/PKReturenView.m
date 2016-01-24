//
//  PKReturenView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/16.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKReturenView.h"
#import "Masonry.h"
@interface PKReturenView()<UIActionSheetDelegate>

@end
@implementation PKReturenView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.returnBtn];
        [self addSubview:self.iconImageBtn];
        [self addSubview:self.ManBtn];
        [self addSubview:self.GirlBtn];
        [self addLayout];
    }
    return self;
}
-(void)addLayout{
    WS(ws);
   [_returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(ws.mas_top).offset(28);
       make.left.equalTo(ws.mas_left).offset(8);
       make.size.equalTo(CGSizeMake(30, 30));
   }];
   [_iconImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.centerX.equalTo(ws.mas_centerX);
       make.centerY.equalTo(ws.mas_centerY);
       make.size.equalTo(CGSizeMake(60, 60));
   }];
   [_ManBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(90);
       make.bottom.equalTo(ws.mas_bottom);
       make.height.equalTo(30);
   }];
    [_GirlBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right).offset(-90);
        make.bottom.equalTo(ws.mas_bottom);
        make.height.equalTo(30);
    }];
}
-(UIButton *)returnBtn{
    if (!_returnBtn) {
        _returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    }
    return _returnBtn;
}
-(UIButton *)iconImageBtn{
    if (!_iconImageBtn) {
        _iconImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_iconImageBtn setImage:[UIImage imageNamed:@"上传头像"] forState:UIControlStateNormal];
        _iconImageBtn.layer.cornerRadius = 30.0;
        _iconImageBtn.layer.borderWidth = 1.0;
        
        _iconImageBtn.layer.borderColor =[UIColor clearColor].CGColor;
        
        _iconImageBtn.clipsToBounds = TRUE;//去除边界
    }
    return _iconImageBtn;
}
-(UIButton *)ManBtn{
    if (!_ManBtn) {
        _ManBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _ManBtn.selected = NO;
        [_ManBtn setImage:[UIImage imageNamed:@"男"] forState:UIControlStateNormal];
        [_ManBtn setImage:[UIImage imageNamed:@"男_sel"] forState:UIControlStateSelected];
        _ManBtn.tag = 100;
    }
    [_ManBtn addTarget:self action:@selector(changeSexBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    return _ManBtn;
}
-(UIButton *)GirlBtn{
    if (!_GirlBtn) {
        _GirlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _GirlBtn.selected = NO;
        [_GirlBtn setImage:[UIImage imageNamed:@"女"] forState:UIControlStateNormal];
         [_GirlBtn setImage:[UIImage imageNamed:@"女_sel"] forState:UIControlStateSelected];
        _GirlBtn.tag = 101;
            [_GirlBtn addTarget:self action:@selector(changeSexBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _GirlBtn;
}


-(void)changeSexBtnMethod:(UIButton *)sender{
    if (self.ManBtn.selected == NO&&self.GirlBtn.selected ==NO ) {
        sender.selected = YES;
    }else if(sender.tag ==100){
           sender.selected =YES;
        _GirlBtn.selected = NO;
     
    }else if(sender.tag == 101){
        sender.selected =YES;
        _ManBtn.selected = NO;
        
    }
    
}
@end
