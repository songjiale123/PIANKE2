//
//  PKLandingViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLandingViewController.h"
#import "PkThirdLandingView.h"
#import "PKEmailLandingView.h"
#import "PKfourLandingView.h"
#import "PKLoginViewController.h"
#import "PKLeftMenuViewController.h"
@interface PKLandingViewController ()<UITextFieldDelegate>
@property (strong, nonatomic)PkThirdLandingView *thirdLandingView;
@property (strong, nonatomic)PKEmailLandingView *emailLandingView;
@property (strong, nonatomic)PKfourLandingView *fourLandingView;
@property (copy, nonatomic)NSString *imageField;
@end

@implementation PKLandingViewController

- (void)viewDidLoad {
    WS(weakSelf);
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.thirdLandingView];
    [_thirdLandingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.height.equalTo(130);
    }];
    [self.view addSubview:self.emailLandingView];
    [_emailLandingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.thirdLandingView.mas_top);        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(200);
    }];
    [self.view addSubview:self.fourLandingView];
    [_fourLandingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(20);
        make.left.equalTo(weakSelf.view.mas_left);
         make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(240);
        
    }];
    
}

- (PkThirdLandingView *)thirdLandingView{
    if (!_thirdLandingView) {
        _thirdLandingView = [[PkThirdLandingView alloc]init];
    }
    return _thirdLandingView;
}
- (PKEmailLandingView *)emailLandingView{
    if (!_emailLandingView) {
        _emailLandingView = [[PKEmailLandingView alloc]init];
        _emailLandingView.emailText.delegate =self;
        _emailLandingView.passwordText.delegate =self;
        [_emailLandingView.landingBtn addTarget:self action:@selector(emailLandHttpRequest) forControlEvents:UIControlEventTouchUpInside ];
    }
    return _emailLandingView;
}
- (PKfourLandingView *)fourLandingView{
    if (!_fourLandingView) {
        _fourLandingView = [[PKfourLandingView alloc]init];
        [_fourLandingView.returnBtn addTarget:self action:@selector(pushToLeftViewController) forControlEvents:UIControlEventTouchUpInside];
        [_fourLandingView.loginBtn addTarget:self action:@selector(pushToLoginViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fourLandingView;
}
-(void)emailLandHttpRequest{
    
    [_emailLandingView.emailText resignFirstResponder];
    [_emailLandingView.passwordText resignFirstResponder];
    if ([_emailLandingView.emailText.text isEmptyString]) {
        [self.view makeToast:@"用户名不能为空" duration:1 position:@"center"];
    }else if ([_emailLandingView.passwordText.text isEmptyString]){
        
        [self.view makeToast:@"密码不能为空" duration:1 position:@"center"];
    }else{
        WS(weakSelf);
        [ZJPBaseHttpTool postWithPath:@"http://api2.pianke.me/user/login" params:[self makeLoginRequestDic]   success:^(id JSON) {
            NSDictionary *returnDic = JSON;
            if ([returnDic[@"result"]integerValue] == 1) {
                [weakSelf.view makeToast:@"登陆成功" duration:1 position:@"center"];
            } else {
                [weakSelf.view makeToast:[returnDic[@"data"]valueForKey:@"msg"] duration:1 position:@"center"];
            }
            
        } failure:^(NSError *error) {
            [weakSelf.view makeToast:@"登陆失败" duration:1 position:@"center"];
        } ];
    }
}

- (NSDictionary *)makeLoginRequestDic{
    NSDictionary *dic = @{@"client":@"1",
                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"email":_emailLandingView.emailText.text,
                          @"gender":@"1",
                          @"passwd":_emailLandingView.passwordText.text,
                          @"version":@"3.0.6",
                          @"auth":@"",
                          };
    return dic;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    WS(weakSelf);
    if (textField == _emailLandingView.emailText ) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 60;
            weakSelf.view.bounds = rect;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 80;
            weakSelf.view.bounds = rect;
        }];
    }
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_emailLandingView.emailText resignFirstResponder];
    [_emailLandingView.passwordText resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0 ;
        weakSelf.view.bounds =rect;
        
    }];
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [_emailLandingView.emailText resignFirstResponder];
//    [_emailLandingView.passwordText resignFirstResponder];
      [self.view endEditing:YES];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
}

-(void)pushToLeftViewController{
    PKLeftMenuViewController * left =[[PKLeftMenuViewController alloc]init];
    [self presentViewController:left animated:YES completion:nil];
}
-(void)pushToLoginViewController{
    PKLoginViewController * login = [[PKLoginViewController alloc]init];
    [self presentViewController:login animated:YES completion:nil];

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
