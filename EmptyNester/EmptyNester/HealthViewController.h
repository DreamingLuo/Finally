//
//  HealthViewController.h
//  EmptyNester
//
//  Created by shao on 16/5/12.
//  Copyright © 2016年 曹少帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* tableView;
- (IBAction)login:(UIBarButtonItem *)sender;
@property(nonatomic,strong)UISwitch* switchOpen;
@property(nonatomic,assign)BOOL isOpen;
@end
