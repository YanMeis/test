//
//  NetTask_MemberRegist.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMRealTask.h"
#import "Request_MemberRegist.h"
#import "Delegate_MemberRegist.h"

@interface NetTask_MemberRegist : YMRealTask

@property (nonatomic, weak) id<Delegate_MemberRegist> delegate;

- (instancetype)initWith:(Request_MemberRegist *)request delegate:(id<Delegate_MemberRegist>)delegate;

@end
