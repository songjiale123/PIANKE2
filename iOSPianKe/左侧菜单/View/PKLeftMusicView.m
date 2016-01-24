//
//  PKLeftMusicView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLeftMusicView.h"
#import "Masonry.h"
@implementation PKLeftMusicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backBtn];
        [self addSubview:self.musicImage];
        [self addSubview:self.musicname];
        [self addSubview:self.startBtn];
        [self addSubview:self.musicFrom];
        
    }
    return self;
}
-(void)layoutSubviews{
    WS(weakSelf);
   [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
   }];
   [_startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.centerY.equalTo(weakSelf.mas_centerY);
       make.right.mas_equalTo(weakSelf.mas_right).offset(-30);
       make.size.mas_equalTo(CGSizeMake(20, 20));
   }];
   [_musicImage mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(weakSelf.mas_left).offset(10);
       make.centerY.equalTo(weakSelf.mas_centerY);
       make.size.mas_equalTo(CGSizeMake(40, 40));
       
   }];
   [_musicname mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(weakSelf.musicImage.mas_right).offset(10);
       make.centerY.equalTo(weakSelf.mas_centerY).offset(-8);
       make.height.equalTo(16);
       make.right.equalTo(weakSelf.startBtn.mas_left).offset(-20);
   }];
    [_musicFrom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.musicImage.mas_right).offset(10);
        make.right.equalTo(weakSelf.startBtn.mas_left).offset(-20);
        make.centerY.equalTo(weakSelf.mas_centerY).offset(8);
        make.height.equalTo(11);
    }];
    
}
- (UIImageView *)musicImage {
    if (!_musicImage) {
        _musicImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"音乐" ]];
    }
    
    return _musicImage;
}
-(UILabel *)musicname{
    if (!_musicname) {
        _musicname = [[UILabel alloc]init];
        _musicname.textColor= [UIColor whiteColor];
        _musicname.text = @"112333";
        _musicname.font =[UIFont systemFontOfSize:15];
    }

    return _musicname;
}
-(UILabel *)musicFrom{
    if (!_musicFrom) {
        _musicFrom = [[UILabel alloc]init];
        _musicFrom.textColor= [UIColor whiteColor];
        _musicFrom.textAlignment = NSTextAlignmentLeft;
        _musicFrom.text = @"1111111";
        _musicFrom.font =[UIFont systemFontOfSize:10.0];
    }
    return _musicFrom;
}
-(UIButton *)startBtn{
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _startBtn.selected = NO;
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"播放"] forState:UIControlStateNormal];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"暂停"] forState:UIControlStateSelected];
        _startBtn.tag =100;
        [_startBtn addTarget:self action:@selector(changesexbtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}

-(void)changesexbtnMethod:(UIButton *)sender{
    if (sender==self.startBtn) {
     
        
        
        
    }
}
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.backgroundColor = RGB(28, 28, 28);
    }
    return _backBtn;
    
}
@end
