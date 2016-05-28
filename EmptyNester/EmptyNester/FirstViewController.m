//
//  firstViewController.m
//  EmptyNester
//
//  Created by shao on 16/5/16.
//  Copyright © 2016年 曹少帅. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "User.h"
@interface firstViewController ()
{
    UITextField *name;
    UITextField *age;
    UITextField *sex;
    UITextField *address;
    UITextField *number;
}
@end

@implementation firstViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 下一个界面的返回按钮
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title = @"返回";
        
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    }
    return self;
}
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithWhite:0.772 alpha:1.000];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *lname = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, 100, 30)];
    //设置显示文字
    lname.text = @"姓 名：";
    //设置字体:粗体，正常的是 SystemFontOfSize
    lname.font = [UIFont boldSystemFontOfSize:16];
    //设置文字颜色
    lname.textColor = [UIColor blackColor];
    lname.textAlignment=NSTextAlignmentRight;
    [self.view addSubview:lname];
    
    UILabel *lage = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, 100, 30)];
    //设置显示文字
    lage.text = @"年 龄：";
    //设置字体:粗体，正常的是 SystemFontOfSize
    lage.font = [UIFont boldSystemFontOfSize:16];
    //设置文字颜色
    lage.textColor = [UIColor blackColor];
    lage.textAlignment=NSTextAlignmentRight;
    [self.view addSubview:lage];
    
    UILabel *lsex = [[UILabel alloc]initWithFrame:CGRectMake(10, 160, 100, 30)];
    //设置显示文字
    lsex.text = @"性 别：";
    //设置字体:粗体，正常的是 SystemFontOfSize
    lsex.font = [UIFont boldSystemFontOfSize:16];
    //设置文字颜色
    lsex.textColor = [UIColor blackColor];
    lsex.textAlignment=NSTextAlignmentRight;
    [self.view addSubview:lsex];
    
    UILabel *laddress = [[UILabel alloc]initWithFrame:CGRectMake(10, 200, 100, 30)];
    //设置显示文字
    laddress.text = @"地 址：";
    //设置字体:粗体，正常的是 SystemFontOfSize
    laddress.font = [UIFont boldSystemFontOfSize:16];
    //设置文字颜色
    laddress.textColor = [UIColor blackColor];
    laddress.textAlignment=NSTextAlignmentRight;
    [self.view addSubview:laddress];
    
    UILabel *lnum = [[UILabel alloc]initWithFrame:CGRectMake(10, 240, 100, 30)];
    //设置显示文字
    lnum.text = @"电 话：";
    //设置字体:粗体，正常的是 SystemFontOfSize
    lnum.font = [UIFont boldSystemFontOfSize:16];
    //设置文字颜色
    lnum.textColor = [UIColor blackColor];
    lnum.textAlignment=NSTextAlignmentRight;
    [self.view addSubview:lnum];
    
    name= [[UITextField alloc] initWithFrame:CGRectMake(110, 80, 200, 30)];
    [name setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    name.placeholder = @"请输入姓名"; //默认显示的字
    name.delegate = self;
    [self.view addSubview:name];
    
    age= [[UITextField alloc] initWithFrame:CGRectMake(110, 120, 200, 30)];
    [age setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    age.placeholder = @"请输入年龄"; //默认显示的字
    age.delegate = self;
    [self.view addSubview:age];
    
    sex= [[UITextField alloc] initWithFrame:CGRectMake(110, 160, 200, 30)];
    [sex setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    sex.placeholder = @"请输入性别"; //默认显示的字
    sex.delegate = self;
    [self.view addSubview:sex];
    
    address= [[UITextField alloc] initWithFrame:CGRectMake(110, 200, 200, 30)];
    [address setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    address.placeholder = @"请输入地址"; //默认显示的字
    address.delegate = self;
    [self.view addSubview:address];
    
    number= [[UITextField alloc] initWithFrame:CGRectMake(110, 240, 200, 30)];
    [number setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    number.placeholder = @"请输入联系方式"; //默认显示的字
    number.delegate = self;
    [self.view addSubview:number];
    
    UIButton *btnAdd=[[UIButton alloc] initWithFrame:CGRectMake(30, 340, 300, 30)];
    [btnAdd setTitle:@"设   置" forState:UIControlStateNormal];
    [btnAdd setTitle:@"提交中......" forState:UIControlStateHighlighted];
    
    [btnAdd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnAdd setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [btnAdd.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    btnAdd.backgroundColor = [UIColor redColor];
    [btnAdd addTarget:self action:@selector(LoginUser) forControlEvents :UIControlEventTouchUpInside];
    [self.view addSubview:btnAdd];
    
    
    // 创建自定义的触摸手势来实现对键盘的隐藏
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
    
}
//键盘的隐藏
-(void)viewTapped:(UITapGestureRecognizer*)tapGr{
    [name resignFirstResponder];
    [age resignFirstResponder];
    [sex resignFirstResponder];
    [address resignFirstResponder];
    [number resignFirstResponder];
}


//登陆并跳转
-(void)LoginUser{
    
    SecondViewController *tv=[[SecondViewController alloc] init];
    self.delegate=tv;
    
    User *user=[[User alloc] init];
    user.name = name.text;
    user.age = age.text;
    user.sex = sex.text;
    user.address = address.text;
    user.number = number.text;
    [self.delegate setValue:user];
    
    tv.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:tv  animated:YES];
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
