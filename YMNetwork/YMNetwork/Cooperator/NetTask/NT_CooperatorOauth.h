//
//  NT_CooperatorOauth.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMBaseNetTask.h"
#import "Delegate_Oauth.h"

@interface NT_CooperatorOauth : YMBaseNetTask <Delegate_Oauth>

@property (nonatomic, strong) YMCooperator *cooperator;
//@property (nonatomic, copy) NSString *clientId;
//@property (nonatomic, copy) NSString *clientSecret;
@property (nonatomic, strong) SimpleBlock complete;

- (instancetype)initWithClientId:(NSString *)clientId secret:(NSString *)clientSecret complete:(SimpleBlock)handler;

@end
