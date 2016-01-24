//
//  PKLeftMenuViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLeftMenuViewController.h"
#import "PKLeftHeadeView.h"//头部
#import "PKLeftTableView.h"//列表选项
#import "PKLeftMusicView.h"//底部音乐播放器
#import "PKLandingViewController.h"//登陆界面
#import "PKSettingViewController.h" //设置
#import "PKGoodViewController.h"//良品
#import "PKCommuityViewController.h"//社区
#import "PKFaceBookViewController.h"//阅读
#import "PKRadioViewController.h"//电台
//碎片//顶顶顶顶
#import "PKHomeViewController.h"
#import "ZJPNavigationController.h"
@interface PKLeftMenuViewController ()<PKLeftTableViewselectRow>
@property (strong,nonatomic)   PKLeftHeadeView *leftHeadView;
@property (strong,nonatomic) PKLeftTableView* leftTable;
@property (strong,nonatomic) PKLeftMusicView *musicView;
@end

@implementation PKLeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.backgroundColor = RGB(51, 51, 51);
   [self.view addSubview:self.leftheadView];
    [self.view addSubview:self.leftTable];
    [self.view addSubview:self.musicView];
    WS(weakSelf);
    
    [_leftHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.height.equalTo(180);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right).offset(-45);
    }];
  [_leftTable mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.equalTo(weakSelf.leftHeadView.mas_bottom);
      make.right.equalTo(weakSelf.view.mas_right);
      make.left.equalTo(weakSelf.view.mas_left);
      make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-60);
  }];
    [_musicView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-45);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom);
        make.height.mas_equalTo(@60);
    }];

}
//侧边顶部信息View
- (PKLeftHeadeView*)leftheadView{
    if (!_leftHeadView) {
        _leftHeadView = [[PKLeftHeadeView alloc]init];
        [_leftHeadView.iconImageBtn addTarget:self action:@selector(pushToLandingViewController) forControlEvents:  UIControlEventTouchUpInside ];
          [_leftHeadView.usernameBtn addTarget:self action:@selector(pushToLandingViewController) forControlEvents:  UIControlEventTouchUpInside ];
    }
    return _leftHeadView;
    
}
//中间切换视图的列表
-(PKLeftTableView *)leftTable{
    if (!_leftTable) {
        _leftTable = [[PKLeftTableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _leftTable.RowDelegate =self;
    }
    
    return _leftTable;
}
-(PKLeftMusicView *)musicView{
    
    if (!_musicView) {
        _musicView = [[PKLeftMusicView alloc]init];
    }
    return _musicView;
}
#pragma mark - RowDelegate
//执行跳转的代理方法
- (void)selectWhichRow:(NSInteger)row{
    switch (row) {
        case 0:{
            PKHomeViewController *homeController = [[PKHomeViewController alloc]init];
            ZJPNavigationController * homeNav = [[ZJPNavigationController alloc]initWithRootViewController:homeController];
            [self.sideMenuViewController setContentViewController:homeNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
  
        }
            break;
        case 1:
        {
            PKRadioViewController *radioController = [[PKRadioViewController alloc]init];
            radioController.title = @"电台";
            ZJPNavigationController *radioNav = [[ZJPNavigationController alloc]initWithRootViewController:radioController];
            [self.sideMenuViewController setContentViewController:radioNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
        case 2:
        {
            PKFaceBookViewController * facebook = [[PKFaceBookViewController alloc]init];
            facebook.title = @"阅读";
            ZJPNavigationController * facenav = [[ZJPNavigationController alloc]initWithRootViewController:facebook];
            [self.sideMenuViewController setContentViewController:facenav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            
        }
        case 3:
        {
            PKCommuityViewController * commuity = [[PKCommuityViewController alloc]init];
            commuity.title = @"社区";
            ZJPNavigationController * commuitynav = [[ZJPNavigationController alloc]initWithRootViewController:commuity];
            [self.sideMenuViewController setContentViewController:commuitynav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
        case 4:
        {
            
//            PkFragmentViewController * fragment = [[PkFragmentViewController alloc]init];
//            fragment.title = @"碎片";
//            ZJPNavigationController * fragmentnav = [[ZJPNavigationController alloc]
//                                                     initWithRootViewController:fragment];
//            [self.sideMenuViewController  setContentViewController:fragmentnav animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            
        }
        case 5:
        {
            PKGoodViewController * goodprod = [[PKGoodViewController alloc]init];
            goodprod.title = @"良品";
            ZJPNavigationController * goodprodnav = [[ZJPNavigationController alloc]initWithRootViewController:goodprod];
            [self.sideMenuViewController setContentViewController:goodprodnav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            
        }
        case 6:
        {
            PKSettingViewController * setting = [[PKSettingViewController alloc]init];
            setting.title = @"设置";
            ZJPNavigationController * settingnav = [[ZJPNavigationController alloc]initWithRootViewController:setting];
            [self.sideMenuViewController setContentViewController:settingnav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            
            
        }
        default:
            break;
    }
    
}
-(void)pushToLandingViewController{
    PKLandingViewController * landing = [[PKLandingViewController alloc]init];
       [self presentViewController:landing animated:YES completion:nil];
    
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
