//
//  Request_AccessToken+sdk.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "Request_AccessToken+sdk.h"

@implementation Request_AccessToken (sdk)

- (instancetype)initWith:(YMCooperator *)cooperator
{
    self = [super init];
    if (self) {
        self.client_id = cooperator.clientId;
        self.code = cooperator.oauthCode;
        self.client_secret = cooperator.clientSecret;
        self.grant_type = @"authorization_code";
        self.redirect_uri = @"http://none";
    }
    return self;
}

@end
