//
//  UserDelegate.h
//  EmptyNester
//
//  Created by shao on 16/5/16.
//  Copyright © 2016年 曹少帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@protocol UserDelegate <NSObject>
-(void)setValue:(User*)userValue;
@end
