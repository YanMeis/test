//
//  YMNetTask_AccessToken.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMRealTask.h"
#import "Request_AccessToken.h"
#import "Delegate_AccessToken.h"

@interface YMNetTask_AccessToken : YMRealTask

@property(nonatomic, weak) id<Delegate_AccessToken> delegate;

- (instancetype)initWith:(Request_AccessToken *)request delegate:(id<Delegate_AccessToken>)delegate;

@end
