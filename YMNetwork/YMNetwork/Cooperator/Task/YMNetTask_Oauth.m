//
//  YMNetTask_Oauth.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMNetTask_Oauth.h"

@implementation YMNetTask_Oauth

- (instancetype)initWith:(Request_Oauth *)request delegate:(id<Delegate_Oauth>)delegate{
    self = [super init];
    if (self) {
        self.request = request;
        self.delegate = delegate;
        self.requestType = HTTP_GET;
        self.url = @"oauth/authorize";
    }
    return self;
}

- (void)handlResponse:(NSObject *)response{
    self.response = [Response_Oauth mj_objectWithKeyValues:response];
}

- (void)callback{
    [_delegate oauthResult:self.result response:self.response];
}

@end
