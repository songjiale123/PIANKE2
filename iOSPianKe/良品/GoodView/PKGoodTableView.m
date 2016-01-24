//
//  PKGoodTableView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/23.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKGoodTableView.h"
#import "PKGoodTableViewCell.h"
@interface PKGoodTableView ()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation PKGoodTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 220;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellque=@"cell";
    PKGoodTableViewCell * tablecell = [tableView  dequeueReusableCellWithIdentifier:cellque];
    if (!tablecell) {
        tablecell = [[PKGoodTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellque];
    }
    [tablecell setContentOfCellWithList:self.list[indexPath.row]];
    return tablecell;
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (self.list == nil) {
        return 0;
    } else {
        return self.list.count;
    }
    
}



@end
