//
//  StringUtils.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtils : NSObject

+(BOOL)isPhone:(NSString*)name;

+(BOOL)isPhoneAreaCode:(NSString *)areaCode phoneName:(NSString*)name;

+(BOOL)isName:(NSString*)name;

+(BOOL)isEmail:(NSString*)name;

+(BOOL)isNull:(NSString*)string;

+ (NSData *)convertHexStrToData:(NSString *)str;
+ (NSString *)convertDataToHexStr:(NSData *)data from:(int)start to:(NSUInteger)end;

@end
