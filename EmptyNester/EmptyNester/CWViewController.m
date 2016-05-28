//
//  CWViewController.m
//  EmptyNester
//
//  Created by shao on 16/5/13.
//  Copyright © 2016年 曹少帅. All rights reserved.
//

#import "CWViewController.h"

static const int  K_NNGOV_WEBSITE_LABEL_URL;
static const int  K_NNWEIBO_LABEL_URL;

@interface CWViewController ()

@end

@implementation CWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.044 green:0.391 blue:0.379 alpha:1.000];
    self.navigationItem.title = @"碳水化合物";
    UILabel* label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 370, 600)];
    [label1 setText:@"       　碳水化合物易于消化吸收，是人体最重要的能源物质，能为人体提供大约70%的热能。老年人胰岛素对血糖的调节作用减弱，糖耐量低，故有血糖升高趋势。而且某些简单的碳水化合物过多摄入，在体内可转化为甘油三酯，易诱发高脂血症，所以老年人应控制糖果、精制甜点心摄入量，一般认为每天摄入蔗糖量不应超过30～50克。碳水化合物主要来源为淀粉，大部分可从粮食、薯类中获取;其次也可食用一些含果糖多的食物，如各种水果、蜂蜜、果酱等。碳水化合物的摄入量一般应占总热量的50～60%。"];
    label1.numberOfLines = 100;
    [label1 setTextColor:[UIColor colorWithRed:0.872 green:0.825 blue:0.666 alpha:1.000]];
    
    [self.view addSubview:label1];

    UILabel *labelGovUrl = [[UILabel alloc] initWithFrame:CGRectMake(73.0, 330.0, 180.0, 40.0)];
    labelGovUrl.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    labelGovUrl.text = @"侬侬官网 >";
    labelGovUrl.backgroundColor = [UIColor clearColor];
    labelGovUrl.textColor = [UIColor whiteColor];
    labelGovUrl.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    labelGovUrl.userInteractionEnabled = YES;
    labelGovUrl.tag = K_NNGOV_WEBSITE_LABEL_URL;
    
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openURL:)];
    [labelGovUrl addGestureRecognizer:tapGesture];
    [self.view addSubview:labelGovUrl];
}
-(void)openURL:(UITapGestureRecognizer *)gesture{
    NSInteger tag = gesture.view.tag;
    NSString *url = nil;
    if (tag == K_NNWEIBO_LABEL_URL) {
        url = @"http://t.qq.com/yourgame/";
    }
    if(tag == K_NNGOV_WEBSITE_LABEL_URL){
        url = @"http://www.zjnn.cn/";
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
