//
//  YMManager+User.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMManager+User.h"
#import "NT_MemberRegist.h"

@implementation YMManager (User)

//+ (YMTask *)getLoginTaskWithAccount:(NSString *)account password:(NSString *)password completeHandler:(LoginBlock)handler{
//    NT_MemberLogin *task = [[NT_MemberLogin alloc] initWithAccount:account password:password];
//    task.completeHandler = handler;
//    
//    return task;
//}

+ (YMTask *)getRegisterTaskWithAccount:(NSString *)account password:(NSString *)password verifyCode:(NSString *)verifyCode completeHandler:(RegistMemberBlock)handler{
    NT_MemberRegist *task = [[NT_MemberRegist alloc] initWithAccount:account password:password verifyCode:verifyCode];
    task.completeHandler = handler;
    
    return task;
}

@end
