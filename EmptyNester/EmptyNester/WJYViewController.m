//
//  WJYViewController.m
//  EmptyNester
//
//  Created by shao on 16/5/13.
//  Copyright © 2016年 曹少帅. All rights reserved.
//

#import "WJYViewController.h"

static const int  K_NNGOV_WEBSITE_LABEL_URL;
static const int  K_NNWEIBO_LABEL_URL;

@interface WJYViewController ()

@end

@implementation WJYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.044 green:0.391 blue:0.379 alpha:1.000];
    self.navigationItem.title = @"无机盐";
    UILabel* label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 370, 600)];
    [label1 setText:@"       　因为老年人多有维生素D缺乏的现象，使钙质的吸收减少，所以50岁以上的人往往有骨质疏松症，特别是女性较多见。因此，老年人要多吃些含钙量较高的食物如骨头汤、牛奶等。患有骨质疏松症的老年人，每天可补充钙质2克。为了促进钙质的吸收，应多晒太阳，以增加体内的维生素D。　　水　　老年人的饮水量根据各自的需要而定，注意不要有意识地过多摄入。"];
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




@end
