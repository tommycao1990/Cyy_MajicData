//
//  MDLoginViewController.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/12/1.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDLoginViewController.h"
#import "UserInfo.h"

@interface MDLoginViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField       *accountTextField;

@property (nonatomic, strong) UITextField       *passwordTextField;

@property (nonatomic, strong) UIButton          *loginButton;

@end

@implementation MDLoginViewController


#pragma mark -- Controller Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化主视图
    [self initMDLoginViewControllerView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:_passwordTextField];
    
    
}



- (UIStatusBarStyle)preferredStatusBarStyle {
        return UIStatusBarStyleLightContent;    //状态栏黑色
//    return UIStatusBarStyleDefault;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:_passwordTextField];
}


#pragma mark -- initView

- (void)initMDLoginViewControllerView
{
    UIImageView *backImageView = [[UIImageView alloc] init];
    backImageView.frame = CGRectMake(0, 0, kMainWidth, kMainHeight);
    [backImageView setImage:[UIImage imageNamed:@"LoginBG"]];
    [self.view addSubview:backImageView];
    
    UIView *maskView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, kMainHeight))];
    maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.7f];
    [self.view addSubview:maskView];
    
    
    UIImageView *logoImageView = [[UIImageView alloc] init];
    [logoImageView setImage:[UIImage imageNamed:@"Logo"]];
    [self.view addSubview:logoImageView];
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(35*kMainScaleMiunes);
        make.top.equalTo(self.view).offset(45*kMainScaleMiunes);
        make.size.mas_equalTo(CGSizeMake(45*kMainScaleMiunes, 45*kMainScaleMiunes));
    }];
    
    UILabel *hello = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_Clear Title:@"Hello!" Font:24*kMainScaleMiunes TextColor:KColor_White];
    [self.view addSubview:hello];
    [hello mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(logoImageView);
        make.top.equalTo(logoImageView.mas_bottom).offset(15*kMainScaleMiunes);
        make.height.equalTo(@(24*kMainScaleMiunes));
    }];
    
    UILabel *welcome = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_Clear Title:@"欢迎回来" Font:24*kMainScaleMiunes TextColor:KColor_White];
    [self.view addSubview:welcome];
    [welcome mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(35*kMainScaleMiunes);
        make.top.equalTo(hello.mas_bottom).offset(10*kMainScaleMiunes);
        make.height.equalTo(@(24*kMainScaleMiunes));
    }];
    
    UILabel *account = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_Clear Title:@"账号" Font:14*kMainScaleMiunes TextColor:KColor_White];
    [self.view addSubview:account];
    [account mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(welcome);
        make.top.equalTo(welcome.mas_bottom).offset(23*kMainScaleMiunes);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    _accountTextField = [[UITextField alloc] init];
    [_accountTextField setBackgroundColor:KColor_Clear];
    [_accountTextField setBorderStyle:(UITextBorderStyleNone)];
    [_accountTextField setPlaceholder:@"请输入账号"];
    [_accountTextField setValue:KColor_Gray_66 forKeyPath:@"_placeholderLabel.textColor"];
    [_accountTextField setFont:[UIFont systemFontOfSize:18*kMainScaleMiunes]];
    [_accountTextField setTextColor:KColor_White];
    _accountTextField.delegate = self;
    [self.view addSubview:_accountTextField];
    [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(welcome);
        make.top.equalTo(account.mas_bottom).offset(15*kMainScaleMiunes);
        make.height.equalTo(@(20*kMainScaleMiunes));
        make.right.equalTo(self.view).offset(-35*kMainScaleMiunes);
    }];
    
    UIView *topLine = [[UIView alloc] init];
    topLine.backgroundColor = [KColor_White colorWithAlphaComponent:0.3f];
    [self.view addSubview:topLine];
    [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(welcome);
        make.top.equalTo(_accountTextField.mas_bottom).offset(10*kMainScaleMiunes);
        make.height.equalTo(@(1));
        make.right.equalTo(self.view.mas_right).offset(-35*kMainScaleMiunes);
    }];
    
    UILabel *pwLabel = [MDNemoHelper getLabelPropertyWithBackgroundColor:KColor_Clear Title:@"密码" Font:14*kMainScaleMiunes TextColor:KColor_White];
    [self.view addSubview:pwLabel];
    [pwLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(welcome);
        make.top.equalTo(topLine.mas_bottom).offset(20*kMainScaleMiunes);
        make.height.equalTo(@(14*kMainScaleMiunes));
    }];
    
    _passwordTextField = [[UITextField alloc] init];
    [_passwordTextField setBackgroundColor:KColor_Clear];
    [_passwordTextField setBorderStyle:(UITextBorderStyleNone)];
    [_passwordTextField setPlaceholder:@"请输入密码"];
    [_passwordTextField setValue:KColor_Gray_66 forKeyPath:@"_placeholderLabel.textColor"];
    [_passwordTextField setFont:[UIFont systemFontOfSize:18*kMainScaleMiunes]];
    [_passwordTextField setTextColor:KColor_White];
    _passwordTextField.delegate = self;
    _passwordTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_passwordTextField];
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(welcome);
        make.top.equalTo(pwLabel.mas_bottom).offset(15*kMainScaleMiunes);
        make.height.equalTo(@(20*kMainScaleMiunes));
        make.right.equalTo(self.view).offset(-35*kMainScaleMiunes);
    }];
    
    UIView *downLine = [[UIView alloc] init];
    downLine.backgroundColor = [KColor_White colorWithAlphaComponent:0.3f];
    [self.view addSubview:downLine];
    [downLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(welcome);
        make.top.equalTo(_passwordTextField.mas_bottom).offset(10*kMainScaleMiunes);
        make.height.equalTo(@(1));
        make.right.equalTo(self.view.mas_right).offset(-35*kMainScaleMiunes);
    }];
    
    _loginButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_loginButton setTitle:@"登录" forState:(UIControlStateNormal)];
    _loginButton.backgroundColor = [KColor_Gray_66 colorWithAlphaComponent:.6f];
    [_loginButton setTitleColor:KColor_Gray_66 forState:(UIControlStateNormal)];
    _loginButton.layer.cornerRadius = 3.f;
    _loginButton.layer.masksToBounds = YES;
    [_loginButton addTarget:self action:@selector(loginButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_loginButton];
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(welcome);
        make.top.equalTo(downLine.mas_bottom).offset(15*kMainScaleMiunes);
        make.height.equalTo(@(38*kMainScaleMiunes));
        make.right.equalTo(self.view).offset(-35*kMainScaleMiunes);
    }];
    
    
}

#pragma mark -- Pravite method

- (void)loginButtonAction
{
    NSString   *aa = @"erji";
    NSString   *bb = @"erjiguanliyuan";
    [UserInfo postLoginIn:aa password:bb success:^(NSDictionary *resultObject) {
        UserInfo *member = [[UserInfo alloc] initWithDictionary:resultObject error:nil];
        NSLog(@"看看%@",member);
    } failure:^(NSError *requestErr) {
        
    }];
//    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)textFieldDidChange:(NSNotification *)notification
{
    
    UITextField *textfield = (UITextField *)notification.object;
    NSLog(@"%@",textfield.text);
    if (_accountTextField.text && textfield.text.length >= 6) {
        _loginButton.backgroundColor = [KColor_Main colorWithAlphaComponent:.6f];
        [_loginButton setTitleColor:KColor_White forState:(UIControlStateNormal)];
        
    }
}


#pragma mark -- TextField Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_accountTextField resignFirstResponder];
    
    [_passwordTextField resignFirstResponder];
    
}


@end
