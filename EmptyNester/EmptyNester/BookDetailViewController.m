//
//  BookDetailViewController.m
//  EmptyNester
//
//  Created by liman on 16/5/25.
//  Copyright © 2016年 曹少帅. All rights reserved.
//

#import "BookDetailViewController.h"
#import "ZDBtnView.h"
#import <iflyMSC/IFlyRecognizerViewDelegate.h>
#import <iflyMSC/IFlyRecognizerView.h>
#import <iflyMSC/IFlySpeechSynthesizer.h>
#import <iflyMSC/IFlySpeechConstant.h>
#import <iflyMSC/IFlySpeechUtility.h>
#import "PersonViewController.h"
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
#define BDHTTPURL @"http://apis.baidu.com/tngou/book/show"
#define APIKEY @"eeeabdbf5cc2ed8a6ece0399dbd00564"

@interface BookDetailViewController ()<IFlySpeechSynthesizerDelegate>
{
    NSDictionary* dic;/**<获取的Json数据*/
    NSArray* list;
    NSArray* btnImgArray;
    NSArray* btnTitleArray;
    IFlySpeechSynthesizer  * _iFlySpeechSynthesizer;
    NSString* tx;
    UIView* view;
    BOOL play;
    PersonViewController* person;
    ZDBtnView* btnView;
    UIView* start;
    UIView* stop;
    UIView* love;
    UIView* collect;
    UIButton* showView;


}
@end
static NSInteger listId=0;
@implementation BookDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //view.hidden=YES;
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(return1)];
    
    
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",@"57318ca7"];
    [IFlySpeechUtility createUtility:initString];
    _iFlySpeechSynthesizer = [IFlySpeechSynthesizer sharedInstance]; _iFlySpeechSynthesizer.delegate = self;
    
    [_iFlySpeechSynthesizer setParameter:@"50" forKey:[IFlySpeechConstant SPEED]];
    //音量;取值范围 0~100
    [_iFlySpeechSynthesizer setParameter:@"50" forKey: [IFlySpeechConstant VOLUME]];
    //发音人,默认为”xiaoyan”;可以设置的参数列表可参考个 性化发音人列表
    [_iFlySpeechSynthesizer setParameter:@" xiaoyan " forKey: [IFlySpeechConstant VOICE_NAME]];
    //音频采样率,目前支持的采样率有 16000 和 8000
    [_iFlySpeechSynthesizer setParameter:@"8000" forKey: [IFlySpeechConstant SAMPLE_RATE]];
    //asr_audio_path保存录音文件路径，如不再需要，设置value为nil表示取消，默认目录是documents
    [_iFlySpeechSynthesizer setParameter:@" tts.pcm" forKey: [IFlySpeechConstant TTS_AUDIO_PATH]];
    //[_iFlySpeechSynthesizer startSpeaking:@"老衲姓罗"];
    

    
    
    _bookContent=[[UIWebView alloc]initWithFrame:self.view.frame];
    _bookContent.backgroundColor=[UIColor whiteColor];
    
    
    NSLog(@"%@",[list[listId] objectForKey:@"message"]);
    [self.view addSubview:_bookContent];
    
    _backView=[[UIView alloc]initWithFrame:self.view.frame];
    _backView.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:_backView];

    _bookContent.hidden=YES;
    _backView.hidden=NO;
    
   _booklist=[[UITableView alloc]initWithFrame:CGRectMake(10, screen_height/5, screen_width-20, (screen_height/5)*4) style:UITableViewStylePlain];
    _booklist.dataSource=self;
    _booklist.delegate=self;
    
    [_backView insertSubview:_booklist belowSubview:self.bookName];
   
    
    view=[[UIView alloc]initWithFrame:CGRectMake(screen_width-100, 150,100 , screen_height-250)];
    //[_bookToolBar setBarStyle:UIBarStyleBlackTranslucent];
    view.backgroundColor=[UIColor grayColor];
    //_bookToolBar.hidden=NO;
     showView=[[UIButton alloc]initWithFrame:CGRectMake(screen_width-50, screen_height-150-(view.bounds.size.height)/2, 50, 50)];
    //showView.backgroundColor=[UIColor orangeColor];
    
    UIImage* image=[UIImage imageNamed:@"toolbar_exit@3x.png"];
    
    [showView setBackgroundImage:image forState: UIControlStateNormal];
    
    [showView addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
   // UITapGestureRecognizer *tap11 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pop)];
   // [view addGestureRecognizer:tap11];
    [_bookContent addSubview:showView];
    [_bookContent addSubview:view];
    view.hidden=YES;
    
    [self initData];
    //UITapGestureRecognizer* hiddenTool=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenToolBar)];
    //[hiddenTool setNumberOfTapsRequired:2];
    //[_bookContent addGestureRecognizer:hiddenTool];
    //_bookContent.userInteractionEnabled=YES;
    for (int i=0; i<4; i++)
    {
        
        CGRect frame=CGRectMake(20, i*(view.bounds.size.height)/4, screen_width/4,50);
        NSString* title=[btnTitleArray objectAtIndex:i];
        NSString* imageStr=btnImgArray[i];
        
        btnView=[[ZDBtnView alloc]initWithFrame:frame title:title imageStr:imageStr];
        btnView.backgroundColor=[UIColor grayColor];
        btnView.tag=100+i;
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnTap:)];
        [btnView addGestureRecognizer:tap];
        
        [view addSubview:btnView];

    }
}

-(void)pop
{
    
    if (view.hidden==NO) {
        view.hidden=YES;
        [UIView animateWithDuration:0.1 animations:^{
            showView.center=CGPointMake(showView.center.x+view.bounds.size.width, showView.center.y);
        }];

    }
    else
    {
    
        view.hidden=NO;
        [UIView animateWithDuration:0.3 animations:^{
            showView.center=CGPointMake(showView.center.x-view.bounds.size.width, showView.center.y);
        }];
        
        view.alpha=0.0f;
        view.transform=CGAffineTransformMakeTranslation(0, 200);
        start =[view viewWithTag:100];
        stop=[view viewWithTag:101];
        love=[view viewWithTag:102];
        collect=[view viewWithTag:103];
        
        
        start.transform=CGAffineTransformMakeTranslation(0, 200);
        stop.transform=CGAffineTransformMakeTranslation(0, 200);
        love.transform=CGAffineTransformMakeTranslation(0, 200);
        collect.transform=CGAffineTransformMakeTranslation(0, 200);
        [UIView animateWithDuration:0.5f delay:0.0f usingSpringWithDamping:0.7f initialSpringVelocity:0.7f options:0 animations:^{
            view.alpha=1.0f;
            view.transform=CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            
        }];
        
        
        [UIView animateWithDuration:0.5f delay:0.1f usingSpringWithDamping:0.7f initialSpringVelocity:0.7f options:0 animations:^{
            start.transform=CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            
        }];
        
        
        
        [UIView animateWithDuration:0.5f delay:0.2f usingSpringWithDamping:0.7f initialSpringVelocity:0.7f options:0 animations:^{
            stop.transform=CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            
        }];
        
        
        
        [UIView animateWithDuration:0.5f delay:0.3f usingSpringWithDamping:0.7f initialSpringVelocity:0.7f options:0 animations:^{
            love.transform=CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            
        }];
        [UIView animateWithDuration:0.5f delay:0.3f usingSpringWithDamping:0.7f initialSpringVelocity:0.7f options:0 animations:^{
            collect.transform=CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            
        }];
        
        
        
        
        
        

    
    
    
    
    }
    
    
    
   
    
   



}
-(void)return1
{
    if (play==YES)
    {
        [_iFlySpeechSynthesizer stopSpeaking];
    }

    person=[PersonViewController new];
    [self.navigationController pushViewController:person animated:YES];


}
-(void)initData
{
    btnImgArray=@[@"toolBar_sound@3x.png",@"toolbar_exit@3x.png",@"toolbar-text@3x.png",@"toolBar_day@3x.png"];
    btnTitleArray=@[@"开始",@"暂停",@"喜欢",@"收藏"];
}
#pragma mark - toolbarbtn
-(void)btnTap:(UITapGestureRecognizer *)sender
{
    switch (sender.view.tag)
    {
        case 100:
        {
            [_iFlySpeechSynthesizer startSpeaking:tx];
            play=YES;
        }
            break;
        case 101:
        {
            [_iFlySpeechSynthesizer stopSpeaking];
            play=NO;
        }
            break;
        case 102:
        {
            NSLog(@"哈哈");
            
         //[_iFlySpeechSynthesizer startSpeaking:tx];
        
        }
            break;
        case 103:
        {
            _backView.hidden=NO;
            _bookContent.hidden=YES;
        }
            break;
        default:
            break;
    }
}
#pragma mark - 隐藏toolbar
//-(void)hiddenToolBar
//{
//    if (_bookToolBar.hidden)
//    {
//        _bookToolBar.hidden=NO;
//    }else
//    {
//        _bookToolBar.hidden=YES;
//    }
//    //_bookToolBar.hidden=!_bookToolBar.hidden;
//}
#pragma mark - 懒加载

-(UILabel*)bookName
{
    if (!_bookName)
    {
        _bookName=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, screen_width, screen_height/5)];
        _bookName.textAlignment=NSTextAlignmentCenter;
        _bookName.font=[UIFont systemFontOfSize:16];
        
        [_backView addSubview:_bookName];
    }
    return _bookName;
}

#pragma mark - 协议
-(void)setValue:(NSString*) bookName AndId:(NSInteger)bookId
{
    self.bookName.text=bookName;
    self.boodId=bookId;
    [self request:self.boodId];
    
}
#pragma mark - 超文本
-(void)htmlTest:(NSString*)htmlSting
{
    [_bookContent loadHTMLString:htmlSting baseURL:nil];
}
#pragma mark - request
-(void)request:(NSInteger)arg
{
    NSString* httpArg=[NSString stringWithFormat:@"id=%ld",(long)arg];
    NSLog(@"%@",httpArg);
  
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", BDHTTPURL, httpArg];
        NSURL *url = [NSURL URLWithString: urlStr];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestReturnCacheDataElseLoad timeoutInterval: 10];
        
        [request setHTTPMethod: @"GET"];
        
        [request addValue: APIKEY forHTTPHeaderField: @"apikey"];
        
        NSURLSession* session=[NSURLSession sharedSession];
        
        NSURLSessionDataTask* dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error)
            {
                NSLog(@"出错了:%@",error);
            }else
            {
                
                dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                
                if (error)
                {
                    NSLog(@"转换失败:%@",error);
                }else
                {
                    list = [dic objectForKey:@"list"];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //回调或者说是通知主线程刷新，
                        
                        
                        [_booklist reloadData];
                        
                        
                    });
                }
            }
            
        }];
        
        [dataTask resume];
        
    });
    
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    _bookName=nil;
    
}
#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return list.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* booktitle=@"booktitle";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:booktitle];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:booktitle];
    }
    
    cell.textLabel.text=[list[list.count-1- indexPath.row] objectForKey:@"title"];
    cell.textLabel.font=[UIFont systemFontOfSize:16];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _backView.hidden=YES;
    _bookContent.hidden=NO;
    
    [self htmlTest:[list[list.count-1-indexPath.row] objectForKey:@"message"]];
    tx=[self filterHTML:[list[list.count-1-indexPath.row] objectForKey:@"message"]];
    NSLog(@"%@",tx);
}
#pragma mark - html文本转换成纯文本
-(NSString *)filterHTML:(NSString *)str
{
    NSScanner * scanner = [NSScanner scannerWithString:str];
    NSString * texts = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&texts];
        //替换字符
        str  =  [str  stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",texts] withString:@""];
    }
    
    return str;
}
- (void) onCompleted:(IFlySpeechError*) error
{
    
    NSLog(@"推送完成");
    //[_iFlySpeechSynthesizer startSpeaking:@"老衲姓罗"];
    
}


@end