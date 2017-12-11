//
//  YMManager+User.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMManager.h"

@interface YMManager (User)

/**
 * 用户登录
 *
 * @param account 用户账号
 * @param password 密码
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
//+ (YMTask*)getLoginTaskWithAccount:(NSString *)account password:(NSString *)password completeHandler:(LoginBlock)handler;
+ (YMTask*)getRegisterTaskWithAccount:(NSString *)account password:(NSString *)password verifyCode:(NSString *)verifyCode completeHandler:(RegistMemberBlock)handler;

@end
