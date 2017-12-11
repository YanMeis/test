//
//  Request_MemberRegist.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Real_MemberRegist : NSObject
@property (nonatomic, copy) NSString *appid;
@property (nonatomic, copy) NSString *vericode;
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;
- (instancetype)initWithAppId:(NSString *)appId account:(NSString *)account password:(NSString *)password verifyCode:(NSString *)verifyCode;
@end

@interface Request_MemberRegist : NSObject

@property (nonatomic, copy) NSString *orgId;
@property (nonatomic, strong) Real_MemberRegist *request;

- (instancetype)initWithOrgId:(NSString *)orgId appId:(NSString *)appId account:(NSString *)account password:(NSString *)password verifyCode:(NSString *)verifyCode;

@end
