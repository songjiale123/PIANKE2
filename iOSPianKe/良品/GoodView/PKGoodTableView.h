//
//  PKGoodTableView.h
//  iOSPianKe
//
//  Created by ma c on 16/1/23.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^loadNewDatablock)();
typedef void(^loadMoreDatablock)();

@interface PKGoodTableView : UITableView

@property (strong, nonatomic) NSArray *list;
@property(copy, nonatomic) loadNewDatablock NewDataBlock;
@property(copy, nonatomic) loadMoreDatablock MoreDataBlock;
@end
