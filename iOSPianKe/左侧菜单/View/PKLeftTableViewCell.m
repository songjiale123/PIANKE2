//
//  PKLeftTableViewCell.m
//  iOSPianKe
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLeftTableViewCell.h"
#import "Masonry.h"
@implementation PKLeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = RGB(51, 51, 51);
        [self addSubview:self.imagerView];
        [self addSubview:self.labell];
        [self addLayoutInCell];
    }
    return  self;
}

-(void)addLayoutInCell{
    WS(weakSelf);
    
    [_imagerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo (CGSizeMake(25, 25));
        make.centerY.equalTo (weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(20);
        
    }];
    [_labell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.imagerView.mas_right).offset(30);
        make.size.equalTo(CGSizeMake(50, 20));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
}

- (UIImageView *)imagerView {
    
    if (!_imagerView) {
        _imagerView = [[UIImageView alloc]init];
    }
    return _imagerView;

}
- (UILabel *)labell{
    if (!_labell) {
        _labell = [[UILabel alloc]init];
        _labell.textColor = [UIColor whiteColor];
        _labell.textAlignment = NSTextAlignmentLeft;
        _labell.font = [UIFont systemFontOfSize:14.0];
    }
    return _labell;
}
- (void)awakeFromNib {
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
