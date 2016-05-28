//
//  firstViewController.h
//  EmptyNester
//
//  Created by shao on 16/5/16.
//  Copyright © 2016年 曹少帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDelegate.h"
@interface firstViewController : UIViewController<UITextFieldDelegate>
@property(assign,nonatomic)id<UserDelegate> delegate;
@end
