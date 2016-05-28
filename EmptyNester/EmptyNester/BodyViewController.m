//
//  BodyViewController.m
//  EmptyNester
//
//  Created by shao on 16/5/13.
//  Copyright © 2016年 曹少帅. All rights reserved.
//

#import "BodyViewController.h"
#import "TemperatureViewController.h"
#import "BPViewController.h"
#import "BGViewController.h"
#import "PulseViewController.h"
@interface BodyViewController ()
{
    NSArray* array;
    NSArray* arr;
}
@end

@implementation BodyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithWhite:0.772 alpha:1.000];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
    array = @[@"体温",@"血压",@"血糖",@"脉搏"];
    arr = @[@"单位：℃",@"单位：mmHg",@"单位：mmoL/L",@"单位：次／Sec"];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* str = @"cellFi";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1
                                     reuseIdentifier:str];
    }
   
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.detailTextLabel.text = arr[indexPath.row];
    cell.textLabel.text = array[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            TemperatureViewController* temperature = [[TemperatureViewController
                                         alloc]init];
            [self.navigationController pushViewController:temperature animated:YES];
            
        }
            break;
        case 1:
        {
            BPViewController* bloodPropress = [[BPViewController
                                                       alloc]init];
            [self.navigationController pushViewController:bloodPropress animated:YES];
            
        }
            break;
        case 2:
        {
            BGViewController* bg = [[BGViewController
                                                alloc]init];
            [self.navigationController pushViewController:bg animated:YES];
            
        }
            break;
        case 3:
        {
            PulseViewController* pulse = [[PulseViewController
                                                alloc]init];
            [self.navigationController pushViewController:pulse animated:YES];
            
        }
            break;
            
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
