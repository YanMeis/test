//
//  NetTask_MemberRegist.m
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "NetTask_MemberRegist.h"

@implementation NetTask_MemberRegist

- (instancetype)initWith:(Request_MemberRegist *)request delegate:(id<Delegate_MemberRegist>)delegate
{
    self = [super init];
    if (self) {
        self.request = request.request;
        self.delegate = delegate;
        self.requestType = HTTP_POST;
        self.url = [NSString stringWithFormat:@"open/1.0/org/%@/member/register", request.orgId];
    }
    return self;
}

- (void)handlResponse:(NSObject *)response
{
    self.response = [Response_MemberRegist mj_objectWithKeyValues:response];
}

- (void)callback
{
    [_delegate memberRegistResult:self.result response:self.response];
}

@end
