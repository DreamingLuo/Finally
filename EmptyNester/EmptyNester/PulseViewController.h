//
//  PulseViewController.h
//  EmptyNester
//
//  Created by shao on 16/5/16.
//  Copyright © 2016年 曹少帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PulseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *accessoryView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)sendMessage:(UIButton *)sender;

@end
