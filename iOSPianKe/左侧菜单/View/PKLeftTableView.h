//
//  PKLeftTableView.h
//  iOSPianKe
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//
@protocol PKLeftTableViewselectRow <NSObject>
- (void)selectWhichRow:(NSInteger)row;
@end
#import <UIKit/UIKit.h>

@interface PKLeftTableView : UITableView
@property (weak, nonatomic)    id<PKLeftTableViewselectRow>RowDelegate;
@end
