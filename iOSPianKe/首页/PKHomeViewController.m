//
//  PKHomeViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKHomeViewController.h"
@interface PKHomeViewController ()

@end

@implementation PKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    UIBarButtonItem * buttonlol = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigation_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(presentLeftMenuViewController:)];
//    self.view.backgroundColor = [UIColor whiteColor];
    //首页
    
     UIButton * btnn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnn  setBackgroundImage:[UIImage imageNamed:@"navigation_icon"] forState:UIControlStateNormal];
    btnn.frame = CGRectMake(200, 0, 20, 20);
    [btnn addTarget:self action:@selector(presentLeftMenuViewController:)
      forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * buttonlol1 = [[UIBarButtonItem alloc]initWithCustomView:btnn];
    //首页
    UIButton * bttn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [bttn1 setTitle:@"首页" forState:UIControlStateNormal];
    [bttn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    bttn1.frame = CGRectMake(200, 0, 50, 20);
    UIBarButtonItem * buttonlol2 = [[UIBarButtonItem alloc]initWithCustomView:bttn1];
    self.navigationItem.leftBarButtonItems = @[buttonlol1,buttonlol2];
   
    //碎片
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
  [button1 setBackgroundImage:[UIImage imageNamed:@"nav碎片_sel"]
                      forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(presentRightMenu)
     forControlEvents:UIControlEventTouchUpInside];
    button1.frame = CGRectMake(100, 0 , 20 , 20);
     UIBarButtonItem * first1  = [[UIBarButtonItem alloc] initWithCustomView:button1];
    //雷电
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setBackgroundImage:[UIImage imageNamed:@"nav雷电_sel"]
                       forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(presentRightMenu)
      forControlEvents:UIControlEventTouchUpInside];
    button2.frame = CGRectMake(200, 0 , 20 , 20);
     UIBarButtonItem * first2  = [[UIBarButtonItem alloc] initWithCustomView:button2];
    
    //旗
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setBackgroundImage:[UIImage imageNamed:@"nav旗1_sel"]
                       forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(presentRightMenu)
      forControlEvents:UIControlEventTouchUpInside];
    button3.frame = CGRectMake(300, 0 , 20 , 20);
    UIBarButtonItem * first3  = [[UIBarButtonItem alloc] initWithCustomView:button3];
    self.navigationItem.rightBarButtonItems =@[first1,first2,first3];

    
    
}
-(void)presentRightMenu{
    
//    PkFragmentViewController * fragment = [[PkFragmentViewController alloc]init];
//
//     [self.navigationController  pushViewController:fragment animated:YES];
//    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end