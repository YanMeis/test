//
//  YMBaseNetTask.h
//  YMNetwork
//
//  Created by 刘艳梅 on 2017/12/11.
//  Copyright © 2017年 刘艳梅. All rights reserved.
//

#import "YMBaseTask.h"

@interface YMBaseNetTask : YMBaseTask <Delegate_AccessToken>

@property(nonatomic, strong) YMNetTask *netTask;

- (void)netError:(YMNetResult *)result;

@end
