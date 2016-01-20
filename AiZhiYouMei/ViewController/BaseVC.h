//
//  BaseVC.h
//  AiZhiYouMei
//
//  Created by OSellMobile on 16/1/12.
//  Copyright © 2016年 CGMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+StringExtension.h"
typedef enum
{
    Done
} RightButtonType;
@interface BaseVC : UIViewController

/**
 *  设置顶部返回按钮
 */
- (void)setBackButton;
/**
 *  设置顶部右边按钮
 *
 *  @param type 按钮类型
 */
- (void)setNavigationButton:(RightButtonType)type;
/**
 *  左边按钮回调事件
 *
 *  @param sender 按钮对象
 */
- (void)leftBarButtonClick:(UIButton *)sender;
/**
 *  右边按钮回调事件
 *
 *  @param sender 按钮对象
 */
- (void)rightBarButtonClick:(UIButton *)sender;
@end
