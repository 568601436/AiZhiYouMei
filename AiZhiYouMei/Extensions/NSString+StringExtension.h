//
//  NSString+StringExtension.h
//  OSell
//
//  Created by DongShaoHua on 15-2-4.
//  Copyright (c) 2015年 DZSOIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringExtension)

/**
 *  判断是否为空
 *  陈刚
 *  @param string 判断的值
 *
 *  @return BOOL
 */
+ (BOOL) isNullOrEmpty:(NSString *)string;
/**
 *  计算字符串的高度
 *
 *  @param maxwidth  最大宽度
 *  @param maxheight 最大高度
 *
 *  @return CGRect
 */
- (CGRect)getStringRectWith:(int)maxwidth maxheight:(int)maxheight;


- (CGRect) getStringRectWith:(int)maxwidth maxheight:(int)maxheight fontSize:(float)size;

- (NSString *)toMD5;


@end
