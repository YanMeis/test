//
//  NT_MemberRegist.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMBaseNetTask.h"
#import "User.h"

@interface NT_MemberRegist : YMBaseNetTask <Delegate_MemberRegist>

@property(nonatomic, copy)NSString *account;
@property(nonatomic, copy)NSString *password;
@property(nonatomic, copy)NSString *verifyCode;

@property(nonatomic, copy)User *user;
@property(nonatomic, strong) RegistMemberBlock completeHandler;

- (instancetype)initWithAccount:(NSString *)account password:(NSString *)password verifyCode:(NSString *)verifyCode;

@end
