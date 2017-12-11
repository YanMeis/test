//
//  YMNetTask_Oauth.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMRealTask.h"
#import "Request_Oauth.h"
#import "Delegate_Oauth.h"

@interface YMNetTask_Oauth : YMRealTask

@property(nonatomic, weak) id<Delegate_Oauth> delegate;

- (instancetype)initWith:(Request_Oauth *)request delegate:(id<Delegate_Oauth>)delegate;

@end
