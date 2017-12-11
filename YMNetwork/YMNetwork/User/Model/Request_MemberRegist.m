//
//  Request_MemberRegist.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "Request_MemberRegist.h"


@implementation Real_MemberRegist

- (instancetype)initWithAppId:(NSString *)appId account:(NSString *)account password:(NSString *)password verifyCode:(NSString *)verifyCode
{
    self = [super init];
    if (self) {
        _appid = appId;
        _account = account;
        _password = password;
        _vericode = verifyCode;
    }
    return self;
}
@end

@implementation Request_MemberRegist

- (instancetype)initWithOrgId:(NSString *)orgId appId:(NSString *)appId account:(NSString *)account password:(NSString *)password verifyCode:(NSString *)verifyCode
{
    self = [super init];
    if (self) {
        _orgId = orgId;
        _request = [[Real_MemberRegist alloc] initWithAppId:appId account:account password:password verifyCode:verifyCode];
    }
    return self;
}

@end
