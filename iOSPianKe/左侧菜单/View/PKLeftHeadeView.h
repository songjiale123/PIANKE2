//
//  PKLeftHeadeView.h
//  iOSPianKe
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKLeftHeadeView : UIView

@property (strong, nonatomic) UIButton * iconImageBtn; //头像
@property (strong, nonatomic) UIButton * usernameBtn; //用户登陆按钮
@property (strong, nonatomic) UIButton * downBtn;// 下载按钮
@property (strong, nonatomic) UIButton * collecBtn; //收藏按钮
@property (strong, nonatomic) UIButton * messageBtn;//消息按钮
@property (strong, nonatomic) UIButton * writeBtn;//写评论
@property (strong, nonatomic) UIButton * searchBtn;//搜索按钮 
@property (strong, nonatomic) UIImageView * backImage;

@end
