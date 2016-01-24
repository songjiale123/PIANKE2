//
//  PKGoodTableViewCell.m
//  iOSPianKe
//
//  Created by ma c on 16/1/23.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKGoodTableViewCell.h"
#import "Masonry.h"
#import "PKGoodModel.h"
#import "UIImageView+SDWedImage.h"
@implementation PKGoodTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [ super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.GoodImage];
      
        [self addSubview:self.GoodLable];
        [self addSubview:self.GoodButton];
        [self addSubview:self.LineLabel];
        [self addlayout];
    }
    
    return self;
}

- (void)addlayout{
    WS(ws);
    
    [_GoodImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(20);
        make.left.equalTo(ws.mas_left).offset(20);
        make.right.equalTo(ws.mas_right).offset(-20);
        make.height.equalTo(160);
        
    }];
    
    [_GoodLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (ws.GoodImage.mas_bottom).offset(10);
        make.left.equalTo(ws.mas_left).offset(20);
        make.height.equalTo(20);

    }];
    [_GoodButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (ws.GoodImage.mas_bottom).offset(10);
        make.left.equalTo(ws.GoodLable.mas_right).offset(20);
        make.right.equalTo(ws.mas_right).offset(-20);
        make.size.equalTo(CGSizeMake(60, 25));
    }];
    [_LineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.GoodLable.mas_bottom).offset(10);
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.height.equalTo(0.5);

    }];
}


-(UIImageView *)GoodImage{
    if (!_GoodImage) {
        
        _GoodImage = [[UIImageView alloc]init];
    }
    return _GoodImage;
}

-(UILabel *)GoodLable{
    if (!_GoodLable) {
        
        _GoodLable = [[UILabel alloc]init];
        _GoodLable.font = [UIFont systemFontOfSize:13.0];
        _GoodLable.textAlignment = NSTextAlignmentLeft;
    }

    return _GoodLable;
}
-(UIButton *)GoodButton{
    if (!_GoodButton) {
        _GoodButton = [[UIButton alloc]init];
        _GoodButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [ _GoodButton setImage:[UIImage imageNamed:@"男_sel"] forState:UIControlStateNormal];
     }
    
    return _GoodButton;
}
-(UILabel *)LineLabel{
    if (!_LineLabel) {
        _LineLabel = [[UILabel alloc]init];
        _LineLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _LineLabel;
}
#pragma mark - 设置cell的内容
- (void)setContentOfCellWithList:(List *)list {

    [self.GoodImage downloadImage:list.coverimg];
    self.GoodLable.text = list.title;
    [self.GoodButton setTitle:list.buyurl forState:UIControlStateNormal];

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
