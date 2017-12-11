//
//  YMNetTask_AccessToken.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMNetTask_AccessToken.h"

@implementation YMNetTask_AccessToken

- (instancetype)initWith:(Request_AccessToken *)request delegate:(id<Delegate_AccessToken>)delegate{
    self = [super init];
    if (self) {
        self.request = request;
        self.delegate = delegate;
        self.requestType = HTTP_POST;
        self.url = @"oauth/accessToken";
    }
    return self;
}

- (void)handlResponse:(NSObject *)response{
    self.response = [Response_AccessToken mj_objectWithKeyValues:response];
}

- (void)callback{
    [_delegate accessTokenResult:self.result response:self.response];
}

@end
