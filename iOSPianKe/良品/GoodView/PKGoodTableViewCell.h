//
//  PKGoodTableViewCell.h
//  iOSPianKe
//
//  Created by ma c on 16/1/23.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class List;

@interface PKGoodTableViewCell : UITableViewCell
@property (strong, nonatomic)  UIImageView * GoodImage;
@property (strong, nonatomic)  UILabel * GoodLable;
@property (strong, nonatomic)  UIButton * GoodButton;
@property (strong, nonatomic)  UILabel * LineLabel;

- (void)setContentOfCellWithList:(List *)list;

@end
