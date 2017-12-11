//
//  Request_Oauth+sdk.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "Request_Oauth+sdk.h"

@implementation Request_Oauth (sdk)

- (instancetype)initWith:(YMCooperator *)cooperator
{
    self = [super init];
    if (self) {
        self.client_id = cooperator.clientId;
        self.response_type = @"code";
        self.redirect_uri = @"http://none";
    }
    return self;
}

@end
