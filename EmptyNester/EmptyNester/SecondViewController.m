//
//  SecondViewController.m
//  EmptyNester
//
//  Created by shao on 16/5/16.
//  Copyright © 2016年 曹少帅. All rights reserved.
//

#import "SecondViewController.h"
#import "User.h"
@interface SecondViewController ()
{
    UILabel *labelname ;
    UILabel *labelage ;
    UILabel *labelsex ;
    UILabel *labeladdress ;
    UILabel *labelnumber ;
    
    User *user;
}
@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
        self.view.backgroundColor = [UIColor colorWithWhite:0.772 alpha:1.000];
    //显示用户名
    labelname = [[UILabel alloc]initWithFrame:CGRectMake(50, 40, 200, 50)];
    labelname.text =[NSString stringWithFormat:@"姓   名：%@",user.name];
    //设置字体:粗体，正常的是 SystemFontOfSize
    labelname.font = [UIFont boldSystemFontOfSize:20];
    //设置文字颜色
    labelname.textColor = [UIColor blackColor];
    [self.view addSubview:labelname];
    
    labelage = [[UILabel alloc]initWithFrame:CGRectMake(50, 90, 200, 50)];
    //设置显示文字
    labelage.text = [NSString stringWithFormat:@"年   龄：%@",user.age];
    //设置字体:粗体，正常的是 SystemFontOfSize
    labelage.font = [UIFont boldSystemFontOfSize:20];
    //设置文字颜色
    labelage.textColor = [UIColor blackColor];
    [self.view addSubview:labelage];
    
    labelsex = [[UILabel alloc]initWithFrame:CGRectMake(50, 140, 200, 50)];
    //设置显示文字
    labelsex.text = [NSString stringWithFormat:@"年   龄：%@",user.age];
    //设置字体:粗体，正常的是 SystemFontOfSize
    labelsex.font = [UIFont boldSystemFontOfSize:20];
    //设置文字颜色
    labelsex.textColor = [UIColor blackColor];
    [self.view addSubview:labelsex];
    
    labelsex = [[UILabel alloc]initWithFrame:CGRectMake(50, 190, 200, 50)];
    //设置显示文字
    labelsex.text = [NSString stringWithFormat:@"性   别：%@",user.sex];
    //设置字体:粗体，正常的是 SystemFontOfSize
    labelsex.font = [UIFont boldSystemFontOfSize:20];
    //设置文字颜色
    labelsex.textColor = [UIColor blackColor];
    [self.view addSubview:labelsex];
    
    labeladdress = [[UILabel alloc]initWithFrame:CGRectMake(50, 240, 200, 50)];
    //设置显示文字
    labeladdress.text = [NSString stringWithFormat:@"地   址：%@",user.address];
    //设置字体:粗体，正常的是 SystemFontOfSize
    labeladdress.font = [UIFont boldSystemFontOfSize:20];
    //设置文字颜色
    labeladdress.textColor = [UIColor blackColor];
    [self.view addSubview:labeladdress];
    
    labelnumber = [[UILabel alloc]initWithFrame:CGRectMake(50, 290, 200, 50)];
    //设置显示文字
    labelnumber.text = [NSString stringWithFormat:@"电   话：%@",user.number];
    //设置字体:粗体，正常的是 SystemFontOfSize
    labelnumber.font = [UIFont boldSystemFontOfSize:20];
    //设置文字颜色
    labelnumber.textColor = [UIColor blackColor];
    [self.view addSubview:labelnumber];
    
    
    UIButton *btnAdd=[[UIButton alloc] initWithFrame:CGRectMake(20, 370, 300, 30)];
    [btnAdd setTitle:@"返    回" forState:UIControlStateNormal];
    [btnAdd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btnAdd.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    btnAdd.backgroundColor = [UIColor redColor];
    [btnAdd addTarget:self action:@selector(BackView) forControlEvents :UIControlEventTouchUpInside];
    [self.view addSubview:btnAdd];

}
-(void)BackView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)setValue:(User *)userValue{
    user=userValue;
}

@end
