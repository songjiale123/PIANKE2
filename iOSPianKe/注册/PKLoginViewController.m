//
//  PKLoginViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/16.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLoginViewController.h"
#import "PKLandingViewController.h"
#import "PKReturenView.h"
#import "PKPassWordView.h"
#import "Masonry.h"
@interface PKLoginViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>
@property (strong, nonatomic)         PKReturenView *returenView;
@property (strong, nonatomic)         PKPassWordView *passwordView;
@property (copy, nonatomic)           NSString *imageField;
@end

@implementation PKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(250, 250, 250);
    WS(ws);
    [self.view addSubview:self.returenView];
    [_returenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view.mas_top);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(240);
    }];
    [self.view addSubview:self.passwordView ];
    [_passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.returenView.mas_bottom).offset(2);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(330);
        
    }];
}
-(PKReturenView*)returenView{
    if (!_returenView) {
        _returenView = [[PKReturenView alloc]init];
    [_returenView.returnBtn addTarget:self action:@selector(pushToLandingViewController) forControlEvents:UIControlEventTouchUpInside];
        [_returenView.iconImageBtn addTarget:self action:@selector(imageBtnMethod) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returenView;
}
#pragma mark - 调用相机相册
//判断是从相册还是相机获取图片
-(void)imageBtnMethod{
    UIActionSheet * sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册中选择", nil];
    sheet.destructiveButtonIndex = -1;//设置那一个显示红色文字提示
    [sheet showInView:self.view];
}
-(PKPassWordView*)passwordView{
    if (!_passwordView) {
        _passwordView = [[PKPassWordView alloc]init];
        _passwordView.nameText.delegate = self;
        _passwordView.emailText.delegate = self;
        _passwordView.passwordText.delegate =self;
       [ _passwordView.paseBtn addTarget:self action:@selector(passwordHttpRequest) forControlEvents:UIControlEventTouchUpInside];
    }
    return _passwordView;
}
-(void)passwordHttpRequest{

    [_passwordView.emailText resignFirstResponder];
    [_passwordView.passwordText resignFirstResponder];
    [_passwordView.nameText resignFirstResponder];
     //判断用户名是否为空，isEmptyString方法是NSString + helper中的
    if ([_passwordView.nameText.text isEmptyString]) {
        
        [self.view makeToast:@"用户名不能为空" duration:1 position:@"center"];
    }else if ([_passwordView.passwordText.text isEmptyString]){
         //判断密码是否为空，isEmptyString方法是NSString + helper中的
        [self.view makeToast:@"密码不能为空" duration:1 position:@"center"];
        
    }else if ([_passwordView.emailText.text isEmptyString]){
        
          [self.view makeToast:@"邮箱不能为空" duration:1 position:@"center"];
    }else if ([_returenView.iconImageBtn.currentImage isEqual:[UIImage imageNamed:@"上传头像"] ]){
        [self.view makeToast:@"头像不能为空" duration:1 position:@"center"];
    }else{
        WS(weakSelf);
        //开始进行网络请求，上传头像到服务器
        [ZJPBaseHttpTool postImagePath:@"http://api2.pianke.me/user/reg" params:[self makeLoginRequestDic] image:_imageField   success:^(id JSON) {
            NSDictionary *returnDic = JSON;
            //判断是否成功，如果result为 1 ，注册成功，result为0，查看返回字典中data字段中msg的错误原因
            if ([returnDic[@"result"]integerValue] == 1) {
                 //成功后的提示框，方法在 UIView+Toast 中，第一个参数是提示的内容，第二个是显示时间，第三个是显示位置，一共有三
                [weakSelf.view makeToast:@"注册成功" duration:1 position:@"center"];
            } else {
                [weakSelf.view makeToast:[returnDic[@"data"]valueForKey:@"msg"] duration:1 position:@"center"];
            }
        
        } failure:^(NSError *error) {
            [weakSelf.view makeToast:@"注册失败" duration:1 position:@"center"];
        } ];
    }
}
//制作请求参数
- (NSDictionary *)makeLoginRequestDic{
    NSDictionary *dic = @{@"client":@"1",
                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"email":_passwordView.emailText.text,
                          @"gender":@"1",
                          @"passwd":_passwordView.passwordText.text,
                          @"uname":_passwordView.nameText.text,
                          @"version":@"3.0.6",
                          @"auth":@"",
                          @"iconfile":_imageField};
    return dic;
}

//actionSheet的代理方法,每一个buttonindex的点击事件
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    //相机选择
    if (buttonIndex == 0) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }else if(buttonIndex == 1){
        //相册选择
        UIImagePickerController *imagerPicker = [[UIImagePickerController alloc]init];
        imagerPicker.delegate = self;
        imagerPicker.allowsEditing = YES;
        [self presentViewController:imagerPicker animated:YES completion:nil];
    }
}
//UIImagePickerController的代理方法，选择好照片后会调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
      //获得图片
    UIImage *editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    //获取沙盒目录
    NSString *homePath = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    //将图片名字拼接到路径后面
    NSString *imageViews   = [homePath stringByAppendingFormat:@"/%d.png", arc4random_uniform(1000000)];
    //将图片写入沙盒
    [UIImageJPEGRepresentation(editedImage, 1.0f) writeToFile:imageViews atomically:YES];
    //将图片路径保存下来，因为在上传图片的时候会用到
    self.imageField = imageViews;
    //更新imageBtn的图片
    [_returenView.iconImageBtn setImage:editedImage forState:(UIControlStateNormal)];
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
//开始编辑的时候屏幕上移
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    WS(weakSelf);
    if (textField == _passwordView.nameText ) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 60;
            weakSelf.view.bounds = rect;
        }];
    }else if(textField == _passwordView.emailText ) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 80;
            weakSelf.view.bounds = rect;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 100;
            weakSelf.view.bounds = rect;
        }];
    }
    return YES;
}
-(void)pushToLandingViewController{
    PKLandingViewController * landing = [[PKLandingViewController alloc]init];
    [self presentViewController:landing animated:YES completion:nil];
    
}
//点击return键 键盘消失的方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    WS(weakSelf);
    [_passwordView.nameText resignFirstResponder];
    [_passwordView.emailText resignFirstResponder];
    [_passwordView.passwordText resignFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    return YES;
}
//点击屏幕键盘消失的方法
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{    WS(weakSelf);
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
