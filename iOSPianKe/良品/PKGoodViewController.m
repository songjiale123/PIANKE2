//
//  PKGoodViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/23.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKGoodViewController.h"
#import "PKGoodTableView.h"
#import "Masonry.h"
#import "MJRefresh.h"
#import "PKGoodModel.h"
@interface PKGoodViewController ()
@property (strong, nonatomic) PKGoodTableView * tableView;
@property (strong, nonatomic) PKGoodModel * GoodModel;
@end

@implementation PKGoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self addAutoloyout];
    [self reloadFragmentTableData:0];
}

- (void)addAutoloyout{
    WS(weakSelf);
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (PKGoodTableView*)tableView{
    if (!_tableView) {
        _tableView = [[PKGoodTableView alloc] initWithFrame:self.view.frame style:(UITableViewStylePlain)];
        WS(weakSelf);
        //上拉加载的block回调方法
        _tableView.MoreDataBlock = ^(){
            // 隐藏当前的上拉刷新控件
            [weakSelf reloadFragmentTableData:0];
        };
        //下拉加载的block回调方法
        _tableView.NewDataBlock = ^(){
            [weakSelf reloadFragmentTableData:10];
        };
    }
    return _tableView;
}

-(void)reloadFragmentTableData:(NSInteger)start{
    NSDictionary *requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                 @"client":@"1",
                                 @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                 @"limit":@"10",
                                 @"start":[NSString stringWithFormat:@"%li",start],
                                 @"version":@"3.0.6"};
    WS(weakSelf);
    [self POSTHttpRequest:@"http://api2.pianke.me/pub/shop" dic:requestDic successBalck:^(id JSON) {
        NSDictionary * returnDic = JSON;
        PKGoodModel *model = [[PKGoodModel alloc] initWithDictionary:returnDic];
        if (model.result == 1) {
            NSLog(@"请求成功");
            weakSelf.tableView.list = model.data.list;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.tableView reloadData];
            });
        }
        
        
    } errorBlock:^(NSError *error) {

    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
