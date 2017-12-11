//
//  NT_MemberRegist.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "NT_MemberRegist.h"
#import "Request_MemberRegist.h"

@implementation NT_MemberRegist

- (instancetype)initWithAccount:(NSString *)account password:(NSString *)password verifyCode:(NSString *)verifyCode{
    self = [super init];
    if (self) {
        _account = account;
        _password = password;
        _verifyCode = verifyCode;
    }
    return self;
}

- (void)perform{
    YMCooperator *cooperator = [YMInformationCenter getInstance].cooperator;
    Request_MemberRegist *request = [[Request_MemberRegist alloc] initWithOrgId:cooperator.orgId appId:cooperator.clientId account:_account password:_password verifyCode:_verifyCode];
    self.netTask = [YMNetManager memberRegist:request delegate:self];
    [self.netTask async];
}

- (void)callback
{
    _completeHandler(self.result, _user);
}

- (void)memberRegistResult:(YMNetResult *)result response:(Response_MemberRegist *)response{
    if (result.result == Net_Ok) {
        _user = [[User alloc] initWithAccount:_account password:_password];
        _user.userId = response.id;
//        [DBHelper_User insertOrUpdateUser:_user];
        [self ok:@""];
    } else {
        [self netError:result];
    }
}

@end
